package shop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import crackeremail.bean.CrackeremailDTO;
import member.bean.MemberDTO;
import product.bean.ProductBoardDTO;
import product.bean.ProductJoinDTO;
import product.bean.ProductbuylistDTO;

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

	@Override
	public Map<String, Object> shopcartForm(Map<String, String> map) {
		ProductJoinDTO productJoinDTO = sqlSession.selectOne("productSQL.getProductBoardView",map);
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",map.get("memberemail"));
		if(memberDTO.getMemberaddress1() != null) {
		ProductbuylistDTO productbuylistDTO = new ProductbuylistDTO();
		productbuylistDTO.setMemberemail(map.get("memberemail"));
		productbuylistDTO.setProductcontent(productJoinDTO.getProductContent());
		productbuylistDTO.setProductimg(productJoinDTO.getMainPhoto());
		productbuylistDTO.setProductprice(productJoinDTO.getProductPrice());
		productbuylistDTO.setProductqty(Integer.parseInt(map.get("shopqty")));
		productbuylistDTO.setProductseq(productJoinDTO.getSeq());
		productbuylistDTO.setProductsubject(productJoinDTO.getProductSubject());
		productbuylistDTO.setProducttotalprice(Integer.parseInt(map.get("totalprice")));
		
		int su = sqlSession.selectOne("shopSQL.productbuylistSelectOne",productbuylistDTO);
		System.out.println("int su = " + su);
		if(su == 0) {
			sqlSession.insert("shopSQL.productbuylistInsert",productbuylistDTO);
		}else {
			productbuylistDTO = sqlSession.selectOne("shopSQL.productbuylistSelect",productbuylistDTO);
			map.put("productqty", productbuylistDTO.getProductqty()+"");
			map.put("Producttotalprice", productbuylistDTO.getProducttotalprice()+"");
			sqlSession.update("shopSQL.productbuylistQtyUpdate",map);
			System.out.println("변경된 Map  : "+map);
			}
		}
		Map<String,Object>map1 = new HashMap<String,Object>();
		map1.put("Memberaddress1", memberDTO.getMemberaddress1());
		return map1;
	}

	@Override
	public List<ProductbuylistDTO> getcartView(String memberEmail) {
		return sqlSession.selectList("shopSQL.getcartView",memberEmail);
	}

	@Override
	public void cartViewDelete(Map<String, String> map) {
		sqlSession.delete("shopSQL.cartViewDelete",map);
	}

	
	
	
	@Override
	public Map<String, Object> shopCartPay(Map<String, Object> map) {
		String seq = (String)map.get("list");
		String result = seq.replaceAll("\\\"","");
		String result1 = result.replaceAll("\\[", "");
		String result2 = result1.replaceAll("\\]", "");
		
		
		String[] productseq = result2.split(",");
		
		
		ProductbuylistDTO productbuylistDTO = null;
		List <ProductbuylistDTO> list = new ArrayList<ProductbuylistDTO>();
		for(int i = 0;  i < productseq.length; i++) {
			map.put("productseq", productseq[i]);
			productbuylistDTO = sqlSession.selectOne("shopSQL.cartBuyList",map);
			list.add(productbuylistDTO);
		}
		map.put("productbuylistDTO", list);
		
		
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",map.get("memberemail"));
		//map에 담을 데이터
		map.put("memberemail", memberDTO.getMemberemail());
		map.put("membername", memberDTO.getMembername());
		map.put("membertel", memberDTO.getMembertel1()+memberDTO.getMembertel2()+memberDTO.getMembertel3());
		map.put("memberaddress", memberDTO.getMemberaddress1()+memberDTO.getMemberaddress2());
		
		return map;
	}

}
