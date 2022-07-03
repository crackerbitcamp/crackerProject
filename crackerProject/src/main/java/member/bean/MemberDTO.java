package member.bean;

import java.util.Date;

import lombok.Data;
@Data
public class MemberDTO {
	private String membername, memberid, 
	memberpwd, 
	memberemail1,
	memberemail2,
	membertel1,
	membertel2,
	membertel3;
	Date logtime;
}
