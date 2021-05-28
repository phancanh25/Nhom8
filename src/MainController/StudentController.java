package MainController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
@RequestMapping("student/")
public class StudentController {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("student")
	public String openStudent(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model);
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
		SinhVien sinhvien = null;
		DoAn doAn = null;
		
		SinhVien sinhVien = new SinhVien(maSV, ho, ten, lop, ngaySinh, phai, diaChi, khoa, diemTBTL,doAn);
		System.out.println("ma sv: "+sinhVien.getMaSV());
		System.out.println("ho: "+sinhVien.getHo());
		System.out.println("ten: "+sinhVien.getTen());
		System.out.println("lop: "+sinhVien.getLop());
		System.out.println("ngaysinh: "+sinhVien.getNgaySinh());
		System.out.println("phai: "+sinhVien.isPhai());
		System.out.println("diachi: "+sinhVien.getDiaChi());
		System.out.println("khoa: "+sinhVien.getKhoa());
		System.out.println("diemTBTL: "+sinhVien.getDiemTBTL());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "FROM SinhVien";
		
		Query q = session.createQuery(hql);
		List<SinhVien> s = q.list();	
		try {
			session.save(sinhVien);
			t.commit();
			model.addAttribute("message", "Thêm sinh viên thành công");
			System.out.println("Thêm sinh viên thành công");
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
		other.checkLogin(ss, model);
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
	
	
	@RequestMapping(value="student/{maSV}",params = "ledt")
	public String update(ModelMap model, @PathVariable("maSV") String maSV) {
		Session s = factory.getCurrentSession();
		String hql = "FROM SanPham where maSV = :maSV";
		Query q = s.createQuery(hql);
		q.setParameter("maSV",maSV);
		SinhVien sv = (SinhVien)q.uniqueResult();
		model.addAttribute("sinhViens",sv);	
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
		other.checkLogin(ss, model);
		return "student/student-info";
	}
	
}