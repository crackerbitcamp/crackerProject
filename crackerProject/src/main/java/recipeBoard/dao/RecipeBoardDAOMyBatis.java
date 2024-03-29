
package recipeBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;
import recipeBoard.bean.RecipeBoardDTO;

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
	public List<BoardDTO> getRecipeBoardList(Map<String, String> map) {
		System.out.println(map);
		return sqlSession.selectList("recipeBoardSQL.getRecipeBoardList",map);
	}

	@Override
	public RecipeBoardDTO getRecipeBoardView(String seq) {
		
		return sqlSession.selectOne("recipeBoardSQL.getRecipeBoardView",Integer.parseInt(seq));
	}

	@Override
	public List<BoardDTO> getRecipeBoardListIndex(Map<String, String> map) {
		
		return sqlSession.selectList("recipeBoardSQL.getRecipeBoardListIndex",map);
	}

	@Override
	public int getTotalA(Map<String, String> map) {
		
		return sqlSession.selectOne("recipeBoardSQL.getTotalA",map);
	}

	@Override
	public List<BoardDTO> getRecipeBoardSearch(Map<String, String> map) {
		
		return sqlSession.selectList("recipeBoardSQL.getRecipeBoardSearch",map);
	}

	@Override
	public int getTotalSearchA(Map<String, String> map) {
		
		return sqlSession.selectOne("recipeBoardSQL.getTotalSearchA", map);
	}

	@Override
	public void recipeBoardDelete(int seq) {
		sqlSession.delete("recipeBoardSQL.recipeBoardDelete", seq);
		
	}

	@Override
	public void recipeBoardUpdate(Map<String, String> map) {
		sqlSession.update("recipeBoardSQL.recipeBoardUpdate", map);
		
	}

	@Override
	public void setHit(String seq) {
		sqlSession.update("recipeBoardSQL.setHit",Integer.parseInt(seq));
		
	}

	
	
}
