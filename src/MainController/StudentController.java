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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import MainBean.TieuBan;


@Transactional
@Controller
@RequestMapping("student/")
public class StudentController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("student")
	public String openStudent(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
		showStudent(md);
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
	public String addStudent(ModelMap md, @RequestParam("phai") boolean phai, @RequestParam("chuyenNganh") String chuyenNganh,
			@RequestParam("khoa") int khoa, @RequestParam("ho") String ho, 
			@RequestParam("ten") String ten, @RequestParam("lop") String lop, 
			@RequestParam("ngaySinh") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngaySinh, 
			@RequestParam("diaChi") String diaChi, @RequestParam("diemTBTL") float diemTBTL) {
		TieuBan tieuBan = null;
		GiangVien GVHD = null;
		GiangVien GVPB = null;
		SinhVien sinhvien = null;
		DoAn doAn = null;
		
		SinhVien sinhVien = new SinhVien("n18dcat015", ho, ten, lop, ngaySinh, phai, diaChi, khoa, diemTBTL,doAn);
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
			md.addAttribute("message", "Thêm sinh viên thành công");
			System.out.println("Thêm sinh viên thành công");
		}
		catch (Exception e) {
			t.rollback();
			md.addAttribute("message", "Thêm sinh viên thất bại " + e.getMessage());
			System.out.println("Thêm sinh viên thất bại " + e.getMessage());
		}
		finally {
			session.close();
		}
//		System.out.println(phai);
//		System.out.println(chuyenNganh);
//		System.out.println(khoa);
//		System.out.println(ho);
//		System.out.println(ten);
//		System.out.println(diaChi);
		showStudent(md);
		return "student/student";
	}
	
}