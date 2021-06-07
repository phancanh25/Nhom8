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
		other.checkLogin(ss, model);
		Session session = factory.getCurrentSession();
		String hql = "FROM AccountGV";
		Query query = session.createQuery(hql);
		List<AccountGV> accountGVs = query.list();
		model.addAttribute("type", "gv");
		model.addAttribute("accountGVs", accountGVs);
		model.addAttribute("error", "");
		return "account/account-mng";
	}
	

	
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
				AccountGV accountGV = new  AccountGV(username, password, role, giangVien,email);
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
				AccountSV accountSV = new AccountSV(username, password, role, sinhVien, email);
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
	public String send(HttpSession ss, ModelMap model,@RequestParam("ma") String maso,@RequestParam("email")String to)

	{

		boolean check = true;
		if(check) {
			try {
				String matKhau = "";
				Session s = factory.getCurrentSession();
				
				String hql = "SELECT  password FROM AccountGV WHERE giangVien.maGV = :ma and email = :email";
				Query q = s.createQuery(hql);
				q.setParameter("ma",maso);	
				q.setParameter("email",to);
				matKhau = (String)q.uniqueResult();
				if(matKhau==null) {
					String hql1 = "SELECT  password FROM AccountSV WHERE sinhVien.maSV = :ma and email = :email";
					Query q1 = s.createQuery(hql1);
					q1.setParameter("ma",maso);	
					q1.setParameter("email",to);		
					matKhau = (String)q1.uniqueResult();
				}
				if(matKhau==null) {
					model.addAttribute("forgotError","Tài khoản không tồn tại");
					model.addAttribute("forgotFlag", "have");
				}
				else {
					String from = "nguoideptrai001wer@gmail.com";			
					String subject="PTITHCM - Nhận mật khẩu";
					String body="Mật khẩu của bạn là "+matKhau;
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
				}
			} 
			catch (Exception e) {
				model.addAttribute("forgotError","Tài khoản không tồn tại");
				model.addAttribute("forgotFlag", "have");
			}			
		}
		other.checkLogin(ss, model);
		return "home/index";
	}
	
	
}
