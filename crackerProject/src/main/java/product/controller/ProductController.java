package product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
import product.bean.ProductJoinDTO;
import product.service.ProductService;

@Controller
@RequestMapping(value="product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(value="productWriteForm")
	public ModelAndView productMangeWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productWriteForm.jsp");
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	@ResponseBody
	@PostMapping(value="productWrite")
	public void productWrite(@RequestParam Map<String,String> map
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
		
		
		try {
			mainPhoto.transferTo(file);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
		
		map.put("mainPhoto", fileName);
		productService.productWrite(map);
	}
	@GetMapping(value="productMangeList")
	public ModelAndView productMangeList(@RequestParam(required = false, defaultValue = "1") String pg) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productMangeList.jsp");
		
		mav.setViewName("/admin/adminMain");
		return mav;
		
	}
	
	@ResponseBody
	@PostMapping(value="getProductMangeList")
	public Map<String,Object> getProductMangeList(@RequestParam(required = false,defaultValue="1" )String pg){
		
		return productService.getProductMangeList(pg);
	}
	
	@GetMapping(value= "productBoardWriteForm")
	public ModelAndView productBoardWriteForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productBoardWriteForm.jsp");
		
		mav.setViewName("/admin/adminMain");
		return mav;
		
	}
	
	@ResponseBody
	@PostMapping(value="getProduct")
	public ProductDTO getProduct(@RequestParam Map<String,String> map) {
		
		return productService.getProduct(map);
	}
	@ResponseBody
	@PostMapping(value="productBoardWrite")
	public void productBoardWrite(@RequestParam Map<String,Object> map) {
		//System.out.println(map);
		productService.productBoardWrite(map);
	}
	
	@PostMapping("/productSearch")
	@ResponseBody
	public List<ProductJoinDTO> productSearch(@RequestParam String keyword) {
		System.out.println(keyword);
		return productService.productSearch(keyword);
		
	}
	@ResponseBody
	@PostMapping(value="getProductBoardList")
	public Map<String,Object> getProductBoardList(@RequestParam Map<String,String> map) {
		//System.out.println(map);
		return productService.getProductBoardList(map);
	}
	
	@GetMapping(value="productBoardView")
	public ModelAndView productBoardView(@RequestParam Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(map);
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productBoardView.jsp");
		mav.addObject("seq",map.get("seq"));
		mav.setViewName("/shop/shopmain");
		return mav;
	}
	@ResponseBody
	@PostMapping(value="getProductBoardView")
	public ProductJoinDTO getProductBoardView(@RequestParam Map<String,String> map) {
		
		return productService.getProductBoardView(map);
	}
	

	@GetMapping(value="productBoardList")
	public ModelAndView productBoardList(@RequestParam Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(map);
		mav.addObject("category",map.get("category"));
		mav.addObject("nav", "/WEB-INF/adminInclude/adminNav.jsp");
		mav.addObject("display", "/WEB-INF/product/productBoardList.jsp");
		mav.setViewName("/shop/shopmain");
		return mav;
	}

}
