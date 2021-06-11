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
import MainBean.TieuBan;
import other.Other;

@Transactional
@Controller
@RequestMapping("/CMT/")
public class CMTGrade {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model);
		ShowStudent(model);
		return "CMT/CMTGrade";
	}
	public void ShowStudent(ModelMap md) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien where doAn.nam= "+year+" and doAn.tieuBan is not null order by diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			for(SinhVien i : sinhViens) {
				System.out.println(i.getMaSV());
			}
			md.addAttribute("sinhViens", sinhViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
	
	@RequestMapping("cmt-grade")
	public String GVPBGrade(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("diemCMT") Float[] diemCMTList,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			doAn.setDiemTB(diemCMTList[i]);
			try {
				session.update(doAn);
				transaction.commit();
				model.addAttribute("message", "Thông báo: Chấm điểm tiểu ban thành công");
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cham diem huong dan (buoc 7): "+doAn.getMaDA());
				model.addAttribute("message", "Thông báo: Chấm điểm hướng dẫn thành công");
			}
		}
		session.close();
		other.checkLogin(ss, model);
		ShowStudent(model);
		return "CMT/CMTGrade";
	}
	
	
}
