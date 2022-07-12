package good.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import good.dao.GoodDAO;



@Service
public class GoodServiceImpl implements GoodService {
	
	@Autowired
	private GoodDAO goodDAO;

	@Override
	public int goodCheck(String seq, String memId) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("seq", seq);
		return goodDAO.goodCheck(map);
	}

	@Override
	public void insertGood(String seq, String memId) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("seq", seq);
		goodDAO.insertGood(map);
	}

	@Override
	public void updateGood(String seq) {
		goodDAO.updateGood(seq);
		
	}

	@Override
	public void updateGoodCheck(String seq, String memId) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("seq", seq);
		goodDAO.updateGoodCheck(map);
	}

	@Override
	public void updateGoodCheckCancel(String seq, String memId) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("seq", seq);
		goodDAO.updateGoodCheckCancel(map);
	}

	@Override
	public void updateGoodCancel(String seq) {
		goodDAO.updateGoodCancel(seq);
		
	}

	@Override
	public void deleteGood(String seq, String memId) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("seq", seq);
		goodDAO.deleteGood(map);
	}

	@Override
	public String goodCount(String seq) {
		
		return goodDAO.goodCount(seq);
	}

}
