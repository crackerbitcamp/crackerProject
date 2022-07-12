package board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
@RequestMapping(value="board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 글작성
	@GetMapping(value="boardWriteForm")
	public ModelAndView boardWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardWriteForm.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	// 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "imageUpload")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/WEB-INF/storage"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            
			            file.transferTo(uploadFile);
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/storage/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
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
	@PostMapping(value="boardWrite")
	public void boardWrite(@RequestParam Map<String,String> map ){
		System.out.println("카테고리 오나 확인 = " + map.get("category"));
		
		boardService.boardWrite(map);
		
	}
	
	
	// 리스트
	@GetMapping(value="boardList")
	public ModelAndView boardList(@RequestParam(required = false,defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardList.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@GetMapping(value="recipeBoardList")
	public ModelAndView recipeBoardList(@RequestParam(required = false,defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/recipeBoardList.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="getRecipeBoardList")
	public Map<String,Object> getRecipeBoardList(@RequestParam(required = false,defaultValue="1" )String pg){
		System.out.println();
		return boardService.getRecipeBoardList(pg);
	}
	
	@ResponseBody
	@PostMapping(value="getBoardList")
	public Map<String,Object> getBoardList(@RequestParam(required = false,defaultValue="1" )String pg){
		return boardService.getBoardList(pg);
	}
	

	
	
	//인덱스 getBoardListhot
	@ResponseBody
	@PostMapping(value="getBoardListhot")
	public Map<String,Object> getBoardListhot(@RequestParam(required = false,defaultValue="1" )String pg){
		return boardService.getBoardListhot(pg);
	}
	
	
	
		

	@GetMapping(value="boardView")
	public ModelAndView boardView(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("seq",seq);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardView.jsp");
		mav.setViewName("/index");
		
		
		return mav;
	}
	
	@GetMapping(value="recipeBoardView")
	public ModelAndView recipeBoardView(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("seq",seq);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/recipeBoardView.jsp");
		mav.setViewName("/index");
		
		
		return mav;
	}
	
	@PostMapping(value="getBoardView")
	@ResponseBody
	public Map<String,Object> getBoardView(@RequestParam String seq) {
		return boardService.getBoardView(seq);
	}
	
	@PostMapping(value="getRecipeBoardView")
	@ResponseBody
	public Map<String,Object> getRecipeBoardView(@RequestParam String seq) {
		return boardService.getRecipeBoardView(seq);
	}
	
	// 글 업데이트
	@GetMapping(value="boardUpdateForm")
	public ModelAndView boardUpdateForm(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("seq",seq);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardUpdateForm.jsp");
		mav.setViewName("/index");
		return mav;
	}
	
	@PostMapping(value="getBoard")
	@ResponseBody
	public BoardDTO getBoard(@RequestParam String seq) {
		return boardService.getBoard(seq);
	}
	
	@ResponseBody
	@PostMapping(value="boardUpdate")
	public void boardUpdate(@RequestParam Map<String,String> map ){
		boardService.boardUpdate(map);
		
	}
	
	// 답글
	@GetMapping(value="boardReplyForm")
	public ModelAndView boardReplyForm(@RequestParam String seq
									,@RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pseq", seq);
		mav.addObject("pg", pg);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardReplyForm.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="boardReply")
	public void boardReply(@RequestParam Map<String, String> map) {
		boardService.boardReply(map);
	}
	
	//글 삭제
	@ResponseBody
	@PostMapping(value="boardDelete")
	public void boardDelete(@RequestParam int seq) {
		boardService.boardDelete(seq);
	}
	
	
	@ResponseBody
	@PostMapping(value="boardSearch")
	public Map<String,Object> boardSearch(@RequestParam Map<String,String> map) {
		return boardService.boardSearch(map); 
	}
	


}