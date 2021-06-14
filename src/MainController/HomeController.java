package MainController;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.AccountGV;
import MainBean.AccountSV;
import MainBean.GiangVien;
import MainBean.Lock;
import MainBean.SinhVien;
import other.Other;


@Transactional
@Controller
@RequestMapping("/Home/")
public class HomeController {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession ss) {
		showEvent(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "home/index";	
	}
	
	@RequestMapping("login")
	public String openLogin(ModelMap model, @RequestParam("username") String username, 
			@RequestParam("password") String password, HttpSession ss) {
		Session session = factory.getCurrentSession();
		if(checkLogin(username, password, ss, model)) {
			System.out.println("thanh cong");
			return "redirect:/Home/index.htm";
		}
		else {
			System.out.println("that bai");
			model.addAttribute("error", "Tài khoản không chính xác");
			showEvent(model);
			other.checkLogin(ss, model, factory.getCurrentSession());
			return "home/index";
		}
	}
	
	@RequestMapping("logout")
	public String signout(HttpSession ss, ModelMap model) {
		System.out.println("Logout thanh cong");
		ss.removeAttribute("user");
		ss.removeAttribute("role");
		ss.removeAttribute("account");
		ss.removeAttribute("code");
		return "redirect:/Home/index.htm";
	}
	
	//kiem tra tai khoan
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
			if(accountSV.getPassword().equals(other.getMd5(password))) {
				ss.setAttribute("account", accountSV.getUsername());
				ss.setAttribute("user", accountSV.getSinhVien().getHo() + " " + accountSV.getSinhVien().getTen());
				ss.setAttribute("code", accountSV.getSinhVien().getMaSV()); // code la ma so sinh vien hoac ma so giang vien
				ss.setAttribute("role", accountSV.getRole().getMaRole());
			}
			else flag = false;
		}
		//Neu la tai khoan giang vien
		else if(accountSV == null) {
			if(accountGV.getPassword().equals(other.getMd5(password))) {
				ss.setAttribute("account", accountGV.getUsername());
				ss.setAttribute("user", accountGV.getGiangVien().getHo() + " " + accountGV.getGiangVien().getTen());
				ss.setAttribute("code", accountGV.getGiangVien().getMaGV()); // code la ma so sinh vien hoac ma so giang vien
				ss.setAttribute("role", accountGV.getRole().getMaRole());
			}
			else flag = false;
		}
		return flag;
	}
	
	@RequestMapping("edit-profile")
	public String editProfile(@RequestParam("edit-gender") boolean editGender,
			@RequestParam("edit-phone") String editPhone,
			@RequestParam("edit-address") String editAddress,
			@RequestParam("edit-role") int editRole,
			@RequestParam("edit-code") String editCode,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			if(editRole == 3) {
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, editCode));
				sinhVien.setPhai(editGender);
				sinhVien.setDiaChi(editAddress);
				session.update(sinhVien);
				transaction.commit();
			}
			else {
				GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, editCode));
				giangVien.setPhai(editGender);
				giangVien.setDiaChi(editAddress);
				giangVien.setSDT(editPhone);
				session.update(giangVien);
				transaction.commit();
			}
			model.addAttribute("changeProfileFlag", "Chỉnh sửa thông tin thành công");
		}
		catch (Exception e) {
			model.addAttribute("changeProfileFlag", "Đã có lỗi xảy ra: "+e.getMessage());
			transaction.rollback();
		}
		finally {
			session.close();
		}
		showEvent(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "home/index";	
	}
	
	//show thong bao ket qua cac ky bao ve
	public void showEvent(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Lock where detail is not null ORDER BY year DESC";
		Query query = session.createQuery(hql);
		List<Lock> events = query.list();
		model.addAttribute("events", events);
	}
	
	
}