package admin.service;

import java.util.Map;

import admin.bean.AdminDTO;

public interface AdminService {

	public void adminWrite(Map<String, String> map);

	public Map<String, Object> getadminMemberList(String pg);
		
		
	

}
