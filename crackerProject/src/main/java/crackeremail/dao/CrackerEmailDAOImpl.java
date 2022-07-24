package crackeremail.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import crackeremail.bean.CrackeremailDTO;

@Repository
@Transactional
public class CrackerEmailDAOImpl implements CrackerEmailDAO {

	@Autowired
	private SqlSession sqlSession=null;

	@Override
	public CrackeremailDTO emailSelect(String memberemail, String string) {
		Map<String,String>map = new HashMap<String,String>();
		map.put("email", memberemail);
		map.put("category", string);
		return sqlSession.selectOne("emailSQL.emailSelect",map);
	}

	@Override
	public void memberemailInsert(String memberemail, String membernickname, String membername, String string) {
		Map<String,String>map = new HashMap<String,String>();
		map.put("email", memberemail);
		map.put("category", string);
		map.put("nickname", membernickname);
		map.put("name", membername);
		sqlSession.insert("emailSQL.memberemailInsert",map);
	}
}
