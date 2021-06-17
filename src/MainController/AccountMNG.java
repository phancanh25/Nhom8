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
		String hql = "FROM AccountGV";
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
				//Kiá»ƒm tra tÃªn tÃ i khoáº£n cÃ³ trÃ¹ng khÃ´ng
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				if(accountGV != null || accountSV != null) {
					model.addAttribute("accountError","Tên tài khoản đã tồn tại");
					flag = false;
					break;
				}
				//Kiá»ƒm tra mÃ£ giáº£ng viÃªn Ä‘Ãºng chÆ°a
				GiangVien gv = (GiangVien)(session.get(GiangVien.class, ma));
				if(gv==null) {
					model.addAttribute("accountError","Không tìm thấy mã giảng viên "+ma);
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
					model.addAttribute("accountError","Giảng viên "+ma+" đã có tài khoản: "+accountGV2.getUsername());
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
					model.addAttribute("message", "Thêm tài khoản giảng viên thành công!");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "Thêm tài khoản giảng viên thất bại: "+e.getMessage());
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
				//Kiá»ƒm tra tÃªn tÃ i khoáº£n cÃ³ trÃ¹ng khÃ´ng
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				if(accountSV != null || accountGV != null) {
					model.addAttribute("accountError","Tên tài khoản đã tồn tại!");
					flag = false;
					break;
				}
				//Kiá»ƒm tra mÃ£ sinh viÃªn Ä‘Ãºng chÆ°a
				SinhVien sv = (SinhVien)(session.get(SinhVien.class, ma));
				if(sv==null) {
					model.addAttribute("accountError","Không tìm thấy mã sinh viên: "+ma);
					flag = false;
					break;
				}
				//Nếu có mã sinh viên thì kiểm tra sinh viên này có tài khoản chưa
				hql = "FROM AccountSV where sinhVien.maSV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountSV accountSV2 = (AccountSV)query.uniqueResult();
				if(accountSV2!=null) {
					model.addAttribute("accountError","Sinh viên "+ma+" đã có tài khoản: "+accountSV2.getUsername());
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
					model.addAttribute("message", "Thêm tài khoản sinh viên thành công!");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "Thêm tài khoản sinh viên thất bại: "+e.getMessage());
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
				model.addAttribute("message", "Xóa thành công tài khoản "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "Xóa thất bại tài khoản "+username+": "+e.getMessage());
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
				model.addAttribute("message", "Xóa thành công tài khoản "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "Xóa thất bại tài khoản "+username+": "+e.getMessage());
			}
			finally {
				session.close();
			}
			other.checkLogin(ss, model, factory.getCurrentSession());
			showAccount(model);
			return "account/account-mng";
		}
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
				model.addAttribute("message", "Hạ quyền thành công tài khoản "+username);
			}
			catch(HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "Đã có lỗi xảy ra: "+e.getMessage());
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
				model.addAttribute("message", "Nâng quyền thành công tài khoản "+username);
			}
			catch(HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "Đã có lỗi xảy ra: "+e.getMessage());
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
