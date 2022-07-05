package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value = "/member",produces="application/json;charset=utf-8" )

public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인
	@GetMapping("/memberLoginForm")
	public ModelAndView memberLoginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberLoginForm");
		return mav;
	}
	
   @PostMapping("/memberLoginCheck")
   @ResponseBody
   public MemberDTO memberLoginCheck(@RequestParam Map<String,String>map, HttpSession session) {
      MemberDTO memberDTO = memberService.memberLoginCheck(map);
      if(memberDTO != null) {
	      String email = memberDTO.getMemberemail1()+"@"+memberDTO.getMemberemail2();
	      session.setAttribute("memId", memberDTO.getMemberid());
	      session.setAttribute("memName", memberDTO.getMembername());
	      session.setAttribute("memEmail", email);
	      session.setAttribute("memNickname", memberDTO.getMembernickname());
      }
      return memberDTO;
   }
   
   @GetMapping("/memberLogout")
   public String memberlogout(HttpSession session) {
	   session.invalidate();
	   return "/index";
   }
   
   //회원정보 수정
   @GetMapping("/memberUpdatePasswordCheckForm")
   public ModelAndView memberUpdateForm(HttpSession session) {
	   String memberid = (String)session.getAttribute("memId");
	   MemberDTO memberDTO = memberService.getMember(memberid);
	   ModelAndView mav = new ModelAndView();
	   Map<String,Object>map = new HashMap<String,Object>();
	   map.put("memberDTO", memberDTO);
	   mav.addObject("memberDTO",map.get("memberDTO"));
	   mav.setViewName("/member/memberUpdatePasswordCheckForm");
	   return mav;
   }
   
   //회원가입
	@GetMapping(value = "memberWriteForm")
	public ModelAndView memberWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberWriteForm");
		return mav;
	}
	
	@PostMapping("/memberWrite")
	@ResponseBody
	public String memberWrite(@RequestParam Map<String,String>map) {
		MemberDTO memberDTO = memberService.memberWrite(map);
		System.out.println("memberDTO" + memberDTO);
		return memberDTO.getMembernickname();
	}
	@PostMapping("/memberIdCheck")
	@ResponseBody
	public String memberIdCheck(@RequestParam String memberid) {
		String check = memberService.memberIdCheck(memberid);
		return check;
	}
	@GetMapping("/emailcheck")
	@ResponseBody
	public String emailcheck(@RequestParam String email) {
		System.out.println("email 확인 : " + email);
		return memberService.emailcheck(email);
	}
	@GetMapping("/memberFindIdForm")
	public ModelAndView memberFindIdForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberFindIdForm");
		return mav;
	}
	
	@GetMapping("/phoneCheck")
	@ResponseBody
	public String phoneCheck(@RequestParam String findtel) {
		return memberService.phoneCheck(findtel);
	}
	
	@PostMapping("/memberfindIdcheck")
	@ResponseBody
	public String memberfindIdcheck(@RequestParam Map<String,String>map) {
		 MemberDTO memberDTO  = memberService.memberfindIdcheck(map);
		 return memberDTO.getMemberid();
	}
	@GetMapping("/memberFindId")
	public String memberFindId() {
		
		return "/member/memberFindId";
	}
}

