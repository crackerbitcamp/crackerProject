package customer.dao;

import java.util.List;
import java.util.Map;

import customer.bean.CustomerDTO;

public interface CustomerDAO {

	public void customerWrite(Map<String, String> map);

	public int getTotalA();

	public List<CustomerDTO> getCustomerList(Map<String, Integer> map);

	public CustomerDTO getCustomerView(String seq);

	public List<CustomerDTO> getcustomerSearch(Map<String, String> map);

	public int getTotalSearchA(Map<String, String> map);

	
}
