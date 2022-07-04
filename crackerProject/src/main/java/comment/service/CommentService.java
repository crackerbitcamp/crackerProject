package comment.service;

import java.util.Map;

public interface CommentService {

	public void commentWrite(Map<String, String> map);

	public Map<String, Object> commentView(Map<String, String> map);

	public void commentReplyWrite(Map<String, String> map);

}
