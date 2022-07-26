package shop.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crackeremail.bean.CrackeremailDTO;
import shop.dao.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ShopDAO shopDAO;

	@Override
	public CrackeremailDTO getProductBuy(String memEmail) {
		return shopDAO.getProductBuy(memEmail);
	}

	@Override
	public void memberaddressUpdate(Map<String, String> map) {
		shopDAO.memberaddressUpdate(map);
	}

	@Override
	public Map<String,Object> shopPay(Map<String, String> map) {
		return shopDAO.shopPay(map);
	}

}
