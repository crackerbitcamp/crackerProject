package admin.bean;

import java.util.Date;


import lombok.Data;

@Data
public class AdminDTO {
	private String adminname;
	private String adminid;
	private String adminpwd;
	private String adminmail1;
	private String adminmail2;
	private Date logtime;

	
	
	
}
