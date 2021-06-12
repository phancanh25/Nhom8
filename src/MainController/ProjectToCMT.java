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
		other.checkLogin(ss, model, factory.getCurrentSession());
		showCMT(model, ss);
		return "ProjectToCMT/prj-to-scmt";
	}
	
	public void showCMT(ModelMap model, HttpSession ss) {
			//Loc sinh vien
			int year = Calendar.getInstance().get(Calendar.YEAR);
			Session session = factory.getCurrentSession();
			String hql = "FROM TieuBan where YEAR(ngay) = "+year;
			Query query = session.createQuery(hql);
			List<TieuBan> tieuBans = query.list();
			
			//Lay tieu ban
			String hql1 = "FROM SinhVien sinhVien where sinhVien.diemTBTL >= 2.5 and sinhVien.doAn.nam= "+year+" and sinhVien.doAn.diemHD >= 5 and (diemHD + diemPB)/2 >= 5 order by diemTBTL DESC";
			Query q = session.createQuery(hql1);
			List<SinhVien> sinhViens = q.list();
			model.addAttribute("tieuBans", tieuBans);
			model.addAttribute("sinhViens", sinhViens);
	}
	
	@RequestMapping("add-cmt")
	public String addGVHDG(@RequestParam("maDA") int[] maDAList, 
			@RequestParam("tieuban-list") int[] tieubanList,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		for(int i = 0 ; i<maDAList.length; i++) {
			Transaction transaction = session.beginTransaction();
			DoAn doAn = (DoAn)(session.get(DoAn.class, maDAList[i]));
			TieuBan tieuBan = null;
			if(tieubanList[i] != 0)tieuBan = (TieuBan)(session.get(TieuBan.class, tieubanList[i]));
			doAn.setTieuBan(tieuBan);
			try {
				session.update(doAn);
				transaction.commit();
				model.addAttribute("message", "Thông báo: Chọn tiểu ban thành công");
			}
			catch (HibernateError e) {
				transaction.rollback();
				model.addAttribute("message", "Thông báo: Có lỗi xảy ra: "+e.getMessage());
			}
		}
		session.close();
		other.checkLogin(ss, model, factory.getCurrentSession());
		showCMT(model, ss);
		return "ProjectToCMT/prj-to-scmt";
	}
	
	
}
