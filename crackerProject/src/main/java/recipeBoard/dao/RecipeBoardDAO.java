package recipeBoard.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface RecipeBoardDAO {

	public void recipeBoardWrite(Map<String, String> map);

	public List<BoardDTO> getRecipeBoardList(Map<String, Integer> map);

}
