package recipeBoard.service;

import java.util.Map;

public interface RecipeBoardService {

	public Map<String, Object> getRecipeBoardView(String seq);

	public Map<String, Object> getRecipeBoardList(Map<String, String> map);

	public void recipeBoardWrite(Map<String, String> map);

}
