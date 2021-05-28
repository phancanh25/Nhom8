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
	public String index(ModelMap model, HttpSession session) {
<<<<<<< HEAD
		other.checkLogin(session, model);
=======
		other.checkLogin(ss, model);
>>>>>>> 16b7d657e9ffe2a00101f65149c79575145def91
		ShowStudent(model);
		return "CMT/CMTGrade";
	}
	public void ShowStudent(ModelMap md) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien sinhVien where sinhVien.diemTBTL >= 2.5 and sinhVien.doAn.nam= "+year+" and sinhVien.doAn.diemHD >= 5 and (diemHD + diemPB)/2 >= 5 order by diemTBTL DESC";
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
			@RequestParam("diemCMT") Float[] diemCMTList) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			doAn.setDiemTB(diemCMTList[i]);
			try {
				session.update(doAn);
				transaction.commit();
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cham diem huong dan (buoc 7): "+doAn.getMaDA());
			}
		}
		return "a";
//		return "redirect:../ChoseGVPB/index.htm";
	}
	
	
}
