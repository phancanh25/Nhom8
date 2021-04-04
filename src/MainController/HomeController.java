package MainController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Home/")
public class HomeController {
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
	
}
