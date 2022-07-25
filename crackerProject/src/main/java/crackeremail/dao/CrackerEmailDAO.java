package crackeremail.dao;

import crackeremail.bean.CrackeremailDTO;

public interface CrackerEmailDAO {

	public CrackeremailDTO emailSelect(String memberemail, String string);

	public void memberemailInsert(String memberemail,String membernickname,String membername, String string);

}
