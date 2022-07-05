package comment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import comment.bean.CommentDTO;

@Repository
@Transactional
public class CommentDAOMybatis implements CommentDAO {
	
	@Autowired
	private SqlSession sqlSession=null;
	
	@Override
	public void commentWrite(Map<String, String> map) {
		sqlSession.insert("commentSQL.commentWrite",map);
		
	}

	@Override
	public List<CommentDTO> commentView(Map<String, String> map) {
		return sqlSession.selectList("commentSQL.commentOutput",map);
	
	}

	@Override
	public void commentReplyWrite(Map<String, String> map) {
		sqlSession.insert("commentSQL.commentReplyWrite",map);
		
	}

}
