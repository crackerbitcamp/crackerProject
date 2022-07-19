package admin.controller;

import java.util.HashMap;
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
	@ResponseBody
	@PostMapping(value="/adminLogin")
	public String adminLogin(@RequestParam Map<String, String> map) {
		System.out.println("아이디 = "+map.get("adminId"));
		return adminService.adminLogin(map);
	}
	
	@PostMapping(value="/adminWrite")
	@ResponseBody
	public void adminWrite(@RequestParam Map<String,String> map) {
		System.out.println(map.get("adminid"));
		adminService.adminWrite(map);

	}
	
	@GetMapping(value="/adminMemberList")
	public ModelAndView adminMemberList(@RequestParam(required = false, defaultValue = "1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/admin/adminMemberList.jsp");
		mav.setViewName("/admin/adminMain");
		
		return mav;
	}
	
	@PostMapping(value="/getadminMemberList")
	@ResponseBody
	public Map<String,Object> getadminMemberList(@RequestParam(required = false, defaultValue = "1") String pg) {
		
		return adminService.getadminMemberList(pg);
		
	}
	
	@GetMapping(value="/adminMemberDelete")
	public ModelAndView adminMemberDelete(@RequestParam String[] check) {
		System.out.println(check);
		adminService.adminMemberDelete(check);
		
		return new ModelAndView("redirect:/admin/adminMemberList");
	}
	
	@PostMapping(value="/adminMemberSearch")
	@ResponseBody
	public Map<String, Object> adminMemberSearch(@RequestParam Map<String, String> map){ 
		return adminService.adminMemberSearch(map);
	}
	
	@GetMapping(value="/adminMemberView")
	public ModelAndView adminMemberView() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/admin/adminMemberView.jsp");
		mav.setViewName("/admin/adminMain");
		return mav;
	}

	@PostMapping("/loginMember")
	@ResponseBody
	public Map<String,Integer> loginMember(){
		Map<String,Integer> map = adminService.loginMember();	
		System.out.println(map);
		return map;
		
	}
	
	@PostMapping("/dayLoginMember")
	@ResponseBody
	public Map<String,Integer> dayLoginMember(){
		Map<String,Integer> map = adminService.dayLoginMember();	
		System.out.println(map);
		return map;
		
	}


		//recipe board list 뽑아오기
		@PostMapping(value="getadminRecipeList")
		@ResponseBody
		public Map<String,Object> getadminRecipeList(@RequestParam(required = false, defaultValue = "1") String pg) {
			ModelAndView mav = new ModelAndView();
			return adminService.getadminRecipeList(pg);
		}
		
		// 페이지 이동
		@GetMapping(value="/adminRecipeList")
		public ModelAndView adminRecipeList(@RequestParam(required = false, defaultValue = "1") String pg) {
			System.out.println("확인  " + pg);
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg",pg);
			
			mav.addObject("adminSection1","/WEB-INF/adminInclude/adminSection1.jsp");
			mav.addObject("adminSection2","/WEB-INF/customer/customerList.jsp?pg="+pg);
			mav.addObject("adminSection3", "/WEB-INF/adminInclude/adminSection3.jsp");
			mav.addObject("adminSection4", "/WEB-INF/adminInclude/adminSection4.jsp");
			mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
			mav.setViewName("/admin/adminMain");
			return mav;
		}
		
		@PostMapping(value="adminrecipeSearch")
		@ResponseBody
		public Map<String, Object> adminrecipeSearch(@RequestParam Map<String, String> map){//pg, searchOption, keyword
			return adminService.adminrecipeSearch(map);
		}
}











