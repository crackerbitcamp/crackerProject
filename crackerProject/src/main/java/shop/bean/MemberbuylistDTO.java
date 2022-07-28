package shop.bean;

import lombok.Data;

@Data
public class MemberbuylistDTO {
	private String productsubject, productphoto, productbuydate, 
					memberemail, membername, membertel, memberaddress; 
	private int productordernumber, productprice, productqty;
	
}
