package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	public void memberWrite(MemberDTO memberDTO);

	public String memberIdCheck(String memberid);

	public MemberDTO memberLoginCheck(Map<String, String> map);

}
