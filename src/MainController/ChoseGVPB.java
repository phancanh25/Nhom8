package MainController;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/ChoseGVPB/")
public class ChoseGVPB {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index() {
		return "GVPB/addGVPB";
	}
}
