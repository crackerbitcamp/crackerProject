package shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShopController {

	@GetMapping("/shop/shopmain")
	public ModelAndView shopmain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopmain");
		return mav;
	}
	
	@GetMapping("/shop/shopitem")
	public ModelAndView shopitem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopitem");
		return mav;
	}
	
	@GetMapping("/shop/shopMypage")
	public ModelAndView shopMypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopMypage");
		return mav;
	}
	
	@GetMapping("/shop/shoporder")
	public ModelAndView shoporder() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("MyPageInclude","/WEB-INF/shop/shoporder.jsp");
		mav.setViewName("/shop/shopMypage");
		
		return mav;
	}
}
