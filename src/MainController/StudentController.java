package MainController;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cache.spi.CacheKey;
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
@RequestMapping("student/")
public class StudentController {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("student")
	public String openStudent(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model, factory.getCurrentSession());
		showStudent(model);
		return "student/student";
	}
	
	public void showStudent(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			System.out.println("Hello");
			for(SinhVien i : sinhViens) {
				System.out.println(i.getMaSV());
			}
			md.addAttribute("sinhViens", sinhViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
	
	@RequestMapping("add-student")
	public String addStudent(ModelMap model,@RequestParam("maSV") String maSV, @RequestParam("phai") boolean phai,
			@RequestParam("khoa") int khoa, @RequestParam("ho") String ho, 
			@RequestParam("ten") String ten, @RequestParam("lop") String lop, 
			@RequestParam("ngaySinh") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngaySinh, 
			@RequestParam("diaChi") String diaChi, @RequestParam("diemTBTL") float diemTBTL,
			HttpSession ss) {
		TieuBan tieuBan = null;
		GiangVien GVHD = null;
		GiangVien GVPB = null;
		DoAn doAn = null;
		SinhVien sinhVien = new SinhVien(maSV.toUpperCase(), ho, ten, lop, ngaySinh, phai, diaChi, khoa, diemTBTL,doAn);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "FROM SinhVien";
		
		Query q = session.createQuery(hql);
		List<SinhVien> s = q.list();	
		try {
			boolean check = true;
			model.addAttribute("check",check);
			if(check) {
				session.save(sinhVien);
				t.commit();
				model.addAttribute("message", "Thêm sinh viên thành công");
				System.out.println("Thêm sinh viên thành công");
			}
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm sinh viên thất bại " + e.getMessage());
			System.out.println("Thêm sinh viên thất bại " + e.getMessage());
		}
		finally {
			session.close();
		}
		showStudent(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "student/student";
	}
	
	@RequestMapping(value = "student/{maSV}", params = "ldel")
	public String delete(ModelMap model, @ModelAttribute("SV") SinhVien SV,
			@PathVariable("maSV") String masv) {
		Integer temp = this.DeleteSV(this.getMaSV(masv));
		if (temp != 0) {
			model.addAttribute("message", "Delete thành công");
		} else {
			model.addAttribute("message", "Delete th?t b?i!");
		}
		
		model.addAttribute("sinhViens", this.getMaSVs());
		

		return "student/student";
	}
	
	public List<SinhVien> getMaSVs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SinhVien ORDER BY khoa DESC";
		Query query = session.createQuery(hql);
		List<SinhVien> list = query.list();
		return list;
	}
	
	public SinhVien getMaSV(String maSV) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SinhVien where maSV = :maSV ORDER BY khoa DESC";
		Query query = session.createQuery(hql);
		query.setParameter("maSV", maSV);
		SinhVien list = (SinhVien) query.list().get(0);
		return list;
	}
	
	public Integer DeleteSV(SinhVien sv) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(sv);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	
	@RequestMapping("edit-student")
	public String editStudent(ModelMap model,@RequestParam("maSV") String maSV, @RequestParam("phai") boolean phai,
			@RequestParam("khoa") int khoa, @RequestParam("ho") String ho, 
			@RequestParam("ten") String ten, @RequestParam("lop") String lop, 
			@RequestParam("ngaySinh") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngaySinh, 
			@RequestParam("diaChi") String diaChi, @RequestParam("diemTBTL") float diemTBTL,
			HttpSession ss) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM SinhVien WHERE maSV = :mssv";
		Query q = session.createQuery(hql);
		q.setParameter("mssv", maSV);
		SinhVien sinhvien = (SinhVien)q.uniqueResult();
		sinhvien.setHo(ho);
		sinhvien.setTen(ten);
		sinhvien.setKhoa(khoa);
		sinhvien.setLop(lop);
		sinhvien.setPhai(phai);
		sinhvien.setDiemTBTL(diemTBTL);
		sinhvien.setDiaChi(diaChi);
		sinhvien.setNgaySinh(ngaySinh);
		try {
			boolean check = true;
			model.addAttribute("check",check);
			if(check) {
			session.update(sinhvien);
				t.commit();
				model.addAttribute("message", "Sửa sinh viên thành công");
				System.out.println("Sửa sinh viên thành công");
			}
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Sửa sinh viên thất bại " + e.getMessage());
			System.out.println("Sửa sinh viên thất bại " + e.getMessage());
		}
		finally {
			session.close();
		}
		showStudent(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "student/student";
	}
	
	@RequestMapping("student/{id}")
	public String openCmtStudent(ModelMap model, @PathVariable("id") String maSV, HttpSession ss) {
		Session session = factory.getCurrentSession();
		SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, maSV));
		DoAn doAn = sinhVien.getDoAn();
		if(doAn==null) {
			model.addAttribute("flag", "none");
		}
		else {
			model.addAttribute("flag", "have");
			model.addAttribute("doAn", doAn);
		}
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "student/student-info";
	}
	
}