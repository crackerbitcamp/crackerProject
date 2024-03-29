package board.controller;

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

import board.bean.BoardDTO;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 글작성
	@GetMapping(value = "boardWriteForm")
	public ModelAndView boardWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", "/WEB-INF/main/menu.jsp");
		mav.addObject("nav", "/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardWriteForm.jsp");
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

	@ResponseBody
	@PostMapping(value = "boardWrite")
	public void boardWrite(@RequestParam Map<String, String> map) {
		System.out.println("카테고리 오나 확인 = " + map.get("category"));

		boardService.boardWrite(map);

	}

	// 리스트
	@GetMapping(value = "boardList")
	public ModelAndView boardList(@RequestParam(required = false, defaultValue = "1") String pg,
									@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",map.get("keyword"));
		mav.addObject("pg", pg);
		mav.addObject("menu", "/WEB-INF/main/menu.jsp");
		mav.addObject("nav", "/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardList.jsp");
		mav.setViewName("/index");

		return mav;
	}

	
	@ResponseBody
	@PostMapping(value="getBoardList")
	public Map<String,Object> getBoardList(@RequestParam(required = false,defaultValue="1" )String pg,
											@RequestParam(required = false,defaultValue="all") String category){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg",pg);
		map.put("category", category);
		
		return boardService.getBoardList(map);
		
	}
	
	@GetMapping(value="boardListIndex")
	public ModelAndView BoardListIndex(@RequestParam(required = false,defaultValue="1") String pg
										,@RequestParam(required = false,defaultValue="all") String category) {
		ModelAndView mav = new ModelAndView();
		System.out.println(category);
		mav.addObject("category",category);
		mav.addObject("pg",pg);
		mav.addObject("display", "/WEB-INF/board/boardListIndex.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	
	@ResponseBody
	@PostMapping(value="getBoardListIndex")
	public Map<String,Object> getBoardListIndex(@RequestParam(required = false,defaultValue="1" )String pg,
												@RequestParam(required = false,defaultValue="all") String category){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg",pg);
		map.put("category", category);
		
		return boardService.getBoardListIndex(map);
	}
	

	@GetMapping(value = "boardView")
	public ModelAndView boardView(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("seq", seq);
		mav.addObject("menu", "/WEB-INF/main/menu.jsp");
		mav.addObject("nav", "/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardView.jsp");
		mav.setViewName("/index");

		return mav;
	}

	@PostMapping(value = "getBoardView")
	@ResponseBody
	public Map<String, Object> getBoardView(@RequestParam String seq) {
		return boardService.getBoardView(seq);
	}

	// 글 업데이트
	@GetMapping(value = "boardUpdateForm")
	public ModelAndView boardUpdateForm(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("seq", seq);
		mav.addObject("menu", "/WEB-INF/main/menu.jsp");
		mav.addObject("nav", "/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardUpdateForm.jsp");
		mav.setViewName("/index");
		return mav;
	}

	@PostMapping(value = "getBoard")
	@ResponseBody
	public BoardDTO getBoard(@RequestParam String seq) {
		return boardService.getBoard(seq);
	}

	@ResponseBody
	@PostMapping(value = "boardUpdate")
	public void boardUpdate(@RequestParam Map<String, String> map) {
		
		boardService.boardUpdate(map);

	}

	// 답글
	@GetMapping(value = "boardReplyForm")
	public ModelAndView boardReplyForm(@RequestParam String seq, @RequestParam String pg, @RequestParam String category) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("pseq", seq);
		mav.addObject("pg", pg);
		mav.addObject("category", category);
		mav.addObject("menu", "/WEB-INF/main/menu.jsp");
		mav.addObject("nav", "/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardReplyForm.jsp");
		mav.setViewName("/index");

		return mav;
	}

	@ResponseBody
	@PostMapping(value = "boardReply")
	public void boardReply(@RequestParam Map<String, String> map) {
		System.out.println("카테고리 오나 확인 = " + map.get("category"));
		boardService.boardReply(map);
	}

	// 글 삭제
	@ResponseBody
	@PostMapping(value = "boardDelete")
	public void boardDelete(@RequestParam int seq) {
		boardService.boardDelete(seq);
	}

	@ResponseBody
	@PostMapping(value = "boardSearch")
	public Map<String, Object> boardSearch(@RequestParam Map<String, String> map
											,@RequestParam(required = false,defaultValue="1" )String pg
											) {
		map.put("pg", pg);
		System.out.println(map);
		return boardService.boardSearch(map);
	}

}