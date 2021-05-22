package MainController;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.TieuBan;
import other.Other;

@Controller
@Transactional
public class Assignment {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("assignment")
	public String openAssignment(ModelMap model, HttpSession ss) {
		//Kiem tra xem ton tai tieu ban nam hien tai chua
		int year = Calendar.getInstance().get(Calendar.YEAR);
		model.addAttribute("year", year);
		
		Session session = factory.getCurrentSession();
		String hql = "FROM TieuBan where YEAR(ngay) = "+year;
		Query query = session.createQuery(hql);
		List<TieuBan> tieuBans = query.list();
		if(tieuBans.size() == 0 ) {
			model.addAttribute("flag", "none");
		}
		else {
			System.out.println("bi loi gi roi ");
		}
		model.addAttribute("username", other.checkLogin(ss));
		return "assignment/assignment";
	}
	
	
}
