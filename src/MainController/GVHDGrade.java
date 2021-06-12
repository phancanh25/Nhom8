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
import MainBean.SinhVien;
import other.Other;

@Transactional
@Controller
@RequestMapping("/GVHD/")
public class GVHDGrade {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model, factory.getCurrentSession());
		ShowStudent(model, ss);
		return "GVHD/GVHDGrade";
	}
	
	
	public void ShowStudent(ModelMap model, HttpSession ss) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String userCode = (String)ss.getAttribute("code");
			String hql = "FROM SinhVien where doAn.nam= "+year+" and doAn.GVHD.maGV = '"+userCode+"' order by diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			for(SinhVien i : sinhViens) {
				System.out.println(i.getMaSV());
			}
			model.addAttribute("sinhViens", sinhViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
		
	}
	
	@RequestMapping("gvhd-grade")
	public String GVHDGrade(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("diemHD") Float[] diemHDList, ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			doAn.setDiemHD(diemHDList[i]);
			try {
				session.update(doAn);
				transaction.commit();
				model.addAttribute("message", "Thông báo: Chấm điểm hướng dẫn thành công");
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cham diem huong dan (buoc 3): "+doAn.getMaDA());
				model.addAttribute("message", "Thông báo: Có lỗi xảy ra: "+e.getMessage());
			}
		}
		other.checkLogin(ss, model, factory.getCurrentSession());
		ShowStudent(model, ss);
		return "GVHD/GVHDGrade";
	}
}
