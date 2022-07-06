package customer.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CustomerDAOMyBatis implements CustomerDAO {

	@Autowired
	private SqlSession sqlSession=null;
	
	@Override
	public void customerWrite(Map<String, String> map) {
		sqlSession.insert("customerSQL.customerWrite", map);
		
	}

}
