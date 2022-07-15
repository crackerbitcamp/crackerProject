package recipeBoard.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RecipeBoardDTO {
	private int seq;
	private String category,nickName,name,emil,subject,content,hit,goodCount;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtime;
	
	
}
