package good.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class GoodDTO {
	private int goodno;
	private int seq;
	private String memberid;
	private int goodcheck;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date gooddate;
	
}
