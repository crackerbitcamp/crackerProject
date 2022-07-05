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
		mav.addObject("adminSection1","/WEB-INF/adminInclude/adminSection1.jsp");
		mav.addObject("adminSection2","/WEB-INF/adminInclude/adminSection2.jsp");
		mav.addObject("adminSection3", "/WEB-INF/adminInclude/adminSection3.jsp");
		mav.addObject("adminSection4", "/WEB-INF/adminInclude/adminSection4.jsp");
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	
	@GetMapping(value="/adminWriteForm")
	public ModelAndView adminWriteForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/admin/adminWriteForm");
		
		return mav;
		
	}
}
