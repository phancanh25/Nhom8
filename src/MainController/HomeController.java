package MainController;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import MainBean.AccountSV;
import MainBean.GiangVien;
import MainBean.SinhVien;
import other.Other;


@Transactional
@Controller
@RequestMapping("/Home/")
public class HomeController {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "home/index";	
	}
	@RequestMapping("teacher")
	public String teacher() {
		return "teacher/teacher";	
	}
	@RequestMapping("student")
	public String student() {
		return "student/student";	
	}
	@RequestMapping("event")
	public String event() {
		return "event/event";	
	}
	@RequestMapping("event-add")
	public String eventadd() {
		return "event/event-add";	
	}
	@RequestMapping("event-info")
	public String eventinfo() {
		
		return "event/event-info";	
	}
	@RequestMapping("student-info")
	public String studentinfo() {
		return "student/student-info";	
	}
	@RequestMapping("cmt-student") //show committee student
	public String cmtStudent() {
		return "tieuban/show-student";	
	}
	@RequestMapping("cmt-teacher") //show committee teacher
	public String cmtTeacher() {
		return "tieuban/show-teacher";	
	}
	
	@RequestMapping("assignment")
	public String assignment() {
		return "assignment/assignment";	
	}
	
	@RequestMapping("statistic")
	public String chart() {
		return "Statistic/charts";	
	}
	
	@RequestMapping("showstudent")
	public String Showstudent(ModelMap model) {
		Session session= factory.getCurrentSession();
		String hql="FROM SinhVien";
		Query query=session.createQuery(hql);
		List<SinhVien> list = query.list();
		model.addAttribute("students",list);
		return "home/student-show";	
	}
	
	@RequestMapping("edit-profile")
	public String editProfile(@RequestParam("edit-gender") boolean editGender,
			@RequestParam("edit-phone") String editPhone,
			@RequestParam("edit-address") String editAddress,
			@RequestParam("edit-role") int editRole,
			@RequestParam("edit-code") String editCode,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			if(editRole == 3) {
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, editCode));
				sinhVien.setPhai(editGender);
				sinhVien.setDiaChi(editAddress);
				session.update(sinhVien);
				transaction.commit();
			}
			else {
				GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, editCode));
				giangVien.setPhai(editGender);
				giangVien.setDiaChi(editAddress);
				giangVien.setSDT(editPhone);
				session.update(giangVien);
				transaction.commit();
			}
			model.addAttribute("changeProfileFlag", "Chỉnh sửa thông tin thành công");
		}
		catch (Exception e) {
			model.addAttribute("changeProfileFlag", "Đã có lỗi xảy ra: "+e.getMessage());
			transaction.rollback();
		}
		finally {
			session.close();
		}
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "home/index";	
	}
}