package good.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class GoodDAOMyBatis implements GoodDAO {
	
	@Autowired
	private SqlSession sqlSession=null;

	@Override
	public int goodCheck(Map<String, String> map) {
		return sqlSession.selectOne("goodSQL.goodCheck", map);
	}

	@Override
	public void insertGood(Map<String, String> map) {
		sqlSession.insert("goodSQL.insertGood",map);
	}

	@Override
	public void updateGood(String seq) {
		sqlSession.update("goodSQL.updateGood", seq);
	}

	@Override
	public void updateGoodCheck(Map<String, String> map) {
		sqlSession.update("goodSQL.updateGoodCheck",map);
	}

	@Override
	public void updateGoodCheckCancel(Map<String, String> map) {
		sqlSession.update("goodSQL.updateGoodCheckCancel",map);
	}

	@Override
	public void updateGoodCancel(String seq) {
		sqlSession.update("goodSQL.updateGoodCancel",seq);
	}

	@Override
	public void deleteGood(Map<String, String> map) {
		sqlSession.delete("goodSQL.deleteGood",map);
		
	}

	@Override
	public String goodCount(String seq) {
		return sqlSession.selectOne("goodSQL.goodCount",seq);
	}

}
