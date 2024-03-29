package member.bean;

import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class MemberDTO {
	private int memberseq;
	private String 	
					memberemail,
					membername, 
					memberpwd, 
					membertel1,
					membertel2,
					membertel3,
					memberaddress1,
					memberaddress2,
					memberzipcode,
					membernickname;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	Date logtime;


}
