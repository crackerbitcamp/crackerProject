package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	public void memberWrite(Map<String, String> map);

	public MemberDTO memberLoginCheck(Map<String, String> map);

	public MemberDTO memberfindIdcheck(Map<String, String> map1);

	public MemberDTO getMember(String memberid);

	public void memberUpdate(MemberDTO memberDTO);

	public MemberDTO memberFindPwd(Map<String, String> map);

	public void memberPwdUpdate(Map<String, String> map1);

	public MemberDTO emailDB(String email);

	public void memberDelete(String memberemail);




}
