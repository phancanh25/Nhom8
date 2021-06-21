package MainController;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.DoAn;
import MainBean.Lock;
import other.Other;

@Transactional
@Controller
public class EventRelease {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("event/{year}")
	public String openEventRelease(@PathVariable("year") int year, ModelMap model) {
		Session session = factory.getCurrentSession();
		Lock event = (Lock)(session.get(Lock.class, year));
		String hql = "FROM DoAn where nam = "+year+" ORDER BY sinhVien.maSV";
		Query query = session.createQuery(hql);
		List<DoAn> doAns = query.list();
		model.addAttribute("doAns", doAns);
		model.addAttribute("event", event);
		return "event/event-release";
	}
}
