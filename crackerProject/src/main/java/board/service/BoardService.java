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

	public Map<String, Object> getBoardListbest(String pg);

	public Map<String, Object> getBoardListhot(String pg);

	public Map<String, Object> getBoardListinfo(String pg);

	public Map<String, Object> getBoardListtest(String pg);

}
