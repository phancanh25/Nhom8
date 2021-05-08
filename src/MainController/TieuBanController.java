package MainController;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import javax.annotation.Generated;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import MainBean.DoAn;
import MainBean.GiangVien;
import MainBean.SinhVien;
import MainBean.TieuBan;

@Transactional
@Controller
@RequestMapping("tieuban/")
public class TieuBanController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("tieuban")
	public String openTieuban(ModelMap md) {
		showTieuBan(md);
		return "tieuban/showtb";
	}

	private void showTieuBan(ModelMap md) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM TieuBan";
			Query q = session.createQuery(hql);
			List<TieuBan> tieuBans = q.list();
			for(TieuBan i : tieuBans) {
				System.out.println(i.getMaTB());
			}
			md.addAttribute("tieuBans", tieuBans);
		}
		catch (Exception e) {
			System.out.println("loi: "+e.getMessage());
		}	
	}
	@RequestMapping("add-tieuban")
	public String addTieuBan(ModelMap md,@RequestParam("maTB") int maTB, @RequestParam("tenTB") String tenTB, @RequestParam("chuyenNganh") String chuyenNganh, 
			@RequestParam("ngay") @DateTimeFormat(pattern="yyyy-MM-dd") Date ngay,
			@RequestParam("gio") @DateTimeFormat(pattern="hh:mm:ss") Date gio,
			@RequestParam("diaDiem") String diaDiem, @RequestParam("khoa") int khoa) {
		List<DoAn> doAns = null;
		List<GiangVien> giangViens = null;

		TieuBan tieuBan = new TieuBan(maTB, tenTB, chuyenNganh, ngay, gio,diaDiem, khoa, doAns,giangViens);
		System.out.println("Hello1");
		Session session = factory.openSession();
		
		Transaction t = session.beginTransaction();
		
		try {
			System.out.println("Hello3");
			session.save(tieuBan);
			System.out.println("Hello");
			t.commit();
			md.addAttribute("message", "Thêm tiểu ban thành công!!!");
			System.out.println("Thêm tiểu ban thành công!!!");
		}
		catch (Exception e) {
			System.out.println("Hello2");
			t.rollback();
			md.addAttribute("message", "Thêm tiểu ban thất bại!!!" + e.getMessage());
			System.out.println("Thêm tiểu ban thất bại!!! " + e.getMessage());
		}
		finally {
			session.close();
		}
		
		System.out.println(tenTB);
		showTieuBan(md);
		return "tieuban/showtb";
	}
}
