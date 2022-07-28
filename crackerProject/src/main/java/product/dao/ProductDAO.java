package product.dao;

import java.util.List;
import java.util.Map;

import product.bean.ProductDTO;
import product.bean.ProductJoinDTO;

public interface ProductDAO {

	public void productWrite(Map<String, String> map);

	public List<ProductDTO> getProductMangeList(Map<String, Integer> map);

	public ProductDTO getProduct(Map<String, String> map);

	public void productBoardWirite(Map<String,Object> map);

	public Map<String, Object> getProductBoardList(Map<String,String> map);

	public ProductJoinDTO getProductBoardView(Map<String, String> map);

	public List<ProductJoinDTO> productSearch(String keyword);

	public void productDelete(Map<String, String> map);

	public void productUpdate(Map<String, String> map);

	public void productBoardDelete(Map<String, String> map);


}
