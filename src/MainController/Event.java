package MainController;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.TieuBan;

@Transactional
@Controller
public class Event {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("event")
	public String openEvent(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
		showEvent(md);
		return "event/event";
	}
	
	public void showEvent(ModelMap md) {
		Session session = factory.getCurrentSession();
		String hql = "select year(ngay) from TieuBan\r\n"
				+ "group by year(ngay)\r\n"
				+ "order by year(ngay) DESC";
		Query query = session.createQuery(hql);
		List<Integer> years = query.list();
		md.addAttribute("years", years);
	}
}
