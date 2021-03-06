package MainController;


import java.util.ArrayList;
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

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import MainBean.TieuBan;
import other.Other;

@Controller
@Transactional
@RequestMapping("cmt-student")

public class CmtStudent {
	Other other = new Other();
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/{id}")
	public String openCmtStudent(ModelMap model, @PathVariable("id") String maTB, HttpSession ss) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TieuBan where maTB ="+maTB;
		Query query = session.createQuery(hql);
		List<TieuBan> tieuBans = query.list();
		TieuBan tieuBan = tieuBans.get(0);
		List<DoAn> doAns = tieuBan.getDoAn();
		List<SinhVien> sinhViens = new ArrayList<>();
		for(DoAn i: doAns) {
			sinhViens.add(i.getSinhVien());
		}
		model.addAttribute("tenTB", tieuBan.getTenTB());
		model.addAttribute("sinhViens", sinhViens);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "tieuban/show-student";
	}
}
