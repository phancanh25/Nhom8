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
		other.checkLogin(ss, model, factory.getCurrentSession());
		showAccount(model);
		return "account/account-mng";
	}
	
	public void showAccount(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM AccountGV ORDER BY giangVien.maGV ASC";
		Query query = session.createQuery(hql);
		List<AccountGV> accountGVs = query.list();
		model.addAttribute("type", "gv");
		model.addAttribute("accountGVs", accountGVs);
	}
	
	@RequestMapping("account-seacrh")
	public String accountSearch(ModelMap model,
			@RequestParam("type") String type) {
		Session session = factory.getCurrentSession();
		String hql = "";
		if(type.equals("gv")) {
			hql = "FROM AccountGV accountGV where 1=1 ORDER BY giangVien.maGV ASC";
			Query query = session.createQuery(hql);
			List<AccountGV> accountGVs = query.list();
			model.addAttribute("type", "gv");
			model.addAttribute("accountGVs", accountGVs);
		}
		else {
			hql = "FROM AccountSV accountSV where 1=1 ORDER BY sinhVien.maSV ASC";
			Query query = session.createQuery(hql);
			List<AccountSV> accountSVs = query.list();
			model.addAttribute("type", "sv");
			model.addAttribute("accountSVs", accountSVs);
		}
		
		return "account/account-mng";
	}
	

	//Tao tai khoan
	@RequestMapping("account-add")
	public String accountAdd(ModelMap model, HttpSession ss,
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
				//Ki??????m tra t????n t????i kho??????n c???? tr????ng kh????ng
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				if(accountGV != null || accountSV != null) {
					model.addAttribute("accountError","T??n t??i kho???n ???? t???n t???i");
					flag = false;
					break;
				}
				//Ki??????m tra m???? gi??????ng vi????n ?????????ng ch????a
				GiangVien gv = (GiangVien)(session.get(GiangVien.class, ma));
				if(gv==null) {
					model.addAttribute("accountError","Kh??ng t??m th???y m?? gi???ng vi??n "+ma);
					flag = false;
					break;
				}
				//N??????u m???? gi??????ng vi????n ?????????ng ki??????m tra xem gi??????ng vi????n n????y c???? t????i kho??????n ch????a
				hql = "FROM AccountGV where giangVien.maGV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountGV accountGV2 = (AccountGV)query.uniqueResult();
				if(accountGV2!=null) {
					model.addAttribute("accountError","Gi???ng vi??n "+ma+" ???? c?? t??i kho???n: "+accountGV2.getUsername());
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
					model.addAttribute("message", "Th??m t??i kho???n gi???ng vi??n th??nh c??ng!");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "Th??m t??i kho???n gi???ng vi??n th???t b???i: "+e.getMessage());
				}
				finally {
					session.close();
					
				}
			}
			other.checkLogin(ss, model, factory.getCurrentSession());
			showAccount(model);
			return "account/account-mng";
		}
		//Neu la them sinh vien
		else {
			for(int step = 0; step<1; step++) {
				//Ki??????m tra t????n t????i kho??????n c???? tr????ng kh????ng
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				if(accountSV != null || accountGV != null) {
					model.addAttribute("accountError","T??n t??i kho???n ???? t???n t???i!");
					flag = false;
					break;
				}
				//Ki??????m tra m???? sinh vi????n ?????????ng ch????a
				SinhVien sv = (SinhVien)(session.get(SinhVien.class, ma));
				if(sv==null) {
					model.addAttribute("accountError","Kh??ng t??m th???y m?? sinh vi??n: "+ma);
					flag = false;
					break;
				}
				//N???u c?? m?? sinh vi??n th?? ki???m tra sinh vi??n n??y c?? t??i kho???n ch??a
				hql = "FROM AccountSV where sinhVien.maSV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountSV accountSV2 = (AccountSV)query.uniqueResult();
				if(accountSV2!=null) {
					model.addAttribute("accountError","Sinh vi??n "+ma+" ???? c?? t??i kho???n: "+accountSV2.getUsername());
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
					model.addAttribute("message", "Th??m t??i kho???n sinh vi??n th??nh c??ng!");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "Th??m t??i kho???n sinh vi??n th???t b???i: "+e.getMessage());
				}
				finally {
					session.close();
					
				}
			}
			other.checkLogin(ss, model, factory.getCurrentSession());
			showAccount(model);
			return "account/account-mng";
		}
	}
	
	@RequestMapping("account-delete")
	public String accountDelete(ModelMap model, HttpSession ss,
			@RequestParam("username") String username,
			@RequestParam("type") String type) {
		System.out.println("username: "+username);
		System.out.println("type: "+type);
		if(type.equals("gv")) {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
			try {
				session.delete(accountGV);
				transaction.commit();
				model.addAttribute("message", "X??a th??nh c??ng t??i kho???n "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "X??a th???t b???i t??i kho???n "+username+": "+e.getMessage());
			}
			finally {
				session.close();
			}
			other.checkLogin(ss, model, factory.getCurrentSession());
			showAccount(model);
			return "account/account-mng";
		}
		else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
			try {
				session.delete(accountSV);
				transaction.commit();
				model.addAttribute("message", "X??a th??nh c??ng t??i kho???n "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "X??a th???t b???i t??i kho???n "+username+": "+e.getMessage());
			}
			finally {
				session.close();
			}
			other.checkLogin(ss, model, factory.getCurrentSession());
			showAccount(model);
			return "account/account-mng";
		}
	}

	
	//Nang/ha quyen
	@RequestMapping("change-role")
	public String changeRole(@RequestParam("username") String username, ModelMap model, HttpSession ss) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
		if(accountGV.getRole().getMaRole() == 1) { //ha quyen
			Role role = (Role)(session.get(Role.class, 2));
			accountGV.setRole(role);
			try {
				session.update(accountGV);
				transaction.commit();
				model.addAttribute("message", "H??? quy???n th??nh c??ng t??i kho???n "+username);
			}
			catch(HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "???? c?? l???i x???y ra: "+e.getMessage());
				return "error/error";
			}
			finally {
				session.close();
			}
		}
		else { //nang quyen
			Role role = (Role)(session.get(Role.class, 1));
			accountGV.setRole(role);
			try {
				session.update(accountGV);
				transaction.commit();
				model.addAttribute("message", "N??ng quy???n th??nh c??ng t??i kho???n "+username);
			}
			catch(HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "???? c?? l???i x???y ra: "+e.getMessage());
				return "error/error";
			}
			finally {
				session.close();
			}
		}
		other.checkLogin(ss, model, factory.getCurrentSession());
		showAccount(model);
		return "account/account-mng";
	}
	
}
