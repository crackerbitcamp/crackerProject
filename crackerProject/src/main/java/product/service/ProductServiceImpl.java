package product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	@Override
	public void productMangeWrite(Map<String,String>map) {
		productDAO.productMangeWrite(map);
		
	}

	@Override
	public Map<String,Object> productMangeList(String pg) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
	//	List<ProductDTO> list = productDAO.productMangeList(map);

		Map<String,Object> sendMap = new HashMap<String,Object>();
		
	//	sendMap.put("list", list);
		
		return sendMap;
	}
}
