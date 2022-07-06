package customer.controller;

import java.util.Map;

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
	// customerWrite 문의하기 작성
	@ResponseBody
	@PostMapping(value="customerWrite")
	public void customerWrite(@RequestParam Map<String,String> map) {
		customerService.customerWrite(map);
	}
}
