package recipeBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Repository
@Transactional
public class RecipeBoardDAOMyBatis implements RecipeBoardDAO {
	
	@Autowired
	private SqlSession sqlSession=null;
	
	@Override
	public void recipeBoardWrite(Map<String, String> map) {
		
		sqlSession.insert("recipeBoardSQL.recipeBoardWrite",map);
	}

	@Override
	public List<BoardDTO> getRecipeBoardList(Map<String, Integer> map) {
		
		return sqlSession.selectList("recipeBoardSQL.getRecipeBoardList",map);
	}

}
