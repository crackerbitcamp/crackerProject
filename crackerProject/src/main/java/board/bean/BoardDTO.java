package board.bean;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq;
	private String nickname;
	private String name;
	private String email;
	private String subject;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private int pseq; 
	private int reply; 
	private int hit;
	private int goodcount;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtime;

}
