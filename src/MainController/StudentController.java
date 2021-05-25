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
		model.addAttribute("username", other.checkLogin(ss));
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
	public String addStudent(ModelMap model,@RequestParam("maSV") String maSV, @RequestParam("phai") boolean phai, @RequestParam("chuyenNganh") String chuyenNganh,
			@RequestParam("khoa") int khoa, @RequestParam("ho") String ho, 
			@RequestParam("ten") String ten, @RequestParam("lop") String lop, 
			@RequestParam("ngaySinh") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngaySinh, 
			@RequestParam("diaChi") String diaChi, @RequestParam("diemTBTL") float diemTBTL,
			HttpSession ss) {
		TieuBan tieuBan = null;
		GiangVien GVHD = null;
		GiangVien GVPB = null;
		DoAn doAn = null;
		SinhVien sinhVien = new SinhVien(maSV, ho, ten, lop, ngaySinh, phai, diaChi, khoa, diemTBTL,doAn);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "FROM SinhVien";
		
		Query q = session.createQuery(hql);
		List<SinhVien> s = q.list();	
		System.out.println("in gi coi");
		System.out.println(sinhVien.getMaSV());
		try {
			boolean check = true;
			if(sinhVien.getMaSV().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangMSSV","MSSV không được để trống!!!");
			}
			else if(!sinhVien.getMaSV().trim().toLowerCase().matches("^n..dc..[0-9][0-9][0-9]")) {
				check = false;
				model.addAttribute("LoiDinhDangMSSV","Định dạng MSSV chưa đúng!!!");
			}
			else if(!sinhVien.getMaSV().trim().matches(".{10}")) {
				check = false;
				model.addAttribute("LoiDinhDangMSSV","MSSV đúng 10 ký tự!!!");
			}
			if(sinhVien.getHo().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangHo","Họ không được để trống!!!");
			}
			else if(!sinhVien.getHo().trim().matches(".{2,30}")) {
				check = false;
				model.addAttribute("LoiDinhDangHo","Họ phải lớn hơn 2 và nhỏ hơn 30 ký tự!!!");
			}
			if(sinhVien.getTen().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangTen","Tên không được để trống!!!");
			}
			else if(!sinhVien.getTen().trim().matches(".{2,20}")) {
				check = false;
				model.addAttribute("LoiDinhDangTen","MSSV đúng hơn 2 và nhỏ hơn 20 ký tự!!!");
			}
			if(sinhVien.getLop().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangLop","Lớp không được để trống!!!");
			}
			else if(!sinhVien.getLop().trim().toLowerCase().matches("^d..cq..[0-9][0-9]-n$")) {
				check = false;
				model.addAttribute("LoiDinhDangLop","Định dạng Lớp chưa đúng!!!");
			}
			else if(!sinhVien.getLop().trim().matches(".{11}")) {
				check = false;
				model.addAttribute("LoiDinhDangLop","Lớp đúng 10 ký tự!!!");
			}
			if(sinhVien.getDiemTBTL() < 0 ||sinhVien.getDiemTBTL() > 4.0) {
				check = false;
				model.addAttribute("LoiDinhDangDiem","Format điểm sai!!!");
			}
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
		model.addAttribute("username", other.checkLogin(ss));
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
			if(sinhvien.getMaSV().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangMSSV","MSSV không được để trống!!!");
			}
			else if(!sinhvien.getMaSV().trim().toLowerCase().matches("^n..dc..[0-9][0-9][0-9]")) {
				check = false;
				model.addAttribute("LoiDinhDangMSSV","Định dạng MSSV chưa đúng!!!");
			}
			else if(!sinhvien.getMaSV().trim().matches(".{10}")) {
				check = false;
				model.addAttribute("LoiDinhDangMSSV","MSSV đúng 10 ký tự!!!");
			}
			if(sinhvien.getHo().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangHo","Họ không được để trống!!!");
			}
			else if(!sinhvien.getHo().trim().matches(".{2,30}")) {
				check = false;
				model.addAttribute("LoiDinhDangHo","Họ phải lớn hơn 2 và nhỏ hơn 30 ký tự!!!");
			}
			if(sinhvien.getTen().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangTen","Tên không được để trống!!!");
			}
			else if(!sinhvien.getTen().trim().matches(".{2,20}")) {
				check = false;
				model.addAttribute("LoiDinhDangTen","MSSV đúng hơn 2 và nhỏ hơn 20 ký tự!!!");
			}
			if(sinhvien.getLop().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangLop","Lớp không được để trống!!!");
			}
			else if(!sinhvien.getLop().trim().toLowerCase().matches("^d..cq..[0-9][0-9]-n$")) {
				check = false;
				model.addAttribute("LoiDinhDangLop","Định dạng Lớp chưa đúng!!!");
			}
			else if(!sinhvien.getLop().trim().matches(".{11}")) {
				check = false;
				model.addAttribute("LoiDinhDangLop","Lớp đúng 10 ký tự!!!");
			}
			if(sinhvien.getDiemTBTL() < 0 ||sinhvien.getDiemTBTL() > 4.0) {
				check = false;
				model.addAttribute("LoiDinhDangDiem","Format điểm sai!!!");
			}
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
		model.addAttribute("username", other.checkLogin(ss));
		return "student/student";
	}
	
	@RequestMapping("student/{id}")
	public String openCmtStudent(ModelMap model, @PathVariable("id") String maSV, HttpSession ss) {
		if(ss.getAttribute("user") != null) {
			System.out.println("user ko null");
			model.addAttribute("username", ss.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			model.addAttribute("username", "");
		}
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
		model.addAttribute("username", other.checkLogin(ss));
		return "student/student-info";
	}
	
}