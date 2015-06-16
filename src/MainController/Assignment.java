package MainController;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

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
		showLock(model);
		other.checkLogin(ss, model, factory.getCurrentSession());
		return "assignment/assignment";
	}
	
	public void showLock(ModelMap model) {
		//Kiem tra xem ton tai tieu ban nam hien tai chua
		int year = Calendar.getInstance().get(Calendar.YEAR);
		model.addAttribute("year", year);
		System.out.println("YeaR: "+year);
		
		Session session = factory.getCurrentSession();
		//Kiem tra xem nam nay co lock chua, tuc la kiem tra xem co ky bao ve nam nay chua
		Lock lock = (Lock)(session.get(Lock.class, year));
		if(lock == null) {
			model.addAttribute("flag", "none");
		}
		else {
			//Kiem tra xem ky bao ve da duoc cong bo chua (hoan thanh chua)
			if(lock.getDetail() != null) {
				model.addAttribute("release", "done");
			}
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
			model.addAttribute("wrongFlag", "wrong");
			model.addAttribute("message", "Thông báo: Đã có lỗi xảy ra: "+ e.getMessage());
			return "error/error";
		}
		
		return "redirect:assignment.htm";
	}
	
	
	@RequestMapping("release-event")
	public String releaseEvent(ModelMap model, HttpSession ss,
			@RequestParam("img-release-event") MultipartFile file,
			@RequestParam("textarea-detail") String detail) {
		byte[] picture = null;
		try {
			picture = file.getBytes();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		int year = Calendar.getInstance().get(Calendar.YEAR);
		Lock lock = (Lock)(session.get(Lock.class, year));
		lock.setPicture(picture);
		lock.setDetail(detail);
		try {
			session.update(lock);
			transaction.commit();
		}
		catch(HibernateException e) {
			transaction.rollback();
			model.addAttribute("wrongFlag", "wrong");
			model.addAttribute("message", "Thông báo: Đã có lỗi xảy ra: "+ e.getMessage());
			return "error/error";
		}
		finally {
			session.close();
		}
		return "redirect:assignment.htm";
	}
	
	@RequestMapping("cancel-release")
	public String cancelRelease(ModelMap model) {
		System.out.println("Vao ham ne");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		int year = Calendar.getInstance().get(Calendar.YEAR);
		Lock lock = (Lock)(session.get(Lock.class, year));
		byte[] picture = null;
		String detail = null;
		lock.setPicture(picture);
		lock.setDetail(detail);
		try {
			session.update(lock);
			transaction.commit();
		}
		catch (HibernateException e) {
			transaction.rollback();
			model.addAttribute("wrongFlag", "wrong");
			model.addAttribute("message", "Thông báo: Đã có lỗi xảy ra: "+ e.getMessage());
			return "error/error";
		}
		finally {
			session.close();
		}
		return "redirect:assignment.htm";
	}
	
	
}
