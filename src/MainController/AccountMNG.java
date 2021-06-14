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
import org.springframework.test.context.support.AnnotationConfigContextLoaderUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.AccountGV;
import MainBean.AccountSV;
import MainBean.GiangVien;
import MainBean.Role;
import MainBean.SinhVien;
import other.Other;

@Controller
@Transactional
public class AccountMNG {
	@Autowired
	SessionFactory factory;
	Other other = new Other();
	
	@RequestMapping("open-account-mng")
	public String openAccountMNG(ModelMap model, HttpSession ss) {
		Other other = new Other();
		other.checkLogin(ss, model, factory.getCurrentSession());
		Session session = factory.getCurrentSession();
		String hql = "FROM AccountGV";
		Query query = session.createQuery(hql);
		List<AccountGV> accountGVs = query.list();
		model.addAttribute("type", "gv");
		model.addAttribute("accountGVs", accountGVs);
		return "account/account-mng";
	}
	
	@RequestMapping("account-seacrh")
	public String accountSearch(ModelMap model,
			@RequestParam("type") String type) {
		Session session = factory.getCurrentSession();
		String hql = "";
		if(type.equals("gv")) {
			hql = "FROM AccountGV accountGV where 1=1";
			Query query = session.createQuery(hql);
			List<AccountGV> accountGVs = query.list();
			model.addAttribute("type", "gv");
			model.addAttribute("accountGVs", accountGVs);
		}
		else {
			hql = "FROM AccountSV accountSV where 1=1";
			Query query = session.createQuery(hql);
			List<AccountSV> accountSVs = query.list();
			model.addAttribute("type", "sv");
			model.addAttribute("accountSVs", accountSVs);
		}
		
		return "account/account-mng";
	}
	

