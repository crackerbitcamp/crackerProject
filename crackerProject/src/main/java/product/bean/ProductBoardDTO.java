package product.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductBoardDTO {
	private int seq;
	private String productName;
	private String productSubject;
	private String productContent;
	private int productPrice;
	private int productQty;
	private Date logtime;
	
}
