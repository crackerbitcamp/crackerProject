package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Repository
@Transactional
public class AdminDAOMyBatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession = null;

	@Override
	public void adminWrite(Map<String, String> map) {
		sqlSession.insert("adminSQL.adminWrite", map);
		
	}

	@Override
	public List<MemberDTO> getadminMemberList(Map<String, Integer> map) {
		System.out.println(map.get("adminname"));
		return sqlSession.selectList("adminSQL.getadminMemberList", map);

	}
	
}
