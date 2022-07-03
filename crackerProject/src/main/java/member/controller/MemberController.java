package member.controller;

import java.util.Map;

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
@RequestMapping(value = "/member",produces="application/text;charset=utf-8" )
public class MemberController {
	@Autowired
	private MemberService memberService;
	@GetMapping("/memberLoginForm")
	public ModelAndView memberLoginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberLoginForm");
		return mav;
	}
	
	@GetMapping(value = "memberWriteForm")
	public ModelAndView memberWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberWriteForm");
		return mav;
	}
	
	@PostMapping("/memberWrite")
	@ResponseBody
	public MemberDTO memberWrite(@RequestParam Map<String,String>map) {
		MemberDTO memberDTO = memberService.memberWrite(map);
		return memberDTO;
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
}
