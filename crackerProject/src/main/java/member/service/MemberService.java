package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public void memberWrite(Map<String, String> map);

	public MemberDTO memberLoginCheck(Map<String, String> map);

	public String emailcheck(String email);

	public String phoneCheck(String findphone);

	public MemberDTO memberfindIdcheck(Map<String, String> map);

	public MemberDTO getMember(String memberemail);

	public String updateEmailCheck(String email);

	public void memberUpdate(Map<String, String> map);

	public String memberFindPwd(Map<String, String> map);

	public String emailDB(String email);
}
