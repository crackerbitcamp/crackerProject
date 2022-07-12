package admin.service;


import java.util.Map;


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


	private AdminPaging adminPaging(String pg) {
		
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
	public Map<String, Object> adminMemberSearch(Map<String, Object> map) {
		
		
		int endNum = Integer.parseInt((String)map.get("pg")) * 5;
		int startNum = endNum - 4;
		
		map.put("startNum",startNum);
		map.put("endNum",endNum);
		
		List<MemberDTO> list = adminDAO.getadminMemberSerach(map);
		
		int totalA = adminDAO.getTotalSearchA(map); //총글수
		adminPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		adminPaging.setPageBlock(3);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("list", list);
		sendMap.put("adminPaging", adminPaging);
		
		return map;
	}



}
