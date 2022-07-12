package customer.service;

import java.util.Map;

import customer.bean.CustomerDTO;
import customer.bean.CustomerPaging;

public interface CustomerService {

	public void customerWrite(Map<String, String> map);

	public Map<String, Object> getCustomerList(String pg);

	public Map<String, Object> getCustomerView(String seq);

	public Map<String, Object> customerSearch(Map<String, String> map);



}
