package crackeremail.bean;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CrackeremailDTO {
	private int seq;
	private String email;
	private String category;
	private String nickname;
	private String name;
}
