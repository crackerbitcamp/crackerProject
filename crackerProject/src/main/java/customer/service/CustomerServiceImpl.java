package customer.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import customer.dao.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private HttpSession session;
	@Autowired
	private CustomerDAO customerDAO;
	
	@Override
	public void customerWrite(Map<String, String> map) {
		customerDAO.customerWrite(map);

	}
	

	
}
