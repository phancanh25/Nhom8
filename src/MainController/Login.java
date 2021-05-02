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
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.AccountGV;
import MainEntity.Account;

@Transactional
@Controller
public class Login {
	@Autowired
	SessionFactory factory;
	
	/*
	 * @RequestMapping(value="signin",method = RequestMethod.GET) public String
	 * signin(Model model ) { AccountNow.MaGV="none"; AccountNow.passWord="";
	 * model.addAttribute("account",new Account()); return "Login/login"; }
	 * 
	 * @RequestMapping(value="signin",method = RequestMethod.POST) public String
	 * signin(ModelMap model, @ModelAttribute("act")Account account) {
	 * 
	 * boolean check = true; if(account.getMaGV().trim().isEmpty()) { check = false;
	 * model.addAttribute("LoiDinhDangEmail","Email không được để trống"); }
	 * 
	 * if(account.getPassword().isEmpty()) { check = false;
	 * model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không được để trống"); }
	 * else if(account.getPassword().trim().contains(" ")) { check = false;
	 * model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không có khoảng trắng"); }
	 * else if(!account.getPassword().matches(".{8,}")) { check = false;
	 * model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không dưới 8 kí tự"); }
	 * 
	 * if(check){ Session session = factory.getCurrentSession(); String hql =
	 * "FROM User u where u.email = :m and u.matKhau = :p"; Query query =
	 * session.createQuery(hql); query.setParameter("m", account.getMaGV());
	 * query.setParameter("p", account.getPassword()); //Account acount =
	 * (Account)query.uniqueResult();
	 * 
	 * model.addAttribute("message","Tài khoản và mật khẩu không chính xác"); }
	 * return "home/index"; }
	 */
	
//	@RequestMapping("login")
//	public String login(ModelMap md, @RequestParam("username") String username, @RequestParam("password") String password) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM AccountGV";
//		Query q = session.createQuery(hql);
//		List<MainBean2.AccountGV> accountGVs = q.list();
//		for(MainBean2.AccountGV i: accountGVs) {
//			if(username.equals(i.getUsername()) && password.equals(i.getPassword())) {
//				md.addAttribute("message", "Xin chào " + username);
//				return "home/index";
//			}
//		}
//		md.addAttribute("message", "Tài khoản không chính xác");
//		return "home/index";
//	}
			
			

//	@RequestMapping(value = "login", method = RequestMethod.GET)
//	public String init(Model model) {
//		model.addAttribute("msg", "Please Enter Your Login Details");
//		return "Login/login";
//	}
//
//	@RequestMapping(method = RequestMethod.POST)
//	public String submit(Model model, @ModelAttribute("login") Account Acc) {
//		if (Acc != null && Acc.getMaGV() != null & Acc.getPassword() != null) {
//			if (Acc.getMaGV().equals("canh") && Acc.getPassword().equals("canh123")) {
//				model.addAttribute("msg", Acc.getMaGV());
//				return "Login/success";
//			} else {
//				model.addAttribute("error", "Invalid Details");
//				return "Login/login";
//			}
//		} else {
//			model.addAttribute("error", "Please enter Details");
//			return "Login/login";
//		}
//	}
	
}
