package comment.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import comment.service.CommentService;

@Controller
@RequestMapping(value="comment")
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@ResponseBody
	@PostMapping(value="commentWrite")
	public void commentWrite(@RequestParam Map<String,String> map){
		commentService.commentWrite(map);
	}
	
	@ResponseBody
	@PostMapping(value="commentView")
	public Map<String,Object> commentView(@RequestParam Map<String,String> map){
		return commentService.commentView(map);
	}
	
	@PostMapping(value="commentReplyWrite")
	public void commentReplyWrite(@RequestParam Map<String,String> map) {
		System.out.println("seq="+map.get("seq"));
		System.out.println("comment="+map.get("commentContent"));
		System.out.println("boardseq="+map.get("boardSeq"));
		
		commentService.commentReplyWrite(map);
	}
}
