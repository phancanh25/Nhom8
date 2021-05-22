package MainController;

import java.util.List;

<<<<<<< HEAD
import javax.transaction.Transactional;
=======
import javax.servlet.http.HttpSession;
>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import MainBean.AccountNow;
import MainEntity.Account;
=======
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.AccountGV;
import MainBean.AccountSV;
>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b


@Transactional
@Controller
public class LoginController {
<<<<<<< HEAD
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="signin",method = RequestMethod.GET)
	public String signin(Model model ) {
		AccountNow.MaGV="none";
		AccountNow.passWord="";
		model.addAttribute("account",new Account());
		return "Login/login";
	}
	@RequestMapping(value="signin",method = RequestMethod.POST)
	public String signin(ModelMap model, @ModelAttribute("act")Account account) {
			
		boolean check = true;
		if(account.getMaGV().trim().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangEmail","Email không được để trống"); 
		}

		if(account.getPassword().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không được để trống"); 
		}
		else if(account.getPassword().trim().contains(" "))
		{
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không có khoảng trắng"); 
		}
		else if(!account.getPassword().matches(".{8,}")) {	
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không dưới 8 kí tự"); 
		}
		
		if(check){ 							 
			Session session = factory.getCurrentSession();
			String hql = "FROM User u where u.email = :m and u.matKhau = :p";
			Query query = session.createQuery(hql);
			query.setParameter("m", account.getMaGV());
			query.setParameter("p", account.getPassword());
			//Account acount = (Account)query.uniqueResult(); 
			
			model.addAttribute("message","Tài khoản và mật khẩu không chính xác"); 
		}
		return "home/index";
	}
	
	
	/*@RequestMapping(value="login")
	public String signIn1(ModelMap model) {
		
			System.out.println("post");
		//biến kiểm tra validate 
		boolean check = true;
		Account account=new Account();
		account.setMaGV("abc");
		account.setPassword("123");
		if(account.getMaGV().trim().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangMaGV","Mã giảng viên không được để trống!"); 
		}
		System.out.println(account.getMaGV());
		if(account.getPassword().trim().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không được để trống!"); 
		}
		else if(account.getPassword().trim().contains(" "))
		{
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không có khoảng trắng!"); 
		}
		else if(!account.getPassword().trim().matches(".{8,}")) {	
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không dưới 8 kí tự!"); 
		}
		check=true;
		if(check){ 		
			Session session = factory.getCurrentSession();
			String hql = "FROM Account u where u.magv = :e and u.password = :m";
			Query query = session.createQuery(hql);
			query.setParameter("e", account.getMaGV());
			query.setParameter("m", account.getPassword());
			Account acc = (Account)query.uniqueResult(); */
//			System.out.print(account.getPassword());
			
//			if (Acc != null && Acc.getMaGV() != null & Acc.getPassword() != null) {
//				if (Acc.getMaGV().equals("canh") && Acc.getPassword().equals("canh123")) {
//					model.addAttribute("msg", Acc.getMaGV());
//					return "Login/success";
//				} else {
//					model.addAttribute("error", "Invalid Details");
//					return "Login/login";
//				}
//			} else {
//				model.addAttribute("error", "Please enter Details");
//				return "Login/login";
//			}
			
			
			//model.addAttribute("message","Tài khoản và mật khẩu không chính xác");
		
			
		/*}

		return "Login/login";*/
		
//	}
//	public static void main(String[] args) {
//		System.out.println("Đây là em chỉ thử");
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
	
=======
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("login")
	public String openIndex(ModelMap model, @RequestParam("username") String username, 
			@RequestParam("password") String password, HttpSession ss) {
		if(checkLogin(username, password, ss, model)) {
			System.out.println("thanh cong");
			return "redirect:/Home/index.htm";
		}
		else {
			System.out.println("that bai");
			model.addAttribute("error", "Tài khoản không chính xác");
			return "home/index";
		}
		
	}
	
	@RequestMapping("/Home/logout")
	public String signout(HttpSession session, ModelMap model) {
		System.out.println("Logout thanh cong");
		session.removeAttribute("user");
		return "redirect:/Home/index.htm";
	}
	
	public boolean checkLogin(String username, String password, HttpSession ss, ModelMap model) {
		boolean flag = true;
		Session session = factory.getCurrentSession();
		AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
		AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
		if(accountGV == null && accountSV == null) {
			flag = false;
		}
		//Neu la tai khoan sinh vien
		else if(accountGV == null) {
			if(accountSV.getPassword().equals(password)) {
				ss.setAttribute("user", username);
				ss.setAttribute("role", 3);
			}
			else flag = false;
		}
		//Neu la tai khoan giang vien
		else if(accountSV == null) {
			if(accountGV.getPassword().equals(password)) {
				ss.setAttribute("user", username);
				ss.setAttribute("role", 2);
			}
			else flag = false;
		}
		return flag;
	}
>>>>>>> 34a463320f652de879e37902daaf4ca14a12077b
}
