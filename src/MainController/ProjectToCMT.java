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
import MainBean.TieuBan;
import other.Other;

@Transactional
@Controller
@RequestMapping("/PTCMT/")
public class ProjectToCMT {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("show-cmt")
	public String openCMT(ModelMap model, HttpSession ss) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
//		model.addAttribute("year", year);
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM TieuBan where YEAR(ngay) = "+year;
		Query query = session.createQuery(hql);
		List<TieuBan> tieuBans = query.list();
		
		String hql1 = "FROM SinhVien sinhVien where sinhVien.diemTBTL >= 2.5 and sinhVien.doAn.nam= "+year+" and sinhVien.doAn.diemHD >= 5 and (diemHD + diemPB)/2 >= 5 order by diemTBTL DESC";
		Query q = session.createQuery(hql1);
		List<SinhVien> sinhViens = q.list();
		for(SinhVien i : sinhViens) {
			System.out.println(i.getMaSV());
		}
		
		model.addAttribute("tieuBans", tieuBans);
		model.addAttribute("sinhViens", sinhViens);
		other.checkLogin(ss, model);
		return "ProjectToCMT/prj-to-scmt";
	}
	
	@RequestMapping("add-cmt")
	public String addGVHDG(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("tieuban-list") int[] tieubanList) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			TieuBan tieuBan = (TieuBan)(session.get(TieuBan.class, tieubanList[i]));
			doAn.setTieuBan(tieuBan);
			try {
				session.update(doAn);
				transaction.commit();
			}
			catch (HibernateError e) {
				transaction.rollback();
				System.out.println("Loi khi cham diem huong dan (buoc 6): "+doAn.getMaDA());
			}
		}
		return "redirect:../CMT/index.htm";
	}
	
	
}
