package MainController;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateError;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mchange.v2.encounter.StrongEqualityEncounterCounter;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import MainBean.TieuBan;
import other.Other;

@Transactional
@Controller
@RequestMapping("/addStudent/")
public class AddStuToCMT {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model);
		return "addStudent/add-student";	
	}
	
	@RequestMapping("showStudent")
	public String showStudent(ModelMap model, HttpSession ss) {
		ShowStudent(model);
		other.checkLogin(ss, model);
		return "addStudent/add-student";
	}
	
	public void ShowStudent(ModelMap model) {
		try {
			int year = Calendar.getInstance().get(Calendar.YEAR);
			Session session = factory.getCurrentSession();
			//Loc ra nhung sinh vien du diem tich luy va chua co do an hoac nhung sinh vien da co do an trong nam nay (de chinh sua)
			String hql = "FROM SinhVien where diemTBTL >= 2.5 ORDER BY diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			for(int i = 0 ; i<sinhViens.size(); i++) {
				if(sinhViens.get(i).getDoAn() != null && sinhViens.get(i).getDoAn().getNam() != year) {
					sinhViens.remove(i);
					i -= 1;
				}
			}
			String hql1 = "FROM GiangVien";
			Query q1 = session.createQuery(hql1);
			List<GiangVien> giangViens = q1.list();
			model.addAttribute("giangViens", giangViens);
			model.addAttribute("sinhViens", sinhViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
	
	@RequestMapping("add-stu-to-event")
	public String addStuToEvent(@RequestParam("student-list") String[] studentList, 
			@RequestParam("student-choose") String[] studentChoose, 
			@RequestParam("gvhd-list") String[] gvhdList, ModelMap model, HttpSession ss) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		System.out.println(gvhdList.length);
		System.out.println(studentList.length);
		for(int i = 0 ; i<studentList.length; i++) {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			//Chon sinh vien thi them do an cho sinh vien do
			if(studentChoose[i].equals("choose")) {
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, studentList[i]));
				GiangVien gvhd = (GiangVien)(session.get(GiangVien.class, gvhdList[i]));
				GiangVien gvpb = null;
				TieuBan tieuBan = null;
				//Neu sinh vien co do an roi thi next
				if(sinhVien.getDoAn() != null) continue;
				DoAn doAn = new DoAn("", "", gvhd, gvpb, (float)0, (float)0, (float)0, (float)0, year, tieuBan, sinhVien);
				sinhVien.setDoAn(doAn);
				try {
					session.save(doAn);
					session.update(sinhVien);
					transaction.commit();
					model.addAttribute("message", "Thông báo: Chọn sinh viên làm đồ án thành công");
				}
				catch (HibernateError e) {
					transaction.rollback();
					System.out.println("Loi khi luu do an: "+doAn.getMaDA());
					model.addAttribute("message", "Thông báo: Đã xảy ra lỗi: "+e.getMessage());
				}
				finally {
					session.close();
				}
			}
			//Bo chon sinh vien thi xoa do an cua sinh vien do
			else {
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, studentList[i]));
				if(sinhVien.getDoAn() == null) continue;
				DoAn doAn = (DoAn)(session.get(DoAn.class, sinhVien.getDoAn().getMaDA()));
				DoAn doAnNull = null;
				sinhVien.setDoAn(doAnNull);
				try {
					session.update(sinhVien);
					session.delete(doAn);
					transaction.commit();
					model.addAttribute("message", "Thông báo: Chọn sinh viên làm đồ án thành công");
				}
				catch (HibernateError e) {
					transaction.rollback();
					System.out.println("Loi khi luu do an: "+doAn.getMaDA());
					model.addAttribute("message", "Thông báo: Đã xảy ra lỗi: "+e.getMessage());
				}
				finally {
					session.close();
				}
			}
		}
		
		ShowStudent(model);
		other.checkLogin(ss, model);
		return "addStudent/add-student";
	}
	
	
}
