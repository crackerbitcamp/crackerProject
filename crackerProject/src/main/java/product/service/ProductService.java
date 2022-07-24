package product.service;

import java.util.List;
import java.util.Map;

import product.bean.ProductDTO;
import product.bean.ProductJoinDTO;

public interface ProductService {

	public void productWrite(Map<String,String>map);

	public Map<String, Object> getProductMangeList(String pg);

	public ProductDTO getProduct(Map<String, String> map);

	public void productBoardWrite(Map<String,Object> map);

	public Map<String, Object> getProductBoardList(Map<String,String> map);

	public ProductJoinDTO getProductBoardView(Map<String, String> map);

	public List<ProductJoinDTO> productSearch(String keyword);

}
