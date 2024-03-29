package admin.service;

import java.util.Map;

import member.bean.MemberDTO;



public interface AdminService {

	public String adminLogin(Map<String, String> map);

	public void adminWrite(Map<String, String> map);

	public Map<String, Object> getadminMemberList(String pg);

	public void adminMemberDelete(String[] check);

	public Map<String, Object> adminMemberSearch(Map<String, String> map);

	public Map<String, Integer> loginMember();

	public Map<String, Integer> dayLoginMember();

	public Map<String, Object> getadminRecipeList(String pg);

	public Map<String, Object> adminrecipeSearch(Map<String, String> map);

	public MemberDTO getMember(String seq);


	


	

}
