package product.service;

import java.util.Map;

public interface ProductService {

	public void productMangeWrite(Map<String,String>map);

	public Map<String,Object> productMangeList(String pg);

}
