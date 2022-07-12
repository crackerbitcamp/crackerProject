package board.service;


import java.util.Map;

import board.bean.BoardDTO;
import board.bean.BoardPaging;

public interface BoardService {

	public void boardWrite(Map<String, String> map);

	public Map<String,Object> getBoardList(String pg);

	public BoardPaging getBoardPaging(String pg);

	public Map<String, Object> getBoardView(String seq);

	public void boardReply(Map<String, String> map);

	public Map<String, Object> boardSearch(Map<String, String> map);


	public BoardDTO getBoard(String seq);

	public void boardUpdate(Map<String, String> map);

	public void boardDelete(int seq);



	public Map<String, Object> getBoardListhot(String pg);


	public Map<String, Object> getRecipeBoardList(String pg);

	public Map<String, Object> getRecipeBoardView(String seq);


}
