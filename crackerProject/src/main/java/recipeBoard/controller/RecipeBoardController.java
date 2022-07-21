package recipeBoard.controller;

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

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import recipeBoard.bean.RecipeBoardDTO;
import recipeBoard.service.RecipeBoardService;

@Controller
@RequestMapping(value="recipeBoard")
public class RecipeBoardController {
	@Autowired
	RecipeBoardService recipeBoardService;
	
	@GetMapping(value="/recipeBoardWriteForm")
	public ModelAndView recipeBoardWriteForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/WEB-INF/recipeBoard/recipeBoardWriteForm.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="recipeBoardWrite")
	public void recipeBoardWrite(@RequestParam Map<String, String> map) {
		System.out.println(map.get("content"));
		recipeBoardService.recipeBoardWrite(map);
	}
	
	
	
	
	
	@GetMapping(value="recipeBoardView")
	public ModelAndView recipeBoardView(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("seq",seq);
		mav.addObject("display", "/WEB-INF/recipeBoard/recipeBoardView.jsp");
		mav.setViewName("/index");
		
		
		return mav;
	}
	
	@PostMapping(value="getRecipeBoardView")
	@ResponseBody
	public RecipeBoardDTO getRecipeBoardView(@RequestParam String seq) {
		
		return recipeBoardService.getRecipeBoardView(seq);
	}
	
	@ResponseBody
	@PostMapping(value="getRecipeBoardListIndex")
	public Map<String,Object> getRecipeBoardListIndex(@RequestParam(required = false,defaultValue="1" )String pg
												,@RequestParam(required = false,defaultValue="all") String category){
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg",pg);
		map.put("category", category);

		return recipeBoardService.getRecipeBoardListIndex(map);
	}
	
	@GetMapping(value="recipeBoardListIndex")
	public ModelAndView recipeBoardListIndex(@RequestParam(required = false,defaultValue="1") String pg
										,@RequestParam(required = false,defaultValue="all") String category) {
		ModelAndView mav = new ModelAndView();
		System.out.println(category);
//		mav.addObject("category",category);
//		mav.addObject("pg",pg);
		mav.addObject("display", "/WEB-INF/recipeBoard/recipeBoardListIndex.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	
	@ResponseBody
	@PostMapping(value="getRecipeBoardList")
	public Map<String,Object> getRecipeBoardList(@RequestParam(required = false,defaultValue="1" )String pg
												,@RequestParam(required = false,defaultValue="all") String category){
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg",pg);
		map.put("category", category);
		
		return recipeBoardService.getRecipeBoardList(map);
	}
	
	@GetMapping(value="recipeBoardList")
	public ModelAndView recipeBoardList(@RequestParam(required = false,defaultValue="1") String pg
										,@RequestParam(required = false,defaultValue="all") String category) {
		ModelAndView mav = new ModelAndView();
		System.out.println(category);
		mav.addObject("category",category);
		mav.addObject("pg",pg);
		mav.addObject("display", "/WEB-INF/recipeBoard/recipeBoardList.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	// 이미지 업로드
		@ResponseBody
		@RequestMapping(value = "imageUpload")
		public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp,
				MultipartHttpServletRequest multiFile) throws Exception {
			JsonObject jsonObject = new JsonObject();
			PrintWriter printWriter = null;
			OutputStream out = null;
			MultipartFile file = multiFile.getFile("upload");

			if (file != null) {
				if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
					if (file.getContentType().toLowerCase().startsWith("image/")) {
						try {

							String fileName = file.getOriginalFilename();
							byte[] bytes = file.getBytes();

							String uploadPath = req.getSession().getServletContext().getRealPath("/WEB-INF/storage"); // 저장경로
							System.out.println("uploadPath:" + uploadPath);

							File uploadFile = new File(uploadPath);
							if (!uploadFile.exists()) {
								uploadFile.mkdir();
							}

							String fileName2 = UUID.randomUUID().toString();
							uploadPath = uploadPath + "/" + fileName2 + fileName;

							out = new FileOutputStream(new File(uploadPath));
							out.write(bytes);

							printWriter = resp.getWriter();
							String fileUrl = req.getContextPath() + "/storage/" + fileName2 + fileName; // url경로
							System.out.println("fileUrl :" + fileUrl);
							JsonObject json = new JsonObject();
							json.addProperty("uploaded", 1);
							json.addProperty("fileName", fileName);
							json.addProperty("url", fileUrl);
							printWriter.print(json);
							System.out.println(json);

							String url = this.getClass().getResource("").getPath();
							String test = url.substring(1, url.indexOf(".metadata"));
							System.out.println(test);
							File dirs = new File(
									test + "crackerProject\\crackerProject\\src\\main\\webapp\\WEB-INF\\storage\\");
							System.out.println(dirs);
							File file1 = new File(dirs + "/" + fileName2 + fileName);
							file.transferTo(file1);

						} catch (IOException e) {
							e.printStackTrace();
						} finally {
							if (out != null) {
								out.close();
							}
							if (printWriter != null) {
								printWriter.close();
							}
						}
					}

				}

			}
		}
}
