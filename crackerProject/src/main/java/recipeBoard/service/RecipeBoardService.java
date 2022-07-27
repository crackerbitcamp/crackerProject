package recipeBoard.service;

import java.util.Map;

import recipeBoard.bean.RecipeBoardDTO;

public interface RecipeBoardService {

	public RecipeBoardDTO getRecipeBoardView(String seq);

	public Map<String, Object> getRecipeBoardList(Map<String, String> map);

	public void recipeBoardWrite(Map<String, String> map);

	public Map<String, Object> getRecipeBoardListIndex(Map<String, String> map);

	public Map<String, Object> recipeBoardSearch(Map<String, String> map);

	public void recipeBoardDelete(int seq);

	public void recipeBoardUpdate(Map<String, String> map);

}
