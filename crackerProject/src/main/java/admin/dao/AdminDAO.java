package admin.dao;

import java.util.List;
import java.util.Map;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public interface AdminDAO {

	public void adminWrite(Map<String, String> map);

	public List<MemberDTO> getadminMemberList(Map<String, Integer> map);
	
	

}
