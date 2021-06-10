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
@RequestMapping("/addProject/")

public class AddProject {
	Other other = new Other();
	@Autowired
	SessionFactory factory;

	@RequestMapping("showProject")
	public String showStudent(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model);
		ShowStudent(model, ss);
		return "addProject/add-project";
	}
	
	@RequestMapping("add-pro-for-stu")
	public String AddProForStu(@RequestParam("tenDA") String[] listTenDA,
			@RequestParam("chiTietDA") String[] listCTDA, 
			@RequestParam("maDA") int[] maDAList,
			ModelMap model, HttpSession ss) {
		
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			doAn.setTenDA(listTenDA[i]);
			doAn.setChiTiet(listCTDA[i]);
			try {
				session.update(doAn);
				transaction.commit();
				model.addAttribute("message", "Thông báo: Chọn đề tài thành công");
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cap nhat do an(buoc 2): "+doAn.getMaDA());
				model.addAttribute("message", "Thông báo: Đã xảy ra lỗi: "+ e.getMessage());
			}
		}
		session.close();
		other.checkLogin(ss, model);
		ShowStudent(model, ss);
		return "addProject/add-project";
	}
	
	
	
	public void ShowStudent(ModelMap model, HttpSession ss) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String userCode = (String)ss.getAttribute("code");
			System.out.println("usercode: "+userCode);
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
	
	
}