	//Tao tai khoan
	@RequestMapping("account-add")
	public String accountAdd(ModelMap model,
			@RequestParam("username") String username, 
			@RequestParam("password") String password,
			@RequestParam("ma") String ma,
			@RequestParam("type") String type,@RequestParam("email") String email) {
		Session session = factory.getCurrentSession();
		String hql = "";
		boolean flag = true;
		//Neu la them giang vien
		if(type.equals("gv")) {
			//Dung vong for nay` de co break, neu co dieu kien sai thi break, khoi lam nhung buoc sau 
			for(int step = 0; step<1; step++) {
				//Kiá»ƒm tra tÃªn tÃ i khoáº£n cÃ³ trÃ¹ng khÃ´ng
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				if(accountGV != null || accountSV != null) {
					model.addAttribute("error","TÃªn tÃ i khoáº£n Ä‘Ã£ tá»“n táº¡i");
					flag = false;
					break;
				}
				//Kiá»ƒm tra mÃ£ giáº£ng viÃªn Ä‘Ãºng chÆ°a
				GiangVien gv = (GiangVien)(session.get(GiangVien.class, ma));
				if(gv==null) {
					model.addAttribute("error","KhÃ´ng tÃ¬m tháº¥y mÃ£ giáº£ng viÃªn "+ma);
					flag = false;
					break;
				}
				//Náº¿u mÃ£ giáº£ng viÃªn Ä‘Ãºng kiá»ƒm tra xem giáº£ng viÃªn nÃ y cÃ³ tÃ i khoáº£n chÆ°a
				hql = "FROM AccountGV where giangVien.maGV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountGV accountGV2 = (AccountGV)query.uniqueResult();
				if(accountGV2!=null) {
					model.addAttribute("error","Giáº£ng viÃªn "+ma+" Ä‘Ã£ cÃ³ tÃ i khoáº£n: "+accountGV2.getUsername());
					flag = false;
					break;
				}
			}
			if(flag==true) {
				session = factory.openSession();
				Transaction transaction = session.beginTransaction();
				GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, ma));
				Role role = (Role)(session.get(Role.class, 2));
				AccountGV accountGV = new  AccountGV(username, other.getMd5(password), role, giangVien, email, "");
				try {
					session.save(accountGV);
					transaction.commit();
					model.addAttribute("error", "");
					model.addAttribute("message", "ThÃªm tÃ i khoáº£n giáº£ng viÃªn thÃ nh cÃ´ng");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "ThÃªm tÃ i khoáº£n giáº£ng viÃªn tháº¥t báº¡i "+e.getMessage());
				}
				finally {
					session.close();
					
				}
			}
			session = factory.getCurrentSession();
			hql = "FROM AccountGV";
			Query q = session.createQuery(hql);
			List<AccountGV> accountGVs = q.list();
			model.addAttribute("type", "gv");
			model.addAttribute("accountGVs", accountGVs);
		}
		//Neu la them sinh vien
		else {
			for(int step = 0; step<1; step++) {
				//Kiá»ƒm tra tÃªn tÃ i khoáº£n cÃ³ trÃ¹ng khÃ´ng
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				if(accountSV != null || accountGV != null) {
					model.addAttribute("error","TÃªn tÃ i khoáº£n Ä‘Ã£ tá»“n táº¡i");
					flag = false;
					break;
				}
				//Kiá»ƒm tra mÃ£ sinh viÃªn Ä‘Ãºng chÆ°a
				SinhVien sv = (SinhVien)(session.get(SinhVien.class, ma));
				if(sv==null) {
					model.addAttribute("error","KhÃ´ng tÃ¬m tháº¥y mÃ£ sinh viÃªn "+ma);
					flag = false;
					break;
				}
				//Náº¿u mÃ£ sinh viÃªn Ä‘Ãºng kiá»ƒm tra xem sinh viÃªn nÃ y cÃ³ tÃ i khoáº£n chÆ°a
				hql = "FROM AccountSV where sinhVien.maSV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountSV accountSV2 = (AccountSV)query.uniqueResult();
				if(accountSV2!=null) {
					model.addAttribute("error","Sinh viÃªn "+ma+" Ä‘Ã£ cÃ³ tÃ i khoáº£n: "+accountSV2.getUsername());
					flag = false;
					break;
				}
			}
			if(flag==true) {
				session = factory.openSession();
				Transaction transaction = session.beginTransaction();
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, ma));
				Role role = (Role)(session.get(Role.class, 3));
				AccountSV accountSV = new AccountSV(username, other.getMd5(password), role, sinhVien, email, "");
				try {
					session.save(accountSV);
					transaction.commit();
					model.addAttribute("error", "");
					model.addAttribute("message", "ThÃªm tÃ i khoáº£n sinh viÃªn thÃ nh cÃ´ng");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "ThÃªm tÃ i khoáº£n sinh viÃªn tháº¥t báº¡i "+e.getMessage());
				}
				finally {
					session.close();
					
				}
			}
			session = factory.getCurrentSession();
			hql = "FROM AccountSV";
			Query q = session.createQuery(hql);
			List<AccountSV> accountSVs = q.list();
			model.addAttribute("type", "sv");
			model.addAttribute("accountSVs", accountSVs);
		}
		return "account/account-mng";
	}
	
	@RequestMapping("account-delete")
	public String accountDelete(ModelMap model,
			@RequestParam("username") String username,
			@RequestParam("type") String type) {
		if(type.equals("gv")) {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
			try {
				session.delete(accountGV);
				transaction.commit();
				model.addAttribute("message", "XÃ³a thÃ nh cÃ´ng tÃ i khoáº£n "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "XÃ³a tháº¥t báº¡i tÃ i khoáº£n "+username);
			}
			finally {
				session.close();
			}
			session = factory.getCurrentSession();
			String hql = "FROM AccountGV";
			Query q = session.createQuery(hql);
			List<AccountGV> accountGVs = q.list();
			model.addAttribute("type", "gv");
			model.addAttribute("error", "");
			model.addAttribute("accountGVs", accountGVs);
		}
		else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
			try {
				session.delete(accountSV);
				transaction.commit();
				model.addAttribute("message", "XÃ³a thÃ nh cÃ´ng tÃ i khoáº£n "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "XÃ³a tháº¥t báº¡i tÃ i khoáº£n "+username);
			}
			finally {
				session.close();
			}
			session = factory.getCurrentSession();
			String hql = "FROM AccountSV";
			Query q = session.createQuery(hql);
			List<AccountSV> accountSVs = q.list();
			model.addAttribute("type", "sv");
			model.addAttribute("error", "");
			model.addAttribute("accountSVs", accountSVs);
		}
		return "account/account-mng";
	}
	
	
	//Quen mat khau
	@Autowired
	JavaMailSender mailer;
	@RequestMapping(value = "forgotpass",method = RequestMethod.GET)
	public String send() {
		return "account/forgotPass";
	}
	
	@RequestMapping(value="forgotpass",method = RequestMethod.POST)
	public String send(HttpSession ss, ModelMap model,@RequestParam("ma") String maSo,@RequestParam("email")String to)

	{
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
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "home/index";
	}
	
	
}
