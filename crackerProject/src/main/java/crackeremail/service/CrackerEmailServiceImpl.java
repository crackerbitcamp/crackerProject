package crackeremail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crackeremail.bean.CrackeremailDTO;
import crackeremail.dao.CrackerEmailDAO;


@Service
public class CrackerEmailServiceImpl implements CrackerEmailService {
	@Autowired
	CrackerEmailDAO crackerEmailDAO;
	@Override
	public CrackeremailDTO emailSelect(String memberemail, String string) {
		CrackeremailDTO crackeremailDTO = crackerEmailDAO.emailSelect(memberemail,string);
		return crackeremailDTO;
	}

	@Override
	public void memberemailInsert(String memberemail, String membernickname, String membername, String string) {
		crackerEmailDAO.memberemailInsert(memberemail,membernickname,membername,string);
		
	}

}
