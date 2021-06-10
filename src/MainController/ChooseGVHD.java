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

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import other.Other;

@Transactional
@Controller
@RequestMapping("/ChoseGVHD/")
public class ChooseGVHD {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		ShowStudent(model);
		other.checkLogin(ss, model);
		return "GVHD/addGVHD";
	}
	
	
	
	public void ShowStudent(ModelMap model) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien where doAn.nam= "+year+" order by diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			for(SinhVien i : sinhViens) {
				System.out.println(i.getMaSV());
			}
			model.addAttribute("sinhViens", sinhViens);
			String hql1 = "FROM GiangVien";
			Query q1 = session.createQuery(hql1);
			List<GiangVien> giangViens = q1.list();
			model.addAttribute("giangViens", giangViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
	
	@RequestMapping("add-gvhd")
	public String addGVHDG(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("gvhd-list") String[] gvhdList,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			GiangVien gvhd = null;
			System.out.println("have");
			if(!gvhdList[i].equals("none")) gvhd = (GiangVien)(session.get(GiangVien.class, gvhdList[i]));
			doAn.setGVHD(gvhd);
			try {
				session.update(doAn);
				transaction.commit();
				model.addAttribute("message", "Thông báo: Chọn giảng viên hướng dẫn thành công");
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cham diem huong dan (buoc 4): "+doAn.getMaDA());
				model.addAttribute("message", "Thông báo: Có lỗi xảy ra: "+e.getMessage());
			}
		}
		ShowStudent(model);
		other.checkLogin(ss, model);
		return "GVHD/addGVHD";
	}
}
