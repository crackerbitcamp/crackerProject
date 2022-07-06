package admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminService;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping(value="admin")
@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
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
	
	@GetMapping(value="/adminLoginForm")
	public ModelAndView adminLoginForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/admin/adminLoginForm");
		
		return mav;
		
	}
	
	@PostMapping(value="/adminLogin")
	public void adminLogin(@RequestParam Map<String, String> map) {
		adminService.adminLogin(map);
	}
	
	
}
