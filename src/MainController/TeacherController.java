package MainController;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import MainBean.TieuBan;

@Transactional
@Controller
@RequestMapping("teacher/")

public class TeacherController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("teacher")
	public String openStudent(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
		showTeacher(md);
		return "teacher/teacher-show";
	}
	
	public void showTeacher(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM GiangVien";
			Query q = session.createQuery(hql);
			List<GiangVien> giangViens = q.list();
			System.out.println("Hello");
			for(GiangVien i : giangViens) {
				System.out.println(i.getMaGV());
			}
			md.addAttribute("giangVien", giangViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
	// Thêm giảng viên chỗ này nè
	
//	@RequestMapping("add-teacher")
//	public String addTeacher(ModelMap md, @RequestParam("maGV") String maGV, @RequestParam("ho") String ho, 
//			@RequestParam("ten") String ten, @RequestParam("phai") String phai, 
//			@RequestParam("SDT") String SDT, @RequestParam("diaChi") float diaChi) {
//		List<TieuBan> tieuBans = null;
//		GiangVien giangVien = new GiangVien(maGV, );
//		SinhVien sinhVien = new SinhVien("n18dcat004", ho, ten, lop, ngaySinh, phai, diaChi, khoa, diemTBTL,doAn);
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		
//		try {
//			session.save(sinhVien);
//			t.commit();
//			md.addAttribute("message", "Thêm sinh viên thành công");
//			System.out.println("Thêm sinh viên thành công");
//		}
//		catch (Exception e) {
//			t.rollback();
//			md.addAttribute("message", "Thêm sinh viên thất bại " + e.getMessage());
//			System.out.println("Thêm sinh viên thất bại " + e.getMessage());
//		}
//		finally {
//			session.close();
//		}
////		System.out.println(phai);
////		System.out.println(chuyenNganh);
////		System.out.println(khoa);
////		System.out.println(ho);
////		System.out.println(ten);
////		System.out.println(diaChi);
//		showStudent(md);
//		return "student/student";
//	}
	
}
