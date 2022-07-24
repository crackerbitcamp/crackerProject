package shop.service;

import java.util.Map;

import crackeremail.bean.CrackeremailDTO;

public interface ShopService {

	public CrackeremailDTO getProductBuy(String memEmail);

	public void memberaddressUpdate(Map<String, String> map);

}
