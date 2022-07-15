package good.service;

public interface GoodService {

	public int goodCheck(String seq, String memEmail);

	public void insertGood(String seq, String memEmail);

	public void updateGood(String seq);

	public void updateGoodCheck(String seq, String memEmail);

	public void updateGoodCheckCancel(String seq, String memEmail);

	public void updateGoodCancel(String seq);

	public void deleteGood(String seq, String memEmail);

	public String goodCount(String seq);

}
