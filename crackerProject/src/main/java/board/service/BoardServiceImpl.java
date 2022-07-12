package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private HttpSession session;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	
	@Override
	public void boardWrite(Map<String, String> map) {
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		String goodcount = "0";

		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		boardDAO.boardWrite(map);
	}
	@Override
	public Map<String,Object> getBoardList(String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum - 4;
		//DB 1페이지당 5개
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		List<BoardDTO> list = boardDAO.getBoardList(map);
		//세션
		String memId= (String)session.getAttribute("memId");
		//페이징 처리
		boardPaging = this.getBoardPaging(pg);
		//새로고침 방지
		if(session.getAttribute("memId") != null) {
			session.setAttribute("memHit", 0);
		}
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("memId",memId);
		sendMap.put("list", list);
		sendMap.put("boardPaging", boardPaging);
		return sendMap;
	}
	
	
	@Override
	public BoardPaging getBoardPaging(String pg) {
		int totalA = boardDAO.getTotalA();
		
		boardPaging.setCurrenPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}
	@Override
	public Map<String, Object> getBoardView(String seq) {
		if(session.getAttribute("memHit") != null) {
			boardDAO.setHit(seq);
			session.removeAttribute("memHit");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String memId=(String)session.getAttribute("memId");
		BoardDTO boardDTO=boardDAO.getBoardView(seq);
		map.put("memId",memId);
		map.put("boardDTO",boardDTO);
		return map;
	}
	@Override
	public void boardReply(Map<String, String> map) {
		BoardDTO boardDTO = boardDAO.getBoardView(map.get("pseq"));
		
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		map.put("id",id);
		map.put("name",name);
		map.put("email",email);
		map.put("ref",boardDTO.getRef()+"");
		map.put("lev",boardDTO.getLev()+"");
		map.put("step",boardDTO.getStep()+"");
		
		boardDAO.boardReply(map);
	}
	@Override
	public Map<String, Object> boardSearch(Map<String, String> map) {//pg,searchOption,keyword
		//1페이지당 5개
		int endNum=Integer.parseInt(map.get("pg"))*5;
		int startNum=endNum-4;
		
		map.put("startNum",startNum+"");
		map.put("endNum",endNum+"");
		
		List<BoardDTO> list = boardDAO.getBoardSearch(map);
		//페이징 처리
		int totalA = boardDAO.getTotalSearchA(map);
		boardPaging.setCurrenPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("list",list);
		sendMap.put("boardPaging",boardPaging);
		
		
		return sendMap;
	}
	@Override
	public BoardDTO getBoard(String seq) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardView(seq);
	}
	@Override
	public void boardUpdate(Map<String, String> map) {
		boardDAO.boardUpdate(map);
	}
	@Override
	public void boardDelete(int seq) {
		boardDAO.boardDelete(seq);
		
	}
	
	
	@Override
	public Map<String, Object> getBoardListhot(String pg) {
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum - 9;
		//DB 1페이지당 5개
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		List<BoardDTO> list = boardDAO.getAllBoardList(map);
		//세션
		String memId= (String)session.getAttribute("memId");
		//페이징 처리
		boardPaging = this.getBoardPaging(pg);
		//새로고침 방지
		if(session.getAttribute("memId") != null) {
			session.setAttribute("memHit", 0);
		}
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("memId",memId);
		sendMap.put("list", list);
		sendMap.put("boardPaging", boardPaging);
		return sendMap;
	}
	
	@Override
	public Map<String, Object> getRecipeBoardList(String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum - 4;
		//DB 1페이지당 5개
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		List<BoardDTO> list = boardDAO.getRecipeBoardList(map);
		//세션
		String memId= (String)session.getAttribute("memId");
		//페이징 처리
		boardPaging = this.getBoardPaging(pg);
		//새로고침 방지
		if(session.getAttribute("memId") != null) {
			session.setAttribute("memHit", 0);
		}
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("memId",memId);
		sendMap.put("list", list);
		sendMap.put("boardPaging", boardPaging);
		return sendMap;
	}
	@Override
	public Map<String, Object> getRecipeBoardView(String seq) {
		
		if(session.getAttribute("memHit") != null) {
			boardDAO.setHit(seq);
			session.removeAttribute("memHit");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String memId=(String)session.getAttribute("memId");
		BoardDTO boardDTO=boardDAO.getRecipeBoardView(seq);
		map.put("memId",memId);
		map.put("boardDTO",boardDTO);
		return map;
	}
	
	

}
