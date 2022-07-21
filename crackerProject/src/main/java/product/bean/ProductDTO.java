package product.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int seq;
	private String productName;
	private String productCategory;
	private String mainPhoto;
	private String productSubject;
	private String productContent;
	private int productPrice;
	private int productQty;
	private String productOrigin;
	private String productWeight;
	private String productLife;
	private Date logtime;
}
