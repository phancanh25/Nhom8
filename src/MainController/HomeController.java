package MainController;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
		//Quen mat khau
		@Autowired
		JavaMailSender mailer;
		
		@RequestMapping("forgotpass")
		public String send(HttpSession ss, ModelMap model,@RequestParam("ma") String maSo,@RequestParam("email")String to){
			Session session = factory.openSession();
			final Transaction transaction = session.beginTransaction();
				ForgotPass: try {
					String token = other.generateToken();
					
					String hql = "FROM AccountGV WHERE maGV = '"+maSo+"' and email = '"+to+"'";
					Query q = session.createQuery(hql);
					AccountGV accountGV = (AccountGV)q.uniqueResult();
					
					hql = "FROM AccountSV WHERE maSV = '"+maSo+"' and email = '"+to+"'";
					q = session.createQuery(hql);
					AccountSV accountSV = (AccountSV)q.uniqueResult();
					if(accountGV != null) {
						accountGV.setToken(other.getMd5(token));
						session.update(accountGV);
					}
					else if(accountSV != null){
						accountSV.setToken(other.getMd5(token));
						session.update(accountSV);
					}
					else{
						model.addAttribute("forgotError","Tài khoản không tồn tại");
						model.addAttribute("forgotFlag", "have");
						break ForgotPass;
					}				
						String from = "nguoideptrai001wer@gmail.com";			
						String subject="PTITHCM - Nhận mật khẩu";
						String body="Click vào đường link sau để tạo mật khẩu mới: <a href=\"http://localhost:4545/Nhom8/create-new-pass/"+token+".htm\">Tạo mật khẩu mới</a>";
						MimeMessage mail = mailer.createMimeMessage();
						// su dung lop tro giup
						MimeMessageHelper helper = new MimeMessageHelper(mail);
						helper.setFrom(from,from);
						helper.setTo(to);
						helper.setReplyTo(from, from);
						helper.setSubject(subject);
						helper.setText(body,true);
						
						//gui mai
						mailer.send(mail);
						model.addAttribute("forgotFlag","done");
						transaction.commit();
				} 
				catch (Exception e) {
					transaction.rollback();
					model.addAttribute("forgotError","Đã có lỗi xảy ra: "+e.getMessage());
					model.addAttribute("forgotFlag", "have");
				}			
				finally {
					session.close();
				}
			showEvent(model);
			other.checkLogin(ss, model, factory.getCurrentSession());
			return "home/index";
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
	
	//Doi mat khau
	@RequestMapping("change-pass")
	public String changePass(@RequestParam("oldpass") String oldPass,
			@RequestParam("newpass1") String newPass1,
			@RequestParam("newpass2") String newPass2,
			ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		if((int)(ss.getAttribute("role")) != 3) {
			AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, (String)(ss.getAttribute("account"))));
			if(!other.getMd5(oldPass).equals(accountGV.getPassword())) {
				System.out.println("Mật khẩu cũ không chính xác");
				model.addAttribute("changePassFlag", "wrong");
				model.addAttribute("changePassMsg", "Mật khẩu cũ không chính xác");
			}
			else if(oldPass.equals(newPass1)) {
				System.out.println("Mật khẩu mới không được giống mật khẩu cũ");
				model.addAttribute("changePassFlag", "wrong");
				model.addAttribute("changePassMsg", "Mật khẩu mới không được giống mật khẩu cũ");
			}
			else if(!newPass1.equals(newPass2)) {
				System.out.println("Nhập lại mật khẩu chưa chính xác");
				model.addAttribute("changePassFlag", "wrong");
				model.addAttribute("changePassMsg", "Nhập lại mật khẩu không khớp");
			}
			else {
				try {
					accountGV.setPassword(other.getMd5(newPass1));
					session.update(accountGV);
					transaction.commit();
					model.addAttribute("changePassFlag", "done");
					model.addAttribute("changePassMsg", "Đổi mật khẩu thành công");
				}
				catch (HibernateException e) {
					System.out.println("Co loi xay ra khi cap nhat mau khau");
					model.addAttribute("changePassFlag", "done");
					model.addAttribute("changePassMsg", "Đã xảy ra lỗi: "+e.getMessage());
				}
				finally {
					session.close();
				}
			}
		}
		else {
			AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, (String)(ss.getAttribute("account"))));
			if(!other.getMd5(oldPass).equals(accountSV.getPassword())) {
				System.out.println("Mật khẩu cũ không chính xác");
				model.addAttribute("changePassFlag", "wrong");
				model.addAttribute("changePassMsg", "Mật khẩu cũ không chính xác");
			}
			else if(oldPass.equals(newPass1)) {
				System.out.println("Mật khẩu mới không được giống mật khẩu cũ");
				model.addAttribute("changePassFlag", "wrong");
				model.addAttribute("changePassMsg", "Mật khẩu mới không được giống mật khẩu cũ");
			}
			else if(!newPass1.equals(newPass2)) {
				System.out.println("Nhap lai mat khau chua chinh xac");
				model.addAttribute("changePassFlag", "wrong");
				model.addAttribute("changePassMsg", "Nhập lại mật khẩu không khớp");
			}
			else {
				try {
					accountSV.setPassword(other.getMd5(newPass1));
					session.update(accountSV);
					transaction.commit();
					model.addAttribute("changePassFlag", "done");
					model.addAttribute("changePassMsg", "Đổi mật khẩu thành công");
				}
				catch (HibernateException e) {
					System.out.println("Co loi xay ra khi cap nhat mau khau");
					model.addAttribute("changePassFlag", "wrong");
					model.addAttribute("changePassMsg", "Đã xảy ra lỗi: "+e.getMessage());
				}
				finally {
					session.close();
				}
			}
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
	@RequestMapping("tieubantam")
	public String showtb() {
		return "tieuban/showtb";
	}
	
}