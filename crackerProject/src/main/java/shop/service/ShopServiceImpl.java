package shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crackeremail.bean.CrackeremailDTO;
import product.bean.ProductbuylistDTO;
import shop.bean.MemberbuylistDTO;
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

	@Override
	public Map<String, Object> shopcartForm(Map<String, String> map) {
		return shopDAO.shopcartForm(map);
	}

	@Override
	public List<ProductbuylistDTO> getcartView(String memberEmail) {
		return shopDAO.getcartView(memberEmail);
	}

	@Override
	public void cartViewDelete(Map<String, String> map) {
		shopDAO.cartViewDelete(map);
	}

	@Override
	public Map<String, Object> shopCartPay(Map<String, Object> map) {
		return shopDAO.shopCartPay(map);
	}

	@Override
	public void memberBuyList2(Map<String, String> map) {
		shopDAO.memberBuyList2(map);
		
	}

	@Override
	public void memberBuyList(Map<String, String> map) {
		shopDAO.memberBuyList(map);
		
	}

	@Override
	public List<MemberbuylistDTO> getbuylist(String memberemail) {
		return shopDAO.getbuylist(memberemail);
	}

}
