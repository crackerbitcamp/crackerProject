package product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.bean.ProductDTO;
import product.bean.ProductJoinDTO;
import product.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	@Override
	public void productWrite(Map<String,String>map) {
		productDAO.productWrite(map);
		
	}

	@Override
	public Map<String,Object> getProductMangeList(String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ProductDTO> list = productDAO.getProductMangeList(map);

		Map<String,Object> sendMap = new HashMap<String,Object>();
		
		sendMap.put("list", list);
		
		return sendMap;
	}

	@Override
	public ProductDTO getProduct(Map<String, String> map) {
		
		return productDAO.getProduct(map);
	}

	@Override
	public void productBoardWrite(Map<String,Object> map) {
		map.put("productQty",Integer.parseInt((String) map.get("productQty")));
		map.put("productPrice",Integer.parseInt((String) map.get("productPrice")));
		map.put("productCode", map.get("productCode")+"");
		map.put("productSubject", map.get("productSubject")+"");
		map.put("productContent", map.get("productContent")+"");
		
		System.out.println(map);
		
		productDAO.productBoardWirite(map);
		
	}

	@Override
	public Map<String, Object> getProductBoardList(Map<String,String> map) {
		
		
		return productDAO.getProductBoardList(map);
	}

	@Override
	public ProductJoinDTO getProductBoardView(Map<String, String> map) {
		
		return productDAO.getProductBoardView(map);
	}
}
