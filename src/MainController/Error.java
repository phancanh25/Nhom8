package MainController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Error {
	@RequestMapping("error")
	public String openError() {
		return "error/error";
	}
}
