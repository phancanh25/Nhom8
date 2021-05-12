package MainController;


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

import MainBean.SinhVien;

@Transactional
@Controller
@RequestMapping("/addProject/")

public class AddProject {

	@Autowired
	SessionFactory factory;

	@RequestMapping("showProject")
	public String showStudent(ModelMap md, HttpSession session) {
		if(session.getAttribute("user") != null) {
			System.out.println("user ko null");
			md.addAttribute("username", session.getAttribute("user"));
		}
		else {
			System.out.println("username = 0");
			md.addAttribute("username", "");
		}
		ShowStudent(md);
		return "addProject/add-project";
	}
	
	public void ShowStudent(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SinhVien where diemTBTL >= 2.5 order by diemTBTL DESC";
			Query q = session.createQuery(hql);
			List<SinhVien> sinhViens = q.list();
			for(SinhVien i : sinhViens) {
				System.out.println(i.getMaSV());
			}
			md.addAttribute("sinhViens", sinhViens);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}
	}
}
