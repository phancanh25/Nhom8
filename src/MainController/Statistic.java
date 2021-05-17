package MainController;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.DoAn;
import MainBean.SinhVien;


@Transactional
@Controller
@RequestMapping("/statistic/")
public class Statistic {
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("piechart")
	public String chart(ModelMap md) {
		showDoAn(md);
		return "Statistic/pie-chart";	
	}
	@RequestMapping("barchart")
	public String barchart(ModelMap md) {
		showDoAn(md);
		return "Statistic/bar-chart";	
	}
	
	private void showDoAn(ModelMap md) {
		try {
			/* Map<Long, Long> QLDA = new HashMap<Long, Long>(); */
			Session session = factory.getCurrentSession();
			
			
			
			String hql = "SELECT COUNT(maDA) FROM DoAn GROUP BY nam ORDER BY nam";
			Query q = session.createQuery(hql);
			List<Long> SLDAperYear = q.list();
			
			String hql1 = "SELECT nam FROM DoAn GROUP BY nam ORDER BY nam";
			Query q1 = session.createQuery(hql1);
			List<Integer> namofSLDA = q1.list();
			
			String hql2 = "FROM DoAn";
			Query q2 = session.createQuery(hql2);
			List<Long> AllDoAn = q2.list();
			
			for(Long i : SLDAperYear) {
				System.out.println(i);
			}
			
			for(Integer u : namofSLDA) {
				System.out.println(u);
			}
			
			System.out.println(AllDoAn.size());
			
			md.addAttribute("SLDAperYear", SLDAperYear);
			md.addAttribute("namofSLDA", namofSLDA);
			md.addAttribute("AllDoAn",AllDoAn.size());
			
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}	
	}

	
}


