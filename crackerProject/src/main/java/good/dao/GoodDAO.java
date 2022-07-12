package good.dao;

import java.util.Map;

public interface GoodDAO {

	public int goodCheck(Map<String, String> map);

	public void insertGood(Map<String, String> map);

	public void updateGood(String seq);

	public void updateGoodCheck(Map<String, String> map);

	public void updateGoodCheckCancel(Map<String, String> map);

	public void updateGoodCancel(String seq);

	public void deleteGood(Map<String, String> map);

	public String goodCount(String seq);

}
