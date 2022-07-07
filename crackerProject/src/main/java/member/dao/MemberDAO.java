package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	public void memberWrite(MemberDTO memberDTO);

	public String memberIdCheck(String memberid);

	public MemberDTO memberLoginCheck(Map<String, String> map);

	public MemberDTO memberfindIdcheck(Map<String, String> map1);

	public MemberDTO getMember(String memberid);

	public void memberUpdate(MemberDTO memberDTO);

	public MemberDTO memberFindPwd(Map<String, String> map);




}
