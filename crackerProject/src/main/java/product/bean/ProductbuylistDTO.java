package product.bean;


import lombok.Data;

@Data
public class ProductbuylistDTO {
	private int productseq,productprice,productqty,producttotalprice,productdelivery;
	private String productimg,
	productsubject,
	productcontent,
	memberemail;
	
}
