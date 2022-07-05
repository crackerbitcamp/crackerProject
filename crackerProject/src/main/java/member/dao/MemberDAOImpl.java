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
	public void memberWrite(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.memberWrite",memberDTO);
	}
	@Override
	public String memberIdCheck(String memberid) {
		String check = sqlSession.selectOne("memberSQL.memberIdCheck",memberid);
		return check;
	}
	@Override
	public MemberDTO memberLoginCheck(Map<String, String> map) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLoginCheck",map);
		return memberDTO;
	}
	@Override
	public MemberDTO memberfindIdcheck(Map<String,String>map1) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberfindIdcheck",map1);
		return memberDTO;
	}
	@Override
	public MemberDTO getMember(String memberid) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",memberid);
		return memberDTO;
	}
}
