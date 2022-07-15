package crackeremail.bean;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CrackeremailDTO {
	private String email;
	private String category;
}
