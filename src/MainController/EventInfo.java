package MainController;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.TieuBan;
import other.Other;

@Controller
@Transactional
public class EventInfo {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("event-info/{year}")
	public String openEventInfo(ModelMap model, @PathVariable("year") Integer year, HttpSession ss) {
		if(ss.getAttribute("user") != null) {
			System.out.println("user ko null");
			model.addAttribute("username", ss.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			model.addAttribute("username", "");
		}
		Session session = factory.getCurrentSession();
		String hql = "from TieuBan where YEAR(ngay) = "+year;
		Query q = session.createQuery(hql);
		List<TieuBan> tieuBans = q.list();
		for(TieuBan i: tieuBans) {
			System.out.print(i.getMaTB()); 
		}
		model.addAttribute("tieuBans", tieuBans);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "event/event-info";
	}
}