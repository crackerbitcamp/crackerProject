package member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "memberSQL.";
	@Override
	public void memberWrite(Map<String, String> map) {
		sqlSession.insert("memberSQL.memberWrite",map);
	}
	@Override
	public MemberDTO memberLoginCheck(Map<String, String> map) {
		System.out.println(map);
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLoginCheck",map);
		return memberDTO;
	}
	@Override
	public MemberDTO memberfindIdcheck(Map<String,String>map1) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberfindIdcheck",map1);
		return memberDTO;
	}
	@Override
	public MemberDTO getMember(String memberemail) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",memberemail);
		return memberDTO;
	}
	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.memberUpdate",memberDTO);
	}
	@Override
	public MemberDTO memberFindPwd(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.memberFindPwd",map);
		
	}
	@Override
	public void memberPwdUpdate(Map<String, String> map1) {
		sqlSession.update("memberSQL.memberPwdUpdate",map1);
		
	}
	@Override
	public MemberDTO emailDB(String email) {
		System.out.println("DAO email = " + email);
		return sqlSession.selectOne("memberSQL.emailDB",email);
	}

}
