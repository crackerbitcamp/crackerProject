package recipeBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import recipeBoard.bean.RecipeBoardDTO;
import recipeBoard.bean.RecipeBoardPaging;
import recipeBoard.dao.RecipeBoardDAO;

@Service
public class RecipeBoardServiceImpl implements RecipeBoardService {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private RecipeBoardDAO recipeBoardDAO;
	
	@Autowired
	private RecipeBoardPaging recipeBoardPaging;
	@Override
	public RecipeBoardDTO getRecipeBoardView(String seq) {
		
		return recipeBoardDAO.getRecipeBoardView(seq);
	}

	@Override
	public Map<String, Object> getRecipeBoardList(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum - 4;
		//DB 1페이지당 5개
		
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		System.out.println(map);
		List<BoardDTO> list = recipeBoardDAO.getRecipeBoardList(map);
		//세션
		System.out.println(list);
		String memLogin= (String)session.getAttribute("memLogin");
		//페이징 처리
		recipeBoardPaging = this.recipeBoardPaging(map);
		//새로고침 방지
		if(session.getAttribute("memLogin") != null) {
			session.setAttribute("memHit", 0);
		}
		Map<String,Object> sendMap = new HashMap<String,Object>();

		sendMap.put("memLogin",memLogin);

		sendMap.put("list", list);
		sendMap.put("recipeBoardPaging", recipeBoardPaging);
		return sendMap;
	}

	@Override
	public void recipeBoardWrite(Map<String, String> map) {
		String nickName = (String) session.getAttribute("memLogin");
		map.put("nickName",nickName);
		System.out.println(map.get("nickName"));
		
		recipeBoardDAO.recipeBoardWrite(map);
		
	}

	@Override
	public Map<String, Object> getRecipeBoardListIndex(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum - 4;
		//DB 1페이지당 5개
		
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		List<BoardDTO> list = recipeBoardDAO.getRecipeBoardListIndex(map);
		//세션
		
		String memLogin= (String)session.getAttribute("memLogin");
		//새로고침 방지
		if(session.getAttribute("memLogin") != null) {
			session.setAttribute("memHit", 0);
		}
		Map<String,Object> sendMap = new HashMap<String,Object>();

		sendMap.put("memLogin",memLogin);

		sendMap.put("list", list);

		return sendMap;
	}

	private RecipeBoardPaging recipeBoardPaging(Map<String, String> map) {
		int totalA = recipeBoardDAO.getTotalA(map);
		
		recipeBoardPaging.setCurrenPage(Integer.parseInt(map.get("pg")));
		recipeBoardPaging.setPageBlock(3);
		recipeBoardPaging.setPageSize(5);
		recipeBoardPaging.setTotalA(totalA);
		recipeBoardPaging.makePagingHTML();
		return recipeBoardPaging;
	}

}
