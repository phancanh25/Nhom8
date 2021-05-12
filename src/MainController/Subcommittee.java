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
import MainBean.TieuBan;

@Controller
@Transactional
public class Subcommittee {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("subcommittee")
	public String openSCMT(ModelMap model, HttpSession ss) {
		if(ss.getAttribute("user") != null) {
			System.out.println("user ko null");
			model.addAttribute("username", ss.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			model.addAttribute("username", "");
		}
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		model.addAttribute("year", year);
		
		Session session = factory.getCurrentSession();
		
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
		return "assignment/subcommittee";
	}
	
	@RequestMapping("scmt-add")
	public String scmtAdd(@RequestParam("select") String[] select, @RequestParam("maTB") int maTB, 
			@RequestParam("tenTB") String tenTB, 
			@RequestParam("khoa") int khoa, @RequestParam("diaDiem") String diaDiem,
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
			giangViens.add(giangVien);
		}
//		TieuBan tt = new TieuBan<>(maTB, tenTB, chuyenNganh, ngay, gio, diaDiem, khoa, doAn, giangViens);
		TieuBan tieuBan = new TieuBan<>(maTB, tenTB, chuyenNganh, ngay, gio, diaDiem, khoa, doAns, giangViens);
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
		
		session = factory.getCurrentSession();
		TieuBan tam = (TieuBan)(session.get(TieuBan.class, maTB));
		System.out.println("day ne: ");
		List<GiangVien> gvTams = tam.getGiangViens();
		for(GiangVien i: gvTams) {
			System.out.println(i.getMaGV());
		}
		
		return "redirect:subcommittee.htm";
	}
	
	@RequestMapping("scmt-edit")
	public String scmtEdit(@RequestParam("select") String[] select, @RequestParam("maTB") int maTB) {
//		System.out.println("matb ne: "+maTB);
//		for(String i: select) {
//			System.out.println(i);
//		}
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		TieuBan tieuBan = (TieuBan)(session.get(TieuBan.class, maTB));
		List<GiangVien> giangViens = new ArrayList<>();
		for(String i: select) {
			GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, i));
			giangViens.add(giangVien);
		}
		tieuBan.setGiangViens(giangViens);
		
		try {
			session.update(tieuBan);
			transaction.commit();
			System.out.println("Chỉnh sửa tiểu ban thành công");
		}
		catch (HibernateException e) {
			transaction.rollback();
			System.out.println("Chỉnh sửa tiểu ban thất bại");
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
			System.out.println("Xóa tiểu ban thành công");
		}
		catch (HibernateException e) {
			transaction.rollback();	
			System.out.println("Xóa tiểu ban thất bại");
		}
		finally {
			session.close();
		}
		return "redirect:subcommittee.htm"; 
	}
	
	
}