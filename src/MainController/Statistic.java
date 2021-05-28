package MainController;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



import MainBean.DoAn;
import MainBean.SinhVien;
import other.Other;


@Transactional
@Controller
@RequestMapping("/statistic/")
public class Statistic {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	//file cua Tien
	@RequestMapping("piechart")
	public String piechart(ModelMap model, HttpSession ss) {
		showPie(model);
		other.checkLogin(ss, model);
		return "Statistic/pie-chart";	
	}
	//file cua Canh
	@RequestMapping("piechart1")
	public String piechart1(ModelMap md) {
		showPie(md);
		return "Statistic/pie-chart1";	
	}
	
	@RequestMapping("barchart")
	public String barchart(ModelMap model, HttpSession ss) {
		showBar(model);
		other.checkLogin(ss, model);
		return "Statistic/bar-chart";	
	}

	@RequestMapping("barchart1")
	public String barchart1(ModelMap md) {
		showBar(md);
		return "Statistic/bar-chart1";	
	}
	
	private void showBar(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "SELECT COUNT(maDA) FROM DoAn GROUP BY nam ORDER BY nam";
			Query q = session.createQuery(hql);
			List<Long> SLDAperYear = q.list();
			
			String hql1 = "SELECT nam FROM DoAn GROUP BY nam ORDER BY nam";
			Query q1 = session.createQuery(hql1);
			List<Integer> namofSLDA = q1.list();
			for(Long i : SLDAperYear) {
				System.out.println(i);
			}
			
			for(Integer u : namofSLDA) {
				System.out.println(u);
			}
			md.addAttribute("SLDAperYear", SLDAperYear);
			md.addAttribute("namofSLDA", namofSLDA);
			
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}	
	}
	
	private void showPie(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "from DoAn where diemHD >= 5 and (diemHD + diemPB)/2 >= 5 and nam = 2021";
			Query q = session.createQuery(hql);
			List<DoAn> doAns = q.list();
			
			String hqln = "select distinct nam from DoAn ";
			Query q2 = session.createQuery(hqln);
			List<Integer> listnam = q2.list();
			
			String hql1 = "from DoAn where (diemHD < 5 or (diemHD + diemPB)/2 < 5) and nam = 2021";
			Query q1 = session.createQuery(hql1);
			List<DoAn> doAn1s = q1.list();
			
			md.addAttribute("listnam", listnam);
			md.addAttribute("DADat", doAns.size());
			md.addAttribute("DAKDat", doAn1s.size());
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}	
	}
	@RequestMapping("piechart/{id}")
	public String openNam(ModelMap model, @PathVariable("id") String nam, HttpSession ss) {
		if(ss.getAttribute("user") != null) {
			System.out.println("user ko null");
			model.addAttribute("username", ss.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			model.addAttribute("username", "");
		}
		Session session = factory.getCurrentSession();
		int namSelect = Integer.parseInt(nam);  

		String hql = "from DoAn where diemHD >= 5 and (diemHD + diemPB)/2 >= 5 and nam =" + namSelect;
		Query q = session.createQuery(hql);
		List<DoAn> doAns = q.list();
		
		String hql1 = "from DoAn where (diemHD < 5 or (diemHD + diemPB)/2 < 5) and nam =" + namSelect;
		Query q1 = session.createQuery(hql1);
		List<DoAn> doAn1s = q1.list();
		
		System.out.println(namSelect);
		showPie(model);
		model.addAttribute("nam", nam);
		model.addAttribute("DADat", doAns.size());
		model.addAttribute("DAKDat", doAn1s.size());
		other.checkLogin(ss, model);
		return "Statistic/pie-chart";
	}	
}