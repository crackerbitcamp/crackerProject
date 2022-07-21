package product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import product.bean.ProductDTO;
import product.service.ProductService;

@Controller
@RequestMapping(value="product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(value="productMangeWriteForm")
	public ModelAndView productMangeWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productMangeWriteForm.jsp");
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	@ResponseBody
	@PostMapping(value="productMangeWrite")
	public void productMangeWrite(@RequestParam Map<String,String> map
								,@RequestParam("mainPhoto") MultipartFile mainPhoto,
								HttpSession session) {
		//실제폴더
		String filePath = session.getServletContext().getRealPath("/WEB-INF/storage");
		System.out.println(filePath);
		
		String fileName1 = mainPhoto.getOriginalFilename();
		String fileName2 = UUID.randomUUID().toString();
		String fileName = fileName2 + fileName1;
		String url = this.getClass().getResource("").getPath();
		String test = url.substring(1, url.indexOf(".metadata"));
		File dirs = new File(
				test + "crackerProject\\crackerProject\\src\\main\\webapp\\WEB-INF\\storage\\");
		File file = new File(dirs + "/"+fileName);
		System.out.println(fileName);
		
		try {
			mainPhoto.transferTo(file);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
		System.out.println(map.get("productContent"));
		map.put("mainPhoto", fileName);
		productService.productMangeWrite(map);
	}
	@GetMapping(value="productMangeList")
	public ModelAndView productMange(@RequestParam(required = false, defaultValue = "1") String pg) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productMangeList.jsp");
		
		mav.setViewName("/admin/adminMain");
		return mav;
		
	}
	
	@ResponseBody
	@PostMapping(value="productMangeList")
	public Map<String,Object> productMangeList(@RequestParam(required = false,defaultValue="1" )String pg){
		
		
		
		
		return productService.productMangeList(pg);
	}
	
}
