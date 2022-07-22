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
	
	@GetMapping("/shop/shopproductbuy")
	public ModelAndView shopproductbuy() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopproductbuy");
		return mav;
	}
}
