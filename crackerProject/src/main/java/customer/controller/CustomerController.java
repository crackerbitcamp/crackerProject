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

import customer.service.CustomerService;
@Controller
@RequestMapping(value="customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping(value="customerWriteForm")
	public ModelAndView customerWriteForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/customer/customerWriteForm");
		
		return mav;
	}
	
	@PostMapping(value="getCustomer")
	@ResponseBody
	public Map<String, String> getCustomer(HttpSession session){
		// session의 값을 가지고
		// id name nicname email
		Map<String, String> map = new HashMap<String, String>();
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		//id,email을의 변수를 변경후 map에 담는다.
		
		map.put("name", name);
		map.put("email", email);
		// System.out.println(map.get("id")); id값 확인
		return map;
	}
	
	
	
	
	// customerWrite 문의하기 작성
	@PostMapping(value="customerWrite")
	@ResponseBody
	public void customerWrite(@RequestParam Map<String,String> map) {
		customerService.customerWrite(map);
	}
}
