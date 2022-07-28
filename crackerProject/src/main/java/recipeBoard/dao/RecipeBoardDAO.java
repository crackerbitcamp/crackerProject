package recipeBoard.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import recipeBoard.bean.RecipeBoardDTO;

public interface RecipeBoardDAO {

	public void recipeBoardWrite(Map<String, String> map);

	public List<BoardDTO> getRecipeBoardList(Map<String, String> map);

	public RecipeBoardDTO getRecipeBoardView(String seq);

	public List<BoardDTO> getRecipeBoardListIndex(Map<String, String> map);

	public int getTotalA(Map<String, String> map);

	public List<BoardDTO> getRecipeBoardSearch(Map<String, String> map);

	public int getTotalSearchA(Map<String, String> map);

	public void recipeBoardDelete(int seq);

	public void recipeBoardUpdate(Map<String, String> map);

	public void setHit(String seq);


}
