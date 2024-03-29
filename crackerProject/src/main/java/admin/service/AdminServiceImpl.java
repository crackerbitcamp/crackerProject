package admin.service;


import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminDTO;
import admin.bean.AdminPaging;
import admin.dao.AdminDAO;
import board.bean.BoardDTO;
import board.bean.BoardPaging;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import recipeBoard.bean.RecipeBoardDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private AdminDTO adminDTO;
	@Autowired
	private HttpSession session;
	@Autowired
	private AdminPaging adminPaging;
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private BoardPaging boardPaging;
	@Override
	public String adminLogin(Map<String, String> map) {
		
		adminDTO = adminDAO.adminLogin(map);
		
		if(adminDTO != null) {
			session.setAttribute("sionAdminName",adminDTO.getAdminname());
			session.setAttribute("sionAdminPwd",adminDTO.getAdminpwd());
			session.setAttribute("sionAdminId",adminDTO.getAdminid());
			session.setAttribute("sionAdminEmail",adminDTO.getAdminmail1()
					+"@"
					+adminDTO.getAdminmail2());
			
			return "ok";
		}else {
			return "fail";
		}
		
	}


	@Override
	public void adminWrite(Map<String, String> map) {
		adminDAO.adminWrite(map);
		
	}

	@Override
	public Map<String, Object> getadminMemberList(String pg) {
		
		//DB - 1페이지당 5개씩
		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;
	
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum",startNum);
		map.put("endNum", endNum);
		
		
		List<MemberDTO> list = adminDAO.getadminMemberList(map);
		System.out.println(list);
		
		//페이징처리
		adminPaging = this.adminPaging(pg);
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("list", list);
		sendMap.put("adminPaging", adminPaging);

		
		return sendMap;
	}


	public AdminPaging adminPaging(String pg) {
		
		int totalA = adminDAO.getAdminMemberTotalA(); 
		
		adminPaging.setCurrentPage(Integer.parseInt(pg));
		adminPaging.setPageBlock(3);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		return adminPaging;
		
	}


	@Override
	public void adminMemberDelete(String[] check) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		
			map.put("check", check);
		
			adminDAO.adminMemberDelete(map);
		
	}


	@Override
	public Map<String, Object> adminMemberSearch(Map<String, String> map) {
		
		
		int endNum = Integer.parseInt(map.get("pg")) * 5;
		int startNum = endNum - 4;
		
		map.put("startNum",startNum+"");
		map.put("endNum",endNum+"");
		
		List<MemberDTO> list = adminDAO.getadminMemberSearch(map);
		
		int totalA = adminDAO.getTotalSearchA(map); //총글수
		adminPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		adminPaging.setPageBlock(3);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("list", list);
		sendMap.put("adminPaging", adminPaging);
		
		return sendMap;
	}



	@Override
	public Map<String, Object> getadminRecipeList(String pg) {
		//DB - 1페이지당 5개씩
		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;
	
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum",startNum);
		map.put("endNum", endNum);
		
		
		List<RecipeBoardDTO> list = adminDAO.getadminRecipeList(map);
		//페이징처리
		int totalA = adminDAO.getAdminRecipeTotalA(map); //총글수
		adminPaging.setCurrentPage(Integer.parseInt(pg));
		adminPaging.setPageBlock(3);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("list", list);
		sendMap.put("adminPaging", adminPaging);

		
		return sendMap;
		}

	@Override
	public Map<String, Object> adminrecipeSearch(Map<String, String> map) {
		//DB - 1페이지당 5개씩
		int endNum = Integer.parseInt(map.get("pg")) * 5;
		int startNum = endNum - 4;
	
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		
		List<RecipeBoardDTO> list = adminDAO.adminrecipeSearch(map);
		//페이징처리
		int totalA = adminDAO.getAdminRecipeSearchTotalA(map); //총글수
		adminPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		adminPaging.setPageBlock(3);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("list", list);
		sendMap.put("adminPaging", adminPaging);

		
		return sendMap;
		}


	@Override
	public Map<String,Integer> loginMember() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(int i=1; i<10; i++) {
			map.put("day"+(i-1),adminDAO.loginMember(i) - adminDAO.loginMember(i-1));
		}
		return map;
	}


	@Override
	public Map<String, Integer> dayLoginMember() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(int i=1; i<10; i++) {
			map.put("day"+(i-1),adminDAO.dayLoginMember(i));
		}
		return map;
	}


	@Override
	public MemberDTO getMember(String seq) {
		
		return adminDAO.getMember(seq);
	}


	







}
