package MainController;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.SinhVien;


@Transactional
@Controller
@RequestMapping("/Home/")
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
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
	
	@RequestMapping("showstudent")
	public String Showstudent(ModelMap model) {
		Session session= factory.getCurrentSession();
		String hql="FROM SinhVien";
		Query query=session.createQuery(hql);
		List<SinhVien> list = query.list();
		model.addAttribute("students",list);
		return "home/student-show";	
	}
}