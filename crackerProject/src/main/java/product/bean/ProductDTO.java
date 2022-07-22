package product.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int seq;
	private String productCode;
	private String productName;
	private String productCategory;
	private String mainPhoto;
	private String productOrigin;
	private String productWeight;
	private String productLife;
	private Date logtime;
}
