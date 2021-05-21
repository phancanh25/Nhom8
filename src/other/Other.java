package other;

import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;

public class Other {
	public String checkLogin(HttpSession session) {
		String username= (session.getAttribute("user")!=null)? (String)session.getAttribute("user"): null;
		return username;
	}
	
	public Other() {}
}
