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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.AccountGV;


@Transactional
@Controller
public class LoginController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("login")
	public String openIndex(ModelMap md, @RequestParam("username") String username, 
			@RequestParam("password") String password, HttpSession ss) {
		Session session = factory.getCurrentSession();
		String hql = "From AccountGV";
		Query q = session.createQuery(hql);
		List<AccountGV> accountGVs = q.list();
		for(AccountGV i : accountGVs) {
			if(username.equals(i.getUsername()) && password.equals(i.getPassword())) {
				ss.setAttribute("user", i.getUsername());
				md.addAttribute("message", "Xin chào "+i.getUsername());
				return "home/index";
			}
		}
		md.addAttribute("message", "Tài khoản không chính xác");
		return "home/index";
	}
}
