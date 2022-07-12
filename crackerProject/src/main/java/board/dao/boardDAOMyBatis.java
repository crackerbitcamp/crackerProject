package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Repository
@Transactional
public class boardDAOMyBatis implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession=null;
	
	@Override
	public void boardWrite(Map<String, String> map) {
		
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		
		return sqlSession.selectList("boardSQL.getBoardList",map);
	}

	@Override
	public int getTotalA() {
		
		return sqlSession.selectOne("boardSQL.getTotalA");
	}

	@Override
	public BoardDTO getBoardView(String seq) {
		
		return sqlSession.selectOne("boardSQL.getBoardView",Integer.parseInt(seq));
	}

	@Override
	public void setHit(String seq) {
		sqlSession.update("boardSQL.setHit",Integer.parseInt(seq));
		
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardReply",map);
		
	}

	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		
		return sqlSession.selectList("boardSQL.getBoardSearch",map);
	}

	@Override
	public int getTotalSearchA(Map<String, String> map) {
		
		return sqlSession.selectOne("boardSQL.getTotalSearchA", map);
	}

	@Override

	public void boardUpdate(Map<String, String> map) {
		sqlSession.update("boardSQL.boardUpdate", map);
		
	}

	@Override
	public void boardDelete(int seq) {
		sqlSession.delete("boardSQL.boardDelete", seq);
	}

	public List<BoardDTO> getAllBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList",map);

	}

	@Override
	public List<BoardDTO> getRecipeBoardList(Map<String, Integer> map) {
	
		return sqlSession.selectList("boardSQL.getRecipeBoardList",map);
	}

	@Override
	public BoardDTO getRecipeBoardView(String seq) {
		
		return sqlSession.selectOne("boardSQL.getRecipeBoardView",Integer.parseInt(seq));
	}


}
