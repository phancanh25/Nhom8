package other;

import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;

public class Other {
	public void checkLogin(HttpSession ss, ModelMap model) {
		if(ss.getAttribute("user") != null) {
			model.addAttribute("user", ss.getAttribute("user"));
			model.addAttribute("code", ss.getAttribute("code"));
			model.addAttribute("role", ss.getAttribute("role"));
		}
	}
	
	public Other() {}
}
