package admin.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;
import recipeBoard.bean.RecipeBoardDTO;


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
	public List<MemberDTO> getadminMemberSearch(Map<String, String> map) {
		return sqlSession.selectList("adminSQL.getadminMemberSearch",map);
	}
	@Override
	public int getTotalSearchA(Map<String, String> map) {
		return sqlSession.selectOne("adminSQL.getTotalSearchA", map);
	}
	@Override
	public int loginMember(int i) {		
		
		return sqlSession.selectOne("memberSQL.loginMember",i);
	}
	@Override
	public int dayLoginMember(int i) {
		return sqlSession.selectOne("memberSQL.dayLoginMember",i);
	}
	
	@Override
	public List<RecipeBoardDTO> getadminRecipeList(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getadminRecipeList",map);
	}

	@Override
	public int getAdminRecipeTotalA(Map<String, Integer> map) {
		return sqlSession.selectOne("adminSQL.getAdminRecipeTotalA");
	}
	
	@Override
	public List<RecipeBoardDTO> adminrecipeSearch(Map<String, String> map) {
		List<RecipeBoardDTO> list = sqlSession.selectList("adminSQL.adminrecipeSearch", map);
		return list;
		
	}
	@Override
	public int getAdminRecipeSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("adminSQL.getAdminRecipeSearchTotalA", map);
	}

	
}
