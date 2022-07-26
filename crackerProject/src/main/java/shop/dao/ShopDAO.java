package shop.dao;

import java.util.Map;

import crackeremail.bean.CrackeremailDTO;
import member.bean.MemberDTO;

public interface ShopDAO {

	public CrackeremailDTO getProductBuy(String memEmail);

	public void memberaddressUpdate(Map<String, String> map);

	public Map<String,Object> shopPay(Map<String, String> map);

	public Map<String, Object> shopcartForm(Map<String, String> map);

}
