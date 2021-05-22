package MainController;
import java.util.List;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;

>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< HEAD
import MainEntity.SinhVien;
=======
import MainBean.SinhVien;
import other.Other;
>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b


@Transactional
@Controller
@RequestMapping("/Home/")
public class HomeController {
<<<<<<< HEAD
=======
	Other other = new Other();
>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		model.addAttribute("username", other.checkLogin(ss));
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
	
<<<<<<< HEAD
=======
	@RequestMapping("assignment")
	public String assignment() {
		return "assignment/assignment";	
	}
	
	@RequestMapping("statistic")
	public String chart() {
		return "Statistic/charts";	
	}
	
>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b
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