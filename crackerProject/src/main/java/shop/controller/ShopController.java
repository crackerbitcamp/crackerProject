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
	
}
