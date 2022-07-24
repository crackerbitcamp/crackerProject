package product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import product.bean.ProductDTO;
import product.bean.ProductJoinDTO;

@Transactional
@Repository
public class ProductDAOMybatis implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void productWrite(Map<String, String> map) {
		sqlSession.insert("productSQL.productWrite", map);
		
	}
	@Override
	public List<ProductDTO> getProductMangeList(Map<String, Integer> map) {
		return sqlSession.selectList("productSQL.getProductMangeList", map);
		
	}
	@Override
	public ProductDTO getProduct(Map<String, String> map) {
		
		return sqlSession.selectOne("productSQL.getProduct",map);
	}
	@Override
	public void productBoardWirite(Map<String,Object> map) {
		

		sqlSession.insert("productSQL.productBoardWrite" , map);
		
	}
	@Override
	public Map<String, Object> getProductBoardList(Map<String,String> map) {
		
		List<ProductJoinDTO>list = new ArrayList<ProductJoinDTO>();
		list = sqlSession.selectList("productSQL.getProductBoardList",map);
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("list",list);

		return sendMap;
	}
	@Override
	public ProductJoinDTO getProductBoardView(Map<String, String> map) {
	
		return sqlSession.selectOne("productSQL.getProductBoardView", map);
	}

}
