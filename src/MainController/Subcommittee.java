package MainController;

import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateError;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.Lock;
import MainBean.TieuBan;
import other.Other;

@Controller
@Transactional
public class Subcommittee {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("subcommittee")
	public String openSCMT(ModelMap model, HttpSession ss) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		model.addAttribute("year", year);
		Session session = factory.getCurrentSession();
		//Kiem tra xem nam nay co lock chua, neu co roi thi an cac nut sua, xoa tieu ban
		Lock lock = (Lock)(session.get(Lock.class, year));
		if(lock != null)model.addAttribute("lock", "have");
		
		//Tim nhung tieu ban attt nam hien tai
		String hql = "FROM TieuBan where YEAR(ngay) = "+year+" and chuyenNganh = 'ATTT'";
		Query query = session.createQuery(hql);
		List<TieuBan> tieuBanATTTs = query.list();
		
		//Tim nhung tieu ban cntt nam hien tai
		hql = "FROM TieuBan where YEAR(ngay) = "+year+" and chuyenNganh = 'CNTT'";
		query = session.createQuery(hql);
		List<TieuBan> tieuBanCNTTs = query.list();
		
		//Tim nhung tieu ban cndpt nam hien tai
		hql = "FROM TieuBan where YEAR(ngay) = "+year+" and chuyenNganh = 'CNDPT'";
		query = session.createQuery(hql);
		List<TieuBan> tieuBanCNDPTs = query.list();
		
		//Xuat toan bo giang vien trong phan them giang vien
		hql = "FROM GiangVien";
		query = session.createQuery(hql);
		List<GiangVien> giangViens = query.list();
		
		model.addAttribute("tieuBanATTTs", tieuBanATTTs);
		model.addAttribute("tieuBanCNTTs", tieuBanCNTTs);
		model.addAttribute("tieuBanCNDPTs", tieuBanCNDPTs);
		model.addAttribute("giangViens", giangViens);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "assignment/subcommittee";
	}
	
	@RequestMapping("scmt-add")
	public String scmtAdd(@RequestParam("select") String[] select, 
			@RequestParam("tenTB") String tenTB, 
			@RequestParam("diaDiem") String diaDiem,
			@RequestParam("ngay") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngay, 
			@RequestParam("gio") @DateTimeFormat(pattern="hh:mm") Date gio, 
			@RequestParam("chuyenNganh") String chuyenNganh) {
		System.out.println(chuyenNganh);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DoAn> doAns = null;
		
		//Tao danh sach giang vien cua tieu ban
		List<GiangVien> giangViens = new ArrayList<>();
		for(String i: select) {
			GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, i));
			if(giangVien != null) giangViens.add(giangVien);
		}
		TieuBan tieuBan = new TieuBan<>(tenTB, chuyenNganh, ngay, gio, diaDiem, doAns, giangViens);
		try {
			session.save(tieuBan);
			transaction.commit();
			System.out.println("Them tieu ban thanh cong");
		}
		catch (HibernateException e) {
			transaction.rollback();
			System.out.println("them tieu ban loi: "+e.getMessage());
		}
		finally {
			session.close();
		}
		return "redirect:subcommittee.htm";
	}
	
	@RequestMapping("scmt-edit")
	public String scmtEdit(@RequestParam("select") String[] select, @RequestParam("maTB") int maTB,
			@RequestParam("diaDiem") String diaDiem,
			@RequestParam("ngay") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngay, 
			@RequestParam("gio") @DateTimeFormat(pattern="hh:mm") Date gio, 
			@RequestParam("chuyenNganh") String chuyenNganh) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		TieuBan tieuBan = (TieuBan)(session.get(TieuBan.class, maTB));
		List<GiangVien> giangViens = new ArrayList<>();
		for(String i: select) {
			GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, i));
			if(giangVien != null) giangViens.add(giangVien);
		}
		tieuBan.setGiangViens(giangViens);
		tieuBan.setGio(gio);
		tieuBan.setNgay(ngay);
		tieuBan.setDiaDiem(diaDiem);
		tieuBan.setChuyenNganh(chuyenNganh);
		try {
			session.update(tieuBan);
			transaction.commit();
			System.out.println("Ch???nh s???a ti???u ban th??nh c??ng");
		}
		catch (HibernateException e) {
			transaction.rollback();
			System.out.println("Ch???nh s???a ti???u ban th???t b???i");
		}
		finally {
			session.close();
		}
		return "redirect:subcommittee.htm";
	}
	
	
	@RequestMapping("scmt-delete")	
	public String scmtDelete(@RequestParam("maTB") int maTB) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		TieuBan tieuBan = (TieuBan)(session.get(TieuBan.class, maTB));
		try {
			session.delete(tieuBan);
			transaction.commit();
			System.out.println("X??a ti???u ban th??nh c??ng");
		}
		catch (HibernateException e) {
			transaction.rollback();	
			System.out.println("X??a ti???u ban th???t b???i");
		}
		finally {
			session.close();
		}
		return "redirect:subcommittee.htm"; 
	}
	
	@RequestMapping("event-create")
	public String eventCreate(ModelMap model) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		byte[] picture = null;
		String detail = null;
		Lock lock = new Lock(year, false, true, true, true, true, true, true, true, picture, detail);
		
		try {
			session.save(lock);
			transaction.commit();
			System.out.println("Th??m k??? b???o v??? th??nh c??ng "+lock.getYear());
			session.close();
		}
		
		catch (HibernateException e) {
			transaction.rollback();
			System.out.println("Th??m k??? b???o v??? th???t b???i 	"+ e.getMessage());
			session.close();
			model.addAttribute("message", "Th??m k??? b???o v??? th???t b???i "+ e.getMessage());
			return "error/error";
		}
		return "redirect:assignment.htm";
	}
	
	@RequestMapping("event-cancel")
	public String cancelAddEvent(ModelMap model){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		//Xoa het cac tieu ban & xoa lock
		int year = Calendar.getInstance().get(Calendar.YEAR);
		Lock lock = (Lock)(session.get(Lock.class, year));
		String hql = "FROM TieuBan where YEAR(ngay) = "+year;
		Query query = session.createQuery(hql);
		List<TieuBan> tieuBans = query.list();
		try {
			if(lock!=null) session.delete(lock);
			for(TieuBan tieuBan: tieuBans) {
				session.delete(tieuBan);
			}
			transaction.commit();
		}
		catch(HibernateException e){
			transaction.rollback();
			model.addAttribute("message", "???? c?? l???i x???y ra: "+e.getMessage());
			return "error/error";
		}
		finally {
			session.close();
		}
		return "redirect:assignment.htm";
	}
	
}
