package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="admin")
@Controller
public class AdminController {
	
	@GetMapping(value="/adminMain")
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminSection1","/WEB-INF/adminMain/adminSection1.jsp");
		mav.addObject("adminSection2","/WEB-INF/adminMain/adminSection2.jsp");
		mav.addObject("adminSection3", "/WEB-INF/adminMain/adminSection3.jsp");
		mav.addObject("adminSection4", "/WEB-INF/adminMain/adminSection4.jsp");
		mav.addObject("nav", "/WEB-INF/adminMain/adminNav.jsp");
		
		mav.setViewName("/admin/adminMain");
		return mav;
	}
}
