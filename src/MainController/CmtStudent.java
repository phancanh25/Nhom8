package MainController;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cmt-student")
public class CmtStudent {
	
	@RequestMapping("/{id}")
	public String openCmtStudent(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
		return "tieuban/show-student";
	}
}
