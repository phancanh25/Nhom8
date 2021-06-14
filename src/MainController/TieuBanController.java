package MainController;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Generated;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import MainBean.TieuBan;
import other.Other;

@Transactional
@Controller
@RequestMapping("tieuban/")
public class TieuBanController {
	Other other = new Other();
	@Autowired
	SessionFactory factory;

//	@RequestMapping("tieuban/{id}")
//	public String openTieuban(@PathVariable int id, ModelMap md) {
//		showTieuBan(id, md);
//		return "event/event-info";
//	}
//
//	private void showTieuBan(int id, ModelMap md) {
//		try {
//			Session session = factory.getCurrentSession();
//			String hql = "FROM TieuBan where MaTB = " + id;
//			Query q = session.createQuery(hql);
//			List<TieuBan> tieuBans = q.list();
//			TieuBan i = tieuBans.get(0);
//			System.out.println(i.getMaTB());
//			List<GiangVien> x = i.getGiangViens();
//
//			for (GiangVien y : x) {
//				System.out.println("Ma GV: " + y.getMaGV());
//				System.out.println("Ten GV: " + y.getTen());
//			}
//			md.addAttribute("giangVien", x);
//		} catch (Exception e) {
//			System.out.println("loi: " + e.getMessage());
//		}
//	}
	
	@RequestMapping("tieuban1")
	public String openTieuban(ModelMap md) {
		showTieuBan1(md);
		return "event/event-info";
	}

	private void showTieuBan1(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM TieuBan";
			
			Query q = session.createQuery(hql);
			List<TieuBan> tieuBans = q.list();
			for(TieuBan i : tieuBans) {
				System.out.println(i.getMaTB());
			}
			md.addAttribute("tieuBans", tieuBans);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}	
	}

	
	
	
	@RequestMapping("add-tieuban")
	public String addTieuBan(ModelMap model, @RequestParam("tenTB") String tenTB,
			@RequestParam("chuyenNganh") String chuyenNganh,
			@RequestParam("ngay") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngay,
			@RequestParam("gio") @DateTimeFormat(pattern = "hh:mm:ss") Time gio,
			@RequestParam("diaDiem") String diaDiem, @RequestParam("khoa") int khoa,
			HttpSession ss) {
		
		List<DoAn> doAns = null;
		List<GiangVien> giangViens = null;

		TieuBan tieuBan = new TieuBan(tenTB, chuyenNganh, ngay, gio, diaDiem, khoa, doAns, giangViens);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(tieuBan);
			t.commit();
			model.addAttribute("message", "Thêm tiểu ban thành công!!!");
			System.out.println("Thêm tiểu ban thành công!!!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm tiểu ban thất bại!!!" + e.getMessage());
			System.out.println("Thêm tiểu ban thất bại!!! " + e.getMessage());
		} finally {
			session.close();
		}

		System.out.println(tenTB);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "tieuban/showtb";
	}
}
