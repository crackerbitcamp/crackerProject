package member.controller;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import crackeremail.bean.CrackeremailDTO;
import crackeremail.service.CrackerEmailService;

@Controller
public class KakaoController {
	@Autowired
	private CrackerEmailService crackerEmailService;
	String access_Token;
	@GetMapping("/login/getKakaoAuthUrl")
	@ResponseBody
	public String getKakaoAuthUrl(){
		String Url = "https://kauth.kakao.com/oauth/authorize?client_id=a640c88afd6748f579a8b8662e7fdd80&redirect_uri=http://localhost:8080/index/member/kakaocallback&response_type=code";
		return Url;
	}

	// 카카오 연동정보 조회
	@RequestMapping(value = "/member/kakaocallback")
	public String oauthKakao(@RequestParam String code, HttpSession session){

		System.out.println("코드 토큰 인증 : " + code);
		access_Token = getAccessToken(code);
        System.out.println("토큰 들어오나 확인 !!  : " + access_Token);
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("엑세스 토큰 : " + access_Token);
        System.out.println("이메일 : " + userInfo.get("email"));
        System.out.println("닉네임 : " + userInfo.get("nickname"));
       
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        session.setAttribute("kakaoNickname", kakaoInfo.get("nickname"));
        session.setAttribute("kakaoEmail", kakaoInfo.get("email"));
        session.setAttribute("memLogin", kakaoInfo.get("nickname"));
        
        String email = (String) kakaoInfo.get("email");
        String nickname = (String) kakaoInfo.get("nickname");
        CrackeremailDTO crackeremailDTO = crackerEmailService.emailSelect(email,"kakao");
	      System.out.println("있나 없나 확인 ::" + crackeremailDTO);
	     if(crackeremailDTO == null) {
	    	 crackerEmailService.memberemailInsert(email,nickname,"kakao회원은 직접 입력해주세요.","kakao");
	     }
        
        
		return "/member/kakaocallback";
	}

	   public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=a640c88afd6748f579a8b8662e7fdd80");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/index/member/kakaocallback");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
	
	@GetMapping("/login/kakaoLogoutForm")
	@ResponseBody
	public String kakaoLogoutForm() throws IOException {
		String LogoutUrl = "https://kauth.kakao.com/oauth/logout?client_id=a640c88afd6748f579a8b8662e7fdd80&logout_redirect_uri=http://localhost:8080/index/member/kakaoLogout";
		return LogoutUrl;
	}
	@GetMapping("member/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
        } catch (IOException e) {
            e.printStackTrace();
        }
		return "/member/kakaoLogout";
	}
 }