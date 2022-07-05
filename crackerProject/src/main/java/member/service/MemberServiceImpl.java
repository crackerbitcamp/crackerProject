package member.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
//import net.nurigo.java_sdk.api.Message;
//import net.nurigo.java_sdk.exceptions.CoolsmsException;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	
		public void makeRandomNumber() {
			// 난수의 범위 111111 ~ 999999 (6자리 난수)
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			authNumber = checkNum;
		}
		
		
				//이메일 보낼 양식! 
		@Override
		public String emailcheck(String email) {
			makeRandomNumber();
			String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
			String content = 
					"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
	                "<br><br>" + 
				    "인증 번호는 " + authNumber + "입니다." + 
				    "<br>" + 
				    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
			mailSend(setFrom, toMail, title, content);
			return Integer.toString(authNumber);
		}
		
		//이메일 전송 메소드
		public void mailSend(String setFrom, String toMail, String title, String content) { 
			MimeMessage message = mailSender.createMimeMessage();
			// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
				helper.setText(content,true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
	@Override
	public MemberDTO memberWrite(Map<String, String> map) {
		System.out.println("membberService Map정보 : " +  map);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberid(map.get("memberid"));
		memberDTO.setMemberpwd(map.get("memberpwd"));
		memberDTO.setMembername(map.get("membername"));
		memberDTO.setMemberemail1(map.get("memberemail1"));
		memberDTO.setMemberemail2(map.get("memberemail2"));
		memberDTO.setMembertel1(map.get("membertel1"));
		memberDTO.setMembertel2(map.get("membertel2"));
		memberDTO.setMembertel3(map.get("membertel3"));
		memberDTO.setMembernickname(map.get("membernickname"));
		memberDAO.memberWrite(memberDTO);
		 
		 return memberDTO;
	}

	@Override
	public String memberIdCheck(String memberid) {
		String check = memberDAO.memberIdCheck(memberid);
		if(check == null) {
			check = "ok";
		}else {
			check = "fail";
		}
		return check;
	}

	@Override
	public MemberDTO memberLoginCheck(Map<String, String> map) {
		MemberDTO memberDTO = memberDAO.memberLoginCheck(map);
		return memberDTO;
	}


	@Override
	public String phoneCheck(String findtel) {
		String api_key = "NCSFYVT2OWOGPS5N";
	    String api_secret = "HGOBLW60MTMXGQ4O5QB7IQG2JJFKGZFG";
	    makeRandomNumber();
	    Message coolsms = new Message(api_key, api_secret);
	    
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", findtel);    // 수신전화번호
	    params.put("from", "01035181404");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[cracker] 인증번호는" + "["+authNumber+"]" + "입니다."); // 문자 내용 입력
	    try {
			coolsms.send(params);
		} catch (CoolsmsException e) {
			e.printStackTrace();
		}
		return Integer.toString(authNumber);
	}


	@Override
	public MemberDTO memberfindIdcheck(Map<String, String> map) {
		String tel = map.get("findtel");
		String membername = map.get("findName");
		String membertel1 = tel.substring(0, 3);
		String membertel2 = tel.substring(3,7);
		String membertel3 = tel.substring(7,11);
		Map<String, String> map1 = new HashMap<String,String>();
		map1.put("membername", membername);
		map1.put("membertel1", membertel1);
		map1.put("membertel2", membertel2);
		map1.put("membertel3", membertel3);
		MemberDTO memberDTO = memberDAO.memberfindIdcheck(map1);
		return memberDTO;
	}
}
