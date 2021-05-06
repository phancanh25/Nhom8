package MainController;
import java.util.List;

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
	public String index() {
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