package admin.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AdminDAOMyBatis implements AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void adminLogin(Map<String, String> map) {
		sqlSession.insert("adminSQL.adminLogin",map);
		
	}
	
}
