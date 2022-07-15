package comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.bean.CommentDTO;
import comment.dao.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private HttpSession session;
	@Autowired
	private CommentDAO commentDAO;
	@Override
	public void commentWrite(Map<String, String> map) {
		String id = (String)session.getAttribute("memLogin");

		map.put("nickName" ,id);
		commentDAO.commentWrite(map);
		
		
	}

	@Override
	public Map<String, Object> commentView(Map<String, String> map) {
		List<CommentDTO> list = commentDAO.commentView(map);
		
		Map<String,Object> sendMap = new HashMap<String,Object>();

		sendMap.put("list",list);
		
		return sendMap;
	}

	@Override
	public void commentReplyWrite(Map<String, String> map) {
		String id = (String)session.getAttribute("memId");
		map.put("nickName" ,id);
		commentDAO.commentReplyWrite(map);
		
	}

}
