package MainController;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.Lock;
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
		//Kiem tra xem nam nay co lock chua, tuc la kiem tra xem co ky bao ve nam nay chua
		Lock lock = (Lock)(session.get(Lock.class, year));
		if(lock == null) {
			model.addAttribute("flag", "none");
		}
		else {
			System.out.println("Đã có kỳ bảo vệ");
			int action = 0;
			if(lock.isAddStudent()==false) model.addAttribute("lock", "1");
			if(lock.isAddTeacher1()==false) model.addAttribute("lock", "2");
			if(lock.isAddProject()==false) model.addAttribute("lock", "3");
			if(lock.isMark1()==false) model.addAttribute("lock", "4");
			if(lock.isAddTeacher2()==false) model.addAttribute("lock", "5");
			if(lock.isMark2()==false) model.addAttribute("lock", "6");
			if(lock.isToCMT()==false) model.addAttribute("lock", "7");
			if(lock.isMark3()==false) model.addAttribute("lock", "8");
			
		}
		other.checkLogin(ss, model);
		return "assignment/assignment";
	}
	
	@RequestMapping("set-lock")
	public String setLock(ModelMap model, @RequestParam("action") int action) {
		System.out.println("action: "+action);
		int year = Calendar.getInstance().get(Calendar.YEAR);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		Lock lock = (Lock)(session.get(Lock.class, year));
		lock.setAddStudent(action==1?false:true);
		lock.setAddTeacher1(action==2?false:true);
		lock.setAddProject(action==3?false:true);
		lock.setMark1(action==4?false:true);
		lock.setAddTeacher2(action==5?false:true);
		lock.setMark2(action==6?false:true);
		lock.setToCMT(action==7?false:true);
		lock.setMark3(action==8?false:true);
		try {
			session.update(lock);
			transaction.commit();
			System.out.println("Cập nhật lock thành công");
			session.close();
		}
		catch (HibernateException e) {
			transaction.rollback();
			System.out.println("Cập nhật lock thất bại "+e.getMessage());
			session.close();
			model.addAttribute("message", "Thêm kỳ bảo vệ thất bại "+ e.getMessage());
			return "error/error";
		}
		
		return "redirect:assignment.htm";
	}
	
	
}
