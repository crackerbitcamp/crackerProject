package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public MemberDTO memberWrite(Map<String, String> map);

	public String memberIdCheck(String memberid);

	public MemberDTO memberLoginCheck(Map<String, String> map);

	public String emailcheck(String email);
}
