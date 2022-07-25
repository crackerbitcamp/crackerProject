package shop.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import crackeremail.bean.CrackeremailDTO;
import member.bean.MemberDTO;
import shop.service.ShopService;



@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;

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
	
	@PostMapping("/shop/getProductBuy")
	@ResponseBody
	public CrackeremailDTO getProductBuy(@RequestParam String memEmail) {
		CrackeremailDTO crackeremailDTO = shopService.getProductBuy(memEmail);
//		System.out.println(crackeremailDTO);
		return crackeremailDTO;
	}
	
	@PostMapping("/shop/memberaddressUpdate")
	@ResponseBody
	public void memberaddressUpdate(@RequestParam Map<String,String>map) {
		shopService.memberaddressUpdate(map);
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
	@GetMapping("/shop/cartView")
	public ModelAndView cartView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/cartView");
		return mav;
	}
}
