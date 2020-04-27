package join.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chatMatching.spring.SmsService;
import join.member.Member;
import join.service.JoinServiceImpl;

@Controller
public class JoinController {
	private JoinServiceImpl service;
	private SmsService smsService;
	
	public void setService(JoinServiceImpl service) {
		this.service = service;
	}
		

	public void setSmsService(SmsService smsService) {
		this.smsService = smsService;
	}



	//이용약관 페이지 이동
	@RequestMapping("/join/step1")
	public String handleStep1() {

		return "join/step1";
	}
	
	
	//이용약관을 거치지 않고 회원가입 페이지로 직접 이동했을 경우 
	@RequestMapping(value="/join/step2", method=RequestMethod.GET)
	public String handleStep2() {
		
		return "redirect:/join/step1";
	}
	
	//이용약관 동의한 경우 회원가입 페이지로 이동
	@RequestMapping(value="/join/step2", method=RequestMethod.POST)
	public String handleStep2(Model model) {
	
		return "join/step2";		
	}
	
	//회원가입 email중복확인
	@RequestMapping(value="/join/emailCheck", method=RequestMethod.POST)
	@ResponseBody
	public String emailCheck(@RequestBody String email) {
		String result = service.Check("이메일",email);

		return result;
	}
	
	//회원가입 userCode중복확인
	@RequestMapping(value="/join/usercodeCheck", method=RequestMethod.POST)
	@ResponseBody
	public String usercodeCheck(@RequestBody String userCode) {
		String result = service.Check("닉네임",userCode);

		return result;
	}
	
	//인증번호 발송
	@RequestMapping(value="/join/send", method=RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String sendSms(@RequestBody String phone, HttpSession session) {
		int num = (int)(Math.random()*10000)+1;
		
		String random = Integer.toString(num);
		System.out.println("요청한 폰번호: " + phone+ ", 발송된 인증버노:" + random);
		
		//인증문자보내는 메서드(random); 
//		smsService.sendSms(phone , random);
		session.setAttribute("random", random);
		session.setAttribute("phone", phone);
		return "인증번호가 발송되었습니다.";
	}
	
	//발송된 인증번호 검사(휴대폰으로 인증번호 발송)
	@RequestMapping(value="/join/CheckRanPhone", method=RequestMethod.POST)
	@ResponseBody
	public String CheckRanPhone(@RequestBody String userRan, HttpSession session) {
		//사용자가 입력한 인증번호와 세션에 저장된 발송된 인증번호 비교
		System.out.println("사용자가 입력한 인증번호:"+userRan);
		System.out.println("세션저정"+session.getAttribute("random"));
		
		if(userRan.equals(session.getAttribute("random"))) {
			System.out.println("인증번호 일치");			
			/*
			 * //회원정보가 있는 휴대폰번호로 인증번호 검증 if(session.getAttribute("phone") != null) {
			 * System.out.println("0리턴"); String phone
			 * =(String)session.getAttribute("phone"); System.out.println(); Member member =
			 * service.selectUser("휴대폰번호", (String)session.getAttribute("phone"));
			 * session.setAttribute("myEmail", member.getEmail()); check= "0"; }else {
			 * //회원가입시 인증번호 검증 check = "0"; }
			 */
			return "0";
		}else {
			System.out.println("1리턴");
			return "1";
		}

	}
	
	//발송된 인증번호 검사(이메일으로 인증번호 발송)
		@RequestMapping(value="/join/CheckRanEmail", method=RequestMethod.POST)
		@ResponseBody
		public String CheckRanEmail(@RequestBody String userRan, HttpSession session) {
			//사용자가 입력한 인증번호와 세션에 저장된 발송된 인증번호 비교
			System.out.println("사용자가 입력한 인증번호:"+userRan);
			System.out.println("세션저장:"+session.getAttribute("random"));
			if(userRan.equals(session.getAttribute("random"))) {
				return "0";
			}else {
				System.out.println("리턴1");
				return "1";
			}
			
		}
	
	//회원가입페이지에서 입력한 값 전달받음
	@RequestMapping(value="/join/step3", method=RequestMethod.POST)
	public String handleStep3(@ModelAttribute("user")Member member,Model model) {
		System.out.println(member.toString());		
		service.userInsert(member);
		
		model.addAttribute("myuserCode", member.getUsercode());
		return "join/step3";
	}
	
	//STEP3에서 로그인후 index로 이동
	@RequestMapping(value="/join/step3", method=RequestMethod.GET)
	public String handleStep3() {

		return "redirect:/index";
	}

}
