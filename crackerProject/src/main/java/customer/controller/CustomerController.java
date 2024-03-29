package customer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import crackeremail.service.CrackerEmailService;
import customer.bean.CustomerDTO;
import customer.service.CustomerService;
@Controller
@RequestMapping(value="customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	
	// customerWriteForm 문의하화면 이동
	@GetMapping(value="customerWriteForm")
	public ModelAndView customerWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display","/WEB-INF/customer/customerWriteForm.jsp");
		mav.setViewName("/index");
		return mav;
	}
	@GetMapping(value="customerList")
	public ModelAndView customerList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/customer/customerList.jsp");
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	//문의하기 작성
		@PostMapping(value="customerWrite")
		@ResponseBody
		public void customerWrite(@RequestParam Map<String,String> map ) {
			customerService.customerWrite(map);
		}
		
	//로그인 세션가지고 문의하기 작성진입시 id, email 가져옴
	@PostMapping(value="getCustomer")
	@ResponseBody
	public Map<String, String> getCustomer(HttpSession session){
		// session의 값을 가지고
		// id name nicname email
		Map<String, String> map = new HashMap<String, String>();
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		//id,email을의 변수를 변경후 map에 담는다.
		//카카오 연동 정보
 		String kakaoNickname = (String)session.getAttribute("kakaoNickname");
		String kakaoEmail = (String)session.getAttribute("kakaoEmail");
		//네이버 연동 정보

		String naverName = (String)session.getAttribute("naverName");
		String naverEmail = (String)session.getAttribute("naverEmail");
		
		map.put("name", name);
		map.put("email", email);
		map.put("kakaoNickname", kakaoNickname);
		map.put("kakaoEmail", kakaoEmail);
		map.put("naverName", naverName);
		map.put("naverEmail", naverEmail);
		
		//System.out.println(map.get("id"));// id값 확인
		System.out.println(name+ email);
		System.out.println(kakaoNickname+ kakaoEmail);
		System.out.println(naverName+ naverEmail);
		return map;
		
	}
	
	
	// home 에서 secsion2 getCustomerList 리스트출력
	@PostMapping(value="getCustomerList")
	@ResponseBody
	public Map<String,Object> getCustomerList(@RequestParam(required = false,defaultValue="1" )String pg){
		ModelAndView mav = new ModelAndView();
		return customerService.getCustomerList(pg);
	}
	
	//클릭시 글보기
	@GetMapping(value="customerView")
	public ModelAndView customerView(@RequestParam String seq, @RequestParam(required = false,defaultValue="1" )String pg) {
	ModelAndView mav = new ModelAndView();
	mav.addObject("pg",pg);
	mav.addObject("seq",seq);
	mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
	mav.addObject("display", "/WEB-INF/customer/customerView.jsp");
	mav.setViewName("/admin/adminMain");
	
	return mav;
	}	
	
	//글 보기
	@PostMapping(value="getCustomerView")
	@ResponseBody
	public Map<String,Object> getCustomerView(@RequestParam String seq){
		return customerService.getCustomerView(seq);
	}
	
	@GetMapping("/notkeywordcustomer")
	public ModelAndView notkeywordcustomer(@RequestParam String pg) {
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
	
	@PostMapping(value="customerSearch")
	@ResponseBody
	public Map<String, Object> customerSearch(@RequestParam Map<String, String> map){//pg, searchOption, keyword
	
		return customerService.customerSearch(map);
	}
}
