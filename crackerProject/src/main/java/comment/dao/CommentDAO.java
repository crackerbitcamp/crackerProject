package comment.dao;

import java.util.List;
import java.util.Map;

import comment.bean.CommentDTO;

public interface CommentDAO {

	public void commentWrite(Map<String, String> map);

	public List<CommentDTO> commentView(Map<String, String> map);

	public void commentReplyWrite(Map<String, String> map);

}
