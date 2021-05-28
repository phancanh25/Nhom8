package MainController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.support.AnnotationConfigContextLoaderUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("account-seacrh")
	public String accountSearch(ModelMap model,
			@RequestParam("username") String username,
			@RequestParam("type") String type,
			@RequestParam("ma") String ma) {
//		System.out.println(username);
//		System.out.println(type);
//		System.out.println(ma);
		Session session = factory.getCurrentSession();
		String hql = "";
		if(type.equals("gv")) {
			hql = "FROM AccountGV accountGV where 1=1";
			if(!username.equals("")) hql += " and accountGV.username like '%" + username + "%'";
			if(!ma.equals("")) hql += " and accountGV.giangVien.maGV like '%" + ma + "%'";
			Query query = session.createQuery(hql);
			List<AccountGV> accountGVs = query.list();
			model.addAttribute("type", "gv");
			model.addAttribute("error", "");
			model.addAttribute("accountGVs", accountGVs);
		}
		else {
			hql = "FROM AccountSV accountSV where 1=1";
			if(!username.equals("")) hql += " and accountSV.username like '%" + username + "%'";
			if(!ma.equals("")) hql += " and accountSV.sinhVien.maSV like '%" + ma + "%'";
			Query query = session.createQuery(hql);
			List<AccountSV> accountSVs = query.list();
			model.addAttribute("type", "sv");
			model.addAttribute("error", "");
			model.addAttribute("accountSVs", accountSVs);
		}
		
		return "account/account-mng";
	}
	
	@RequestMapping("account-add")
	public String accountAdd(ModelMap model,
			@RequestParam("username") String username, 
			@RequestParam("password") String password,
			@RequestParam("ma") String ma,
			@RequestParam("type") String type) {
		Session session = factory.getCurrentSession();
		String hql = "";
		boolean flag = true;
		//Neu la them giang vien
		if(type.equals("gv")) {
			//Dung vong for nay` de co break, neu co dieu kien sai thi break, khoi lam nhung buoc sau 
			for(int step = 0; step<1; step++) {
				//Kiểm tra tên tài khoản có trùng không
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				if(accountGV != null || accountSV != null) {
					model.addAttribute("error","Tên tài khoản đã tồn tại");
					flag = false;
					break;
				}
				//Kiểm tra mã giảng viên đúng chưa
				GiangVien gv = (GiangVien)(session.get(GiangVien.class, ma));
				if(gv==null) {
					model.addAttribute("error","Không tìm thấy mã giảng viên "+ma);
					flag = false;
					break;
				}
				//Nếu mã giảng viên đúng kiểm tra xem giảng viên này có tài khoản chưa
				hql = "FROM AccountGV where giangVien.maGV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountGV accountGV2 = (AccountGV)query.uniqueResult();
				if(accountGV2!=null) {
					model.addAttribute("error","Giảng viên "+ma+" đã có tài khoản: "+accountGV2.getUsername());
					flag = false;
					break;
				}
			}
			if(flag==true) {
				session = factory.openSession();
				Transaction transaction = session.beginTransaction();
				GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, ma));
				Role role = (Role)(session.get(Role.class, 2));
				AccountGV accountGV = new  AccountGV(username, password, role, giangVien);
				try {
					session.save(accountGV);
					transaction.commit();
					model.addAttribute("error", "");
					model.addAttribute("message", "Thêm tài khoản giảng viên thành công");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "Thêm tài khoản giảng viên thất bại "+e.getMessage());
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
				//Kiểm tra tên tài khoản có trùng không
				AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, username));
				AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, username));
				if(accountSV != null || accountGV != null) {
					model.addAttribute("error","Tên tài khoản đã tồn tại");
					flag = false;
					break;
				}
				//Kiểm tra mã sinh viên đúng chưa
				SinhVien sv = (SinhVien)(session.get(SinhVien.class, ma));
				if(sv==null) {
					model.addAttribute("error","Không tìm thấy mã sinh viên "+ma);
					flag = false;
					break;
				}
				//Nếu mã sinh viên đúng kiểm tra xem sinh viên này có tài khoản chưa
				hql = "FROM AccountSV where sinhVien.maSV = '" + ma + "'";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
		        query.setMaxResults(1);
				AccountSV accountSV2 = (AccountSV)query.uniqueResult();
				if(accountSV2!=null) {
					model.addAttribute("error","Sinh viên "+ma+" đã có tài khoản: "+accountSV2.getUsername());
					flag = false;
					break;
				}
			}
			if(flag==true) {
				session = factory.openSession();
				Transaction transaction = session.beginTransaction();
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, ma));
				Role role = (Role)(session.get(Role.class, 3));
				AccountSV accountSV = new AccountSV(username, password, role, sinhVien);
				try {
					session.save(accountSV);
					transaction.commit();
					model.addAttribute("error", "");
					model.addAttribute("message", "Thêm tài khoản sinh viên thành công");
				}
				catch(HibernateException e){
					transaction.rollback();
					model.addAttribute("message", "Thêm tài khoản sinh viên thất bại "+e.getMessage());
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
				model.addAttribute("message", "Xóa thành công tài khoản "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "Xóa thất bại tài khoản "+username);
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
				model.addAttribute("message", "Xóa thành công tài khoản "+username);
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("message", "Xóa thất bại tài khoản "+username);
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
	
}
