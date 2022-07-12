package customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminDTO;
import admin.dao.AdminDAO;
import board.bean.BoardDTO;
import board.bean.BoardPaging;
import customer.bean.CustomerDTO;
import customer.bean.CustomerPaging;
import customer.dao.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private CustomerPaging customerPaging;
	
	@Override
	public void customerWrite(Map<String, String> map) {
		customerDAO.customerWrite(map);

	}

	@Override
	public Map<String, Object> getCustomerList(String pg) {
		//DB 1페이지당 5개
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		List<CustomerDTO> list = customerDAO.getCustomerList(map);
		String sionAdminId=(String)session.getAttribute("sionAdminId");
		//페이징 처리
		customerPaging = this.customerPaging(pg);
		
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("sionAdminId",sionAdminId);
		sendMap.put("list", list);
		sendMap.put("customerPaging", customerPaging);
		sendMap.put("pg", pg);
		return sendMap;
	}
	
	public CustomerPaging customerPaging(String pg) {
		int totalA = customerDAO.getTotalA();
	
		customerPaging.setCurrentPage(Integer.parseInt(pg));
		customerPaging.setPageBlock(3);
		customerPaging.setPageSize(5);
		customerPaging.setTotalA(totalA);
		customerPaging.makePagingHTML();
		return customerPaging;
	}

	@Override
	public Map<String, Object> getCustomerView(String seq) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CustomerDTO customerDTO = customerDAO.getCustomerView(seq);	
		map.put("customerDTO",customerDTO);
		
		return map;
	}

	@Override
	public Map<String, Object> customerSearch(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum - 4;
		
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		
		List<CustomerDTO> list = customerDAO.getcustomerSearch(map);
		//페이징 처리
		int totalA = customerDAO.getTotalSearchA(map); //총글수
		customerPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		customerPaging.setPageBlock(3);
		customerPaging.setPageSize(5);
		customerPaging.setTotalA(totalA);
		customerPaging.makePagingHTML();
		
		Map<String,Object> sendMap = new HashMap<String,Object>();

		sendMap.put("list", list);
		sendMap.put("customerPaging", customerPaging);

		return sendMap;
	}

	
}
