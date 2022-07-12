package customer.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import customer.bean.CustomerDTO;

@Repository
@Transactional
public class CustomerDAOMyBatis implements CustomerDAO {

	@Autowired
	private SqlSession sqlSession=null;
	
	@Override
	public void customerWrite(Map<String, String> map) {
		sqlSession.insert("customerSQL.customerWrite", map);
		
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("customerSQL.getTotalA");
	}

	@Override
	public List<CustomerDTO> getCustomerList(Map<String, Integer> map) {
		return sqlSession.selectList("customerSQL.getCustomerList",map);
	}

	@Override
	public CustomerDTO getCustomerView(String seq) {
		return sqlSession.selectOne("customerSQL.getCustomerView",Integer.parseInt(seq));
		
	}

	@Override
	public List<CustomerDTO> getcustomerSearch(Map<String, String> map) {
		return sqlSession.selectList("customerSQL.getcustomerSearch", map);
	}

	@Override
	public int getTotalSearchA(Map<String, String> map) {
		return sqlSession.selectOne("customerSQL.getTotalSearchA", map);
	}

}
