package admin.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AdminDTO {
	private String adminname;
	private String adminid;
	private String adminpwd;
	private String adminmail1;
	private String adminmail2;
	private Date logtime;
	
}
