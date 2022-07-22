package product.service;

import java.util.Map;

import product.bean.ProductDTO;

public interface ProductService {

	public void productWrite(Map<String,String>map);

	public Map<String, Object> getProductMangeList(String pg);

	public ProductDTO getProduct(Map<String, String> map);

	public void productBoardWrite(Map<String,Object> map);

	public Map<String, Object> getProductBoardList();

}
