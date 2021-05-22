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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import MainBean.GiangVien;
import MainBean.TieuBan;
import other.Other;

@Controller
@Transactional
@RequestMapping("cmt-teacher")
public class CmtTeacher {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
		
	@RequestMapping("/{id}")
	public String openCmtTeacher(ModelMap model, @PathVariable("id") String maTB, HttpSession ss) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TieuBan where maTB = "+maTB;
		Query query = session.createQuery(hql);
		List<TieuBan> tieuBans = query.list();
		TieuBan tieuBan = tieuBans.get(0);
		List<GiangVien> giangViens = tieuBan.getGiangViens();
		for(GiangVien i:giangViens) {
			System.out.println(i.getMaGV());
		}
		model.addAttribute("giangViens", giangViens);
		model.addAttribute("username", other.checkLogin(ss));
		return "tieuban/show-teacher";
	}
}
