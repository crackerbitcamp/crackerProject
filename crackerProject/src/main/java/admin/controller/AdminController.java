package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="admin")
@Controller
public class AdminController {
	
	@RequestMapping(value = "adminMain", method = RequestMethod.GET)
	public String adminMain() {
		
		return "/admin/adminMain";
	}
}
