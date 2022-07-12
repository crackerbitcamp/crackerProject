package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	public void boardWrite(Map<String, String> map);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	public int getTotalA();

	public BoardDTO getBoardView(String seq);

	public void setHit(String seq);

	public void boardReply(Map<String, String> map);

	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public int getTotalSearchA(Map<String, String> map);


	public void boardUpdate(Map<String, String> map);

	public void boardDelete(int seq);

	public List<BoardDTO> getAllBoardList(Map<String, Integer> map);


}
