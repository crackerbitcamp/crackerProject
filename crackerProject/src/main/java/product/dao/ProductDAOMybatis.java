package product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import product.bean.ProductDTO;

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
		
		System.out.println(map);
		sqlSession.insert("productSQL.productBoardWrite" , map);
		
	}
	
}
