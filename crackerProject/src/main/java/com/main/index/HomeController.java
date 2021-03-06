package com.main.index;



import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
	ModelAndView mav = new ModelAndView();
	mav.addObject("indexSection1","/WEB-INF/main/indexSection1.jsp");
	

	mav.addObject("indexSection5","/WEB-INF/main/indexSection5.jsp");
	

	mav.addObject("menu","/WEB-INF/main/menu.jsp");
	mav.addObject("nav","/WEB-INF/main/nav.jsp");

	mav.setViewName("index");
			
	return mav;
	}
}
