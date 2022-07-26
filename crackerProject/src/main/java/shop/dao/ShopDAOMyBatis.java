package shop.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import crackeremail.bean.CrackeremailDTO;
import member.bean.MemberDTO;
import product.bean.ProductBoardDTO;
import product.bean.ProductJoinDTO;

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

	@Override
	public Map<String,Object> shopPay(Map<String, String> map) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",map.get("memberemail"));//회원정보찾기
		ProductJoinDTO productJoinDTO = sqlSession.selectOne("productSQL.getProductBoardView",map); //해당 ViewItem값전체 불러오기
		Map<String,Object>map1 = new HashMap<String,Object>();
		map1.put("memberDTO", memberDTO);
		map1.put("productJoinDTO",productJoinDTO);
		return map1;
	}

}
