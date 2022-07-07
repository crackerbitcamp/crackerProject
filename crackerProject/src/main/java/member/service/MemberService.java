package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public MemberDTO memberWrite(Map<String, String> map);

	public String memberIdCheck(String memberid);

	public MemberDTO memberLoginCheck(Map<String, String> map);

	public String emailcheck(String email);

	public String phoneCheck(String findtel);

	public MemberDTO memberfindIdcheck(Map<String, String> map);

	public MemberDTO getMember(String memberid);

	public String updateEmailCheck(String email);

	public void memberUpdate(Map<String, String> map);

	public String memberFindPwd(Map<String, String> map);
}
