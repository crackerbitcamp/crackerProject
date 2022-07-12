package good.service;

public interface GoodService {

	public int goodCheck(String seq, String memId);

	public void insertGood(String seq, String memId);

	public void updateGood(String seq);

	public void updateGoodCheck(String seq, String memId);

	public void updateGoodCheckCancel(String seq, String memId);

	public void updateGoodCancel(String seq);

	public void deleteGood(String seq, String memId);

	public String goodCount(String seq);

}
