package member.bean;

import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
@Component
public class MemberDTO {
	private String membername, memberid, 
	memberpwd, 
	memberemail1,
	memberemail2,
	membertel1,
	membertel2,
	membertel3,
	membernickname;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	Date logtime;


}
