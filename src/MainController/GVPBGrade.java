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
@RequestMapping("/GVPB/")
public class GVPBGrade {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model);
		ShowStudent(model, ss);
		return "GVPB/GVPBGrade";
	}
	public void ShowStudent(ModelMap model, HttpSession ss) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String userCode = (String)ss.getAttribute("code");
			String hql = "FROM SinhVien where doAn.nam= "+year+" and doAn.GVPB is not null order by diemTBTL DESC";
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
	
	@RequestMapping("gvpb-grade")
	public String GVPBGrade(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("diemPB") Float[] diemPBList,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			doAn.setDiemPB(diemPBList[i]);
			try {
				session.update(doAn);
				transaction.commit();
				model.addAttribute("message", "Thông báo: Chấm điểm phản biện thành công");
			}
			catch (HibernateError e) {
				transaction.rollback();
				model.addAttribute("message", "Thông báo: Có lỗi xảy ra: "+e.getMessage());
			}
		}
		session.close();
		other.checkLogin(ss, model);
		ShowStudent(model, ss);
		return "GVPB/GVPBGrade";
	}
	
}