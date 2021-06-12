package MainController;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.AccountGV;
import MainBean.AccountSV;
import other.Other;

@Transactional
@Controller
public class NewPass {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("create-new-pass/{token}")
	public String openNewPass(HttpSession ss, ModelMap model, @PathVariable("token") String token) {
		Session session = factory.getCurrentSession();
		String hql = "FROM AccountGV WHERE token = '"+other.getMd5(token)+"'";
		Query q = session.createQuery(hql);
		AccountGV accountGV = (AccountGV)q.uniqueResult();
		
		hql = "FROM AccountSV WHERE token = '"+other.getMd5(token)+"'";
		q = session.createQuery(hql);
		AccountSV accountSV = (AccountSV)q.uniqueResult();
		
		if(accountGV != null) {
			model.addAttribute("account", accountGV.getUsername());
			model.addAttribute("accountRole", 2);
		}
		else if(accountSV != null){	
			model.addAttribute("account", accountGV.getUsername());
			model.addAttribute("accountRole", 3);
		}
		else{
			model.addAttribute("token","expired");
		}				
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "account/new-pass";
	}
	
	@RequestMapping("set-new-pass")
	public String setNewPass(ModelMap model, HttpSession ss,
			@RequestParam("newpass1") String newPass1,
			@RequestParam("newpass2") String newPass2,
			@RequestParam("account") String account,
			@RequestParam("accountRole") int accountRole
			) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		if(!newPass1.equals(newPass2)) {
			model.addAttribute("wrongFlag", "wrong");
			model.addAttribute("flagMsg", "Nhập lại mật khẩu chưa khớp");
		}
		else {
			try {
				if(accountRole == 2) {
					AccountGV accountGV = (AccountGV)(session.get(AccountGV.class, account));
					accountGV.setPassword(other.getMd5(newPass1));
					accountGV.setToken("");
					session.update(accountGV);
				}
				else {
					AccountSV accountSV = (AccountSV)(session.get(AccountSV.class, account));
					accountSV.setPassword(other.getMd5(newPass1));
					accountSV.setToken("");
					session.update(accountSV);
				}
				transaction.commit();
				model.addAttribute("doneFlag", "done");
				model.addAttribute("flagMsg", "Đổi mật khẩu thành công");
			}
			catch (HibernateException e) {
				transaction.rollback();
				model.addAttribute("wrongFlag", "wrong");
				model.addAttribute("flagMsg", "Đã có lỗi xảy ra: "+e.getMessage());
			}
			finally {
				session.close();
			}
			
		}
		model.addAttribute("account", account);
		model.addAttribute("accountRole", accountRole);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "account/new-pass";
	}
}
