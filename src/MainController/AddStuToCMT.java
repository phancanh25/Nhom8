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
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien where diemTBTL >= 2.5 order by diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
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
			@RequestParam("gvhd-list") String[] gvhdList) {
		Session session = factory.openSession();
		int year = Calendar.getInstance().get(Calendar.YEAR);
		for(int i =0; i<studentList.length; i++) {
			Transaction transaction = session.beginTransaction();
			GiangVien gvhd = (GiangVien)(session.get(GiangVien.class, gvhdList[i]));
			GiangVien gvpb = null;
			TieuBan tieuBan = null;
			SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, studentList[i]));
			DoAn doAn = new DoAn("", "", gvhd, gvpb, (float)0, (float)0, (float)0, (float)0, year, tieuBan, sinhVien);
			sinhVien.setDoAn(doAn);
			try {
				session.save(doAn);
				session.update(sinhVien);
				transaction.commit();
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi luu do an: "+doAn.getMaDA());
			}
		}
		session.close();

		return "redirect:../addProject/showProject.htm";
	}
	
	
}
