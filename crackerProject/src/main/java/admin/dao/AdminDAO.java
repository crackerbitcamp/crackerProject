package admin.dao;


import java.util.Map;

import admin.bean.AdminDTO;

import java.util.List;



import member.bean.MemberDTO;



public interface AdminDAO {


	public AdminDTO adminLogin(Map<String, String> map);

	public List<MemberDTO> getadminMemberList(Map<String, Integer> map);
	
	public void adminWrite(Map<String, String> map);

	
}
