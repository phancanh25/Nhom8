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
import other.Other;

@Transactional
@Controller
public class Event {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("event")
	public String openEvent(ModelMap model, HttpSession ss) {
		other.checkLogin(ss, model);
		showEvent(model);
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
