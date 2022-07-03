package board.service;


import java.util.Map;


import board.bean.BoardPaging;

public interface BoardService {

	public void boardWrite(Map<String, String> map);

	public Map<String,Object> getBoardList(String pg);

	public BoardPaging getBoardPaging(String pg);

	public Map<String, Object> getBoardView(String seq);

	public void boardReply(Map<String, String> map);

	public Map<String, Object> boardSearch(Map<String, String> map);

	public void commentWrite(Map<String,String> map);

	public Map<String, Object> commentView(Map<String, String> map);

}
