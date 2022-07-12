package admin.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;


@Repository
@Transactional
public class AdminDAOMyBatis implements AdminDAO {
	

	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminDTO adminLogin(Map<String, String> map) {
		return sqlSession.selectOne("adminSQL.adminLogin",map);
		
	}	
	@Override
	public void adminWrite(Map<String, String> map) {
		
		sqlSession.insert("adminSQL.adminWrite", map);
		
	}

	@Override
	public List<MemberDTO> getadminMemberList(Map<String, Integer> map) {
		
		return sqlSession.selectList("adminSQL.getadminMemberList", map);

	}
	
	@Override
	public int getAdminMemberTotalA() {
		
		return sqlSession.selectOne("adminSQL.getAdminMemberTotalA");
	}
	
	
	@Override
	public void adminMemberDelete(Map<String, String[]> map) {
		
		sqlSession.delete("adminSQL.adminMemberDelete", map);
		
	}
	@Override
	public List<MemberDTO> getadminMemberSerach(Map<String, Object> map) {
		
		return sqlSession.selectList("adminSQL.getadminMemberSerach");
	}
	@Override
	public int getTotalSearchA(Map<String, Object> map) {
		
		return sqlSession.selectOne("adminSQL.getTotalSearchA", map);
	}

	
}
