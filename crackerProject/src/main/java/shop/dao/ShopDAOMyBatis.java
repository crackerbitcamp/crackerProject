package shop.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import crackeremail.bean.CrackeremailDTO;
import member.bean.MemberDTO;

@Repository
@Transactional
public class ShopDAOMyBatis implements ShopDAO {
	
	@Autowired
	private SqlSession sqlSession=null;

	@Override
	public CrackeremailDTO getProductBuy(String memEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopSQL.getProductBuy",memEmail);
	}

	@Override
	public void memberaddressUpdate(Map<String, String> map) {
		System.out.println(map);
		sqlSession.update("shopSQL.memberaddressUpdate",map);
		
	}

}
