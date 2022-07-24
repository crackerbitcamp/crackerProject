package crackeremail.service;

import crackeremail.bean.CrackeremailDTO;

public interface CrackerEmailService {

	public CrackeremailDTO emailSelect(String memberemail, String string);

	public void memberemailInsert(String memberemail,String membernickname,String membername, String string);

}
