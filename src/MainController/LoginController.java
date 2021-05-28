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
import MainBean.AccountSV;


@Transactional
@Controller
public class LoginController {
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
	public String signout(HttpSession ss, ModelMap model) {
		System.out.println("Logout thanh cong");
		ss.removeAttribute("user");
		ss.removeAttribute("role");
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
				ss.setAttribute("user", accountSV.getSinhVien().getHo() + " " + accountSV.getSinhVien().getTen());
				ss.setAttribute("code", accountSV.getSinhVien().getMaSV()); // code la ma so sinh vien hoac ma so giang vien
				ss.setAttribute("role", accountSV.getRole().getMaRole());
			}
			else flag = false;
		}
		//Neu la tai khoan giang vien
		else if(accountSV == null) {
			if(accountGV.getPassword().equals(password)) {
				ss.setAttribute("user", accountGV.getGiangVien().getHo() + " " + accountGV.getGiangVien().getTen());
				ss.setAttribute("code", accountGV.getGiangVien().getMaGV()); // code la ma so sinh vien hoac ma so giang vien
				ss.setAttribute("role", accountGV.getRole().getMaRole());
			}
			else flag = false;
		}
		return flag;
	}
}