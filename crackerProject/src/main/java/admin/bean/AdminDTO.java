package admin.bean;

import java.util.Date;

public class AdminDTO {
	private String adminname;
	private String adminid;
	private String adminmail1;
	private String adminmail2;
	private Date logtime;
	
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminmail1() {
		return adminmail1;
	}
	public void setAdminmail1(String adminmail1) {
		this.adminmail1 = adminmail1;
	}
	public String getAdminmail2() {
		return adminmail2;
	}
	public void setAdminmail2(String adminmail2) {
		this.adminmail2 = adminmail2;
	}
	public Date getLogtime() {
		return logtime;
	}
	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	
}
