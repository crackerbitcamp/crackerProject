package product.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductJoinDTO {
	private int seq;
	private String productName;
	private String productSubject;
	private String productContent;
	private int productPrice;
	private int productQty;
	private String productCode;
	private String productCategory;
	private String mainPhoto;
	private String productOrigin;
	private String productWeight;
	private String productLife;
	private Date logtime;
}
