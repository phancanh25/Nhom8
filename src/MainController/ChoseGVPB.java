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

@Transactional
@Controller
@RequestMapping("/ChoseGVPB/")
public class ChoseGVPB {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
		ShowStudent(md);
		
		return "GVPB/addGVPB";
	}
	
	
	
	public void ShowStudent(ModelMap md) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien sinhVien where sinhVien.diemTBTL >= 2.5 and sinhVien.doAn.nam= "+year+" and sinhVien.doAn.diemHD >= 5  order by diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			for(SinhVien i : sinhViens) {
				System.out.println(i.getMaSV());
			}
			md.addAttribute("sinhViens", sinhViens);
			String hql1 = "FROM GiangVien";
			Query q1 = session.createQuery(hql1);
			List<GiangVien> giangViens = q1.list();
			md.addAttribute("giangViens", giangViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
	
	@RequestMapping("add-gvpb")
	public String addGVHDG(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("gvpb-list") String[] gvpbList) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			GiangVien gvpb = (GiangVien)(session.get(GiangVien.class, gvpbList[i]));
			doAn.setGVPB(gvpb);
			try {
				session.update(doAn);
				transaction.commit();
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cham diem huong dan (buoc 4): "+doAn.getMaDA());
			}
		}
		return "redirect:../GVPB/index.htm";
	}
}
