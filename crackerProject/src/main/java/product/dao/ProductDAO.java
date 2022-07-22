package product.dao;

import java.util.List;
import java.util.Map;

import product.bean.ProductDTO;

public interface ProductDAO {

	public void productWrite(Map<String, String> map);

	public List<ProductDTO> getProductMangeList(Map<String, Integer> map);

	public ProductDTO getProduct(Map<String, String> map);

	public void productBoardWirite(Map<String,Object> map);

	public Map<String, Object> getProductBoardList();

}
