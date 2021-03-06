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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.TieuBan;
import other.Other;
import MainBean.SinhVien;

@Transactional
@Controller
@RequestMapping("teacher/")
public class TeacherController {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("teacher")
	public String openTeacher(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model, factory.getCurrentSession());
		showTeacher(model);
		return "teacher/teacher";
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
			md.addAttribute("giangViens", giangViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}

	@RequestMapping("add-teacher")
	public String addTeacher(ModelMap model,
			@RequestParam("ho") String ho, 
			@RequestParam("ten") String ten,
			@RequestParam("phai") boolean phai,
			@RequestParam("sDT") String sDT,
			@RequestParam("diaChi") String diaChi, HttpSession ss) {
		
		GiangVien giangVien = new GiangVien(other.createMaxCode(false, factory.getCurrentSession()), ho, ten, phai, sDT, diaChi, null);
		System.out.println("ma gv: "+giangVien.getMaGV());
		System.out.println("ho: "+giangVien.getHo());
		System.out.println("ten: "+giangVien.getTen());
		System.out.println("phai: "+giangVien.isPhai());
		System.out.println("sdt: "+giangVien.getSDT());
		System.out.println("diachi: "+giangVien.getDiaChi());
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "FROM GiangVien";
		
		Query q = session.createQuery(hql);
		List<GiangVien> s = q.list();	
		try {
			boolean check = true;
			model.addAttribute("check",check);
			if(check) {
				session.save(giangVien);
				t.commit();
				model.addAttribute("message", "Th??m gi???ng vi??n th??nh c??ng");
				System.out.println("Th??m gi???ng vi??n th??nh c??ng");
			}
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Th??m gi???ng vi??n th???t b???i " + e.getMessage());
			System.out.println("Th??m gi???ng vi??n th???t b???i " + e.getMessage());
		}
		finally {
			session.close();
		}
		other.checkLogin(ss, model, factory.getCurrentSession());
		showTeacher(model);
		return "teacher/teacher";
	}
			
	public List<GiangVien> getMaGVs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GiangVien";
		Query query = session.createQuery(hql);
		List<GiangVien> list = query.list();
		return list;
	}
	
	public GiangVien getMaGV(String maGV) {
		Session session = factory.getCurrentSession();
		String hql = "FROM GiangVien where maGV = :maGV";
		Query query = session.createQuery(hql);
		query.setParameter("maGV", maGV);
		GiangVien list = (GiangVien) query.list().get(0);
		return list;
	}

	public Integer DeleteGV(GiangVien gv) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(gv);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	@RequestMapping(value = "teacher/{MaGV}", params = "ldel")
	public String delete(HttpSession ss, ModelMap model, 
			@ModelAttribute("gv") GiangVien gv,
			@PathVariable("MaGV") String magv) {
		Integer temp = this.DeleteGV(gv);
		System.out.println(temp);
		if (temp != 0) {
			model.addAttribute("message", "X??a th??nh c??ng");
		} else {
			model.addAttribute("message", "X??a th???t b???i");
		}
		
		model.addAttribute("giangViens", this.getMaGVs());
		
		showTeacher(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "teacher/teacher";
	}
	
	@RequestMapping("edit-teacher")
	public String editTeacher(ModelMap model,@RequestParam("maGV") String maGV, 
			@RequestParam("ho") String ho, 
			@RequestParam("ten") String ten,
			@RequestParam("phai") boolean phai,
			@RequestParam("sDT") String sDT,
			@RequestParam("diaChi") String diaChi, HttpSession ss) {
		

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM GiangVien WHERE maGV = :magv";
		Query q = session.createQuery(hql);
		q.setParameter("magv", maGV);
		GiangVien giangvien = (GiangVien)q.uniqueResult();
		giangvien.setHo(ho);
		giangvien.setTen(ten);
		giangvien.setPhai(phai);
		giangvien.setSDT(sDT);
		giangvien.setDiaChi(diaChi);
		
		try {
			boolean check = true;
			model.addAttribute("check",check);
			if(check) {
				session.update(giangvien);
				t.commit();
				model.addAttribute("message", "S???a gi???ng vi??n th??nh c??ng");
				System.out.println("S???a gi???ng vi??n th??nh c??ng");
			}
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "S???a gi???ng vi??n th???t b???i " + e.getMessage());
			System.out.println("S???a gi???ng vi??n th???t b???i " + e.getMessage());
		}
		finally {
			session.close();
		}
		showTeacher(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "teacher/teacher";
	}
				
}