package join.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import join.member.Member;
import join.service.JoinService;
import join.service.JoinServiceImpl;

@Controller
public class LoginController {
	private JoinServiceImpl service;

	public void setService(JoinServiceImpl service) {
		this.service = service;
	}

	// 로그인
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login() {

		return "login/login";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession session) {
		String referer = request.getHeader("Referer");
		System.out.println("referer"+referer);
		session.invalidate();
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestBody HashMap<String, String> map, HttpServletRequest req, Model model) {
		String check = service.userCheck(map.get("email"), map.get("password"));
		System.out.println(map.get("email"));
		if (check.equals("0")) {
			HttpSession session = req.getSession();
			Member member = service.selectUser("이메일", map.get("email"));
			session.setAttribute("myuserCode", member.getUsercode());
			session.setAttribute("myEmail", member.getEmail());
			model.addAttribute("myuserCode", member.getUsercode());
		}
		return check;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/login/searchPwd", method = RequestMethod.GET)
	public String searchPwd() {
		return "login/searchPwd";
	}

	@RequestMapping(value = "/login/searchPwdComplite", method = RequestMethod.GET)
	public String searchPwdComplite() {
		return "login/searchPwdComplite";
	}

	// 아이디 & 비밀번호 찾기
	@RequestMapping(value = "/login/searchEmailPwd", method = RequestMethod.GET)
	public String searchEmailPwd() {
		return "login/searchEmailPwd";
	}

	@RequestMapping(value = "/login/searchEmailPwd", method = RequestMethod.POST)
	@ResponseBody
	public String searchEmailPwd(@RequestBody String phoneSc, Model model, HttpSession ss) {
		System.out.println(phoneSc);
		ss.setAttribute("aaa", "dsaf");
		// Member member = service.selectUser("휴대폰번호", phone);
		return "{\"myEmail\":\"" + phoneSc + "\"}";
	}

	// 발송된 인증번호 검사(휴대폰으로 인증번호 발송)
	@RequestMapping(value = "/login/CheckRanPhone", method = RequestMethod.POST)
	@ResponseBody
	public String CheckRanPhone(@RequestBody String userRan, HttpSession session) {
		// 사용자가 입력한 인증번호와 세션에 저장된 발송된 인증번호 비교
		System.out.println("사용자가 입력한 인증번호:" + userRan);
		System.out.println("세션저정" + session.getAttribute("random"));

		if (userRan.equals(session.getAttribute("random"))) {
			System.out.println("인증번호 일치");
			 System.out.println("0리턴"); 
			 String phone =(String)session.getAttribute("phone");
			 System.out.println(); 
			 Member member = service.selectUser("휴대폰번호", (String)session.getAttribute("phone"));
			 session.setAttribute("myEmail", member.getEmail());
			 
			 return "0";
			}else {
				return "1";
			}

		
	}

	// 아이디 찾기완료.
	@RequestMapping(value = "/login/searchEmailComplite", method = RequestMethod.GET)
	public String searchEmailComplite() {
		return "login/searchEmailComplite";
	}

	// 홈으로
	@RequestMapping("/home")
	public String home() {
		return "home";
	}

}
