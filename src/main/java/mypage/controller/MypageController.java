package mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.qna.QnAService;
import admin.qna.QuestionDTO;
import advertisement.spring.AdverService;
import cscenter.vo.QnaRequestVo;
import join.member.Member;
import join.member.PageMaker;
import join.member.PageReady;
import join.service.JoinService;
import mypage.service.MypageService;

@Controller
public class MypageController {
	JoinService joinService;
	MypageService mypageService;
	QnAService qnaService;
	AdverService adverService;

	public void setAdverService(AdverService adverService) {
		this.adverService = adverService;
	}

	public MypageController() {
	}
	
	public void setMypageService(MypageService mypageService) {
		this.mypageService = mypageService;
	}
	public void setJoinService(JoinService joinService) {
		this.joinService = joinService;
	}
	
	
	public void setQnaService(QnAService qnaService) {
		this.qnaService = qnaService;
	}
	
	

	//개인정보수정 비밀번호 일치 확인
	@RequestMapping(value="/mypage/checkPwd" , method=RequestMethod.GET)
	public String checkPwd() {
		return "mypage/checkPwd";
	}
	
	@RequestMapping(value="/mypage/checkPwd" , method=RequestMethod.POST)
	@ResponseBody
	public String checkPwd(@RequestBody String password, HttpSession session) {
		String email = (String)session.getAttribute("myEmail");
		String check = joinService.userCheck(email, password);
		return check;
	}
	
	//회원정보 수정 페이지
	@RequestMapping(value="/mypage/updateInfo" , method=RequestMethod.GET)
	public String updateInfo(HttpSession session,Model model) {
		
		if(session.getAttribute("myuserCode") != null) {
			String email = (String)session.getAttribute("myEmail");
			System.out.println(email);
			Member member = joinService.selectUser("이메일",email);
			
			model.addAttribute("member",member);
			model.addAttribute("year", (member.getBirthdate()).substring(0, 4));
			model.addAttribute("month", (member.getBirthdate()).substring(5, 7));
			model.addAttribute("day", (member.getBirthdate()).substring(8, 10));
			return "mypage/updateInfo";
		}else {
			return "login/login";
		}
		
	}
	
	//회원정보 수정
	@RequestMapping(value="/mypage/updateInfo" , method=RequestMethod.POST)
	public String updateInfo(Member member,HttpSession session) {
		member.setEmail((String)session.getAttribute("myEmail"));
		System.out.println("수정할 생일"+member.getBirthdate());
		mypageService.updateInfo(member);
		return "mypage/updateInfoComplite";
	}
	
	//비밀번호 변경 페이지
	@RequestMapping(value="/mypage/updatePwd" , method=RequestMethod.GET)
	public String updatePwd(HttpSession session) {
		if(session.getAttribute("myuserCode") != null) {
			return "mypage/updatePwd";
		}else {
			return "login/login";
		}
		
	}
	
	@RequestMapping(value="/mypage/updatePwd" , method=RequestMethod.POST)
	@ResponseBody
	public String updatePwd(@RequestBody HashMap<String,String> map, HttpSession session) {
		System.out.println("인누옴");
		String userEmail = (String)session.getAttribute("myEmail");		
		//map에 email 추가
		map.put("email", userEmail);
		String check ="";
		
		//현재비밀번호가 없이 비밀번호 변경할때
		if(map.get("oldPassword") == null) {
			//비밀번호를 업데이트하는 구문
			mypageService.updatePwd(map);
			//업데이트 성공
			check ="0";
			return check;
		//현재비밀번호가 있는 비밀번호 변경할때
		}else {
			check = joinService.userCheck(userEmail, (String)map.get("oldPassword"));
			//현재 비밀번호가 일치하는지 확인 
			if(check.equals("0")) {
				//비밀번호 업데이트
				mypageService.updatePwd(map);
				check = "0";
				return check;
			//현재 비밀번호가 일치하지 않는경우
			}else {
				check = "1";
				return check;
			}
		}
	}
	
	@RequestMapping(value="/mypage/updatePwdComplite" , method=RequestMethod.GET)
	public String updatePwdComplite(HttpSession session) {
		
		if(session.getAttribute("myuserCode") != null) {
			return "mypage/updatePwdComplite"; 
		}else {
			return "mypage/updatePwdComplite";
		}
		
	}
	
	//회원 탈퇴
	@RequestMapping(value="/mypage/deleteAccount" , method=RequestMethod.GET)
	public String deleteAccount(HttpSession session) {
		if(session.getAttribute("myuserCode") != null) {
			return "mypage/deleteAccount"; 
		}else {
			return "login/login";
		}	
		
	}
	
	@RequestMapping(value="/mypage/deleteAccount" , method=RequestMethod.POST)
	@ResponseBody
	public String deleteAccount(@RequestBody String password,HttpSession session) {
		String email = (String)session.getAttribute("myEmail");
		System.out.println("email:"+email+"/비번:"+password);
		String check = joinService.userCheck(email, password);
		System.out.println("check:"+check);
		//비밀번호가 일치할경우
		if(check.equals("0")) {
			System.out.println("일치");
			//회원탈퇴
			mypageService.deleteAccout(email);
			session.invalidate();
			System.out.println("리턴전");
			return check;
		}else {
			System.out.println("불일치");
			return check;
		}
	}
	
	@RequestMapping(value="/mypage/deleteAccountComplite" , method=RequestMethod.GET)
	public String deleteAccountComplite() {
		
		return "mypage/deleteAccountComplite"; 
	}
	
	//마이페이지 main
	@RequestMapping(value="/mypage/mypageMain" , method=RequestMethod.GET)
	public String mypageMain(HttpSession session) {
		
		if(session.getAttribute("myuserCode") == null) {
			return "login/login";
		}
		return "mypage/myQnaList"; 
	}
	
	//나의 1:1문의 게시판
	@RequestMapping(value="/mypage/myQnaList" , method=RequestMethod.GET)
	public String myQnaList(Model model,HttpSession session, PageReady pageReady) {
		
		if(session.getAttribute("myuserCode") == null) {
			return "login/login";
		}
		
		String userCode = (String)session.getAttribute("myuserCode");
		System.out.println("userCode:"+userCode);
		
		//마이바티스에 paramter 두개 주기 위해 map에 담기
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userCode", userCode);
		map.put("pageReady", pageReady);
		
		List<QnaRequestVo> QnaList = mypageService.selectQnAList(map);
		for(QnaRequestVo e : QnaList) {
			System.out.println("작성일:"+e.getRegdate());
		}
				
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagerd(pageReady);
		int totCnt = mypageService.countQnAList(userCode);
		System.out.println("토탈 카운트:"+totCnt);
		pageMaker.setTotalCount(totCnt);
		System.out.println(pageMaker);
		System.out.println("page:"+pageMaker.getPagerd());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("QnAList", QnaList);
		
		//포인트 
		int point = adverService.getPoint(userCode);
		model.addAttribute("point", point);
		return "mypage/myQnaList"; 
	}
	
	//나의 1:1문의 게시판 내용표시
		@RequestMapping(value="/mypage/myQnaContent" , method=RequestMethod.GET)
		public String myQnaList(HttpServletRequest request,Model model,HttpSession session, PageReady pageReady) {
			
			if(session.getAttribute("myuserCode") == null) {
				return "login/login";
			}
			
		/*
		 * String userCode = (String)session.getAttribute("myuserCode");
		 * System.out.println("userCode:"+userCode);
		 * 
		 * //마이바티스에 paramter 두개 주기 위해 map에 담기 HashMap<String,Object> map = new
		 * HashMap<String,Object>(); map.put("userCode", userCode); map.put("pageReady",
		 * pageReady);
		 * 
		 * List<QnaRequestVo> QnaList = mypageService.selectQnAList(map);
		 * for(QnaRequestVo e : QnaList) { System.out.println("1:1리스트:"+e.getTitle()); }
		 * 
		 * PageMaker pageMaker = new PageMaker(); pageMaker.setPagerd(pageReady); int
		 * totCnt = mypageService.countQnAList(userCode);
		 * System.out.println("토탈 카운트:"+totCnt); pageMaker.setTotalCount(totCnt);
		 * System.out.println(pageMaker);
		 * System.out.println("page:"+pageMaker.getPagerd());
		 * model.addAttribute("pageMaker", pageMaker); model.addAttribute("QnAList",
		 * QnaList);
		 * 
		 * //포인트 int point = adverService.getPoint(userCode);
		 * model.addAttribute("point", point);
		 */
			String questionNo = request.getParameter("questionNo");
			model.addAttribute("request", request);
			List<QuestionDTO> questionDTO = qnaService.selectQuestion(questionNo);
			model.addAttribute("post", questionDTO);
			System.out.println(questionDTO.toString());

			return "mypage/myQnaContent";
		}
	
		/*강사님 수정 코드*/
//	@RequestMapping(value="/admin/user",method=RequestMethod.GET)
//	public String user() {
//		return "admin/user";
//	}
//
//	
//	private void makeUserList(HashMap<String,String> map, Model model, PageReady page) {
//		System.out.println(map);
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setPagerd(page);
//		
//		if(map != null) {
//			model.addAttribute("user", joinService.selectFromTitle(map));
//			pageMaker.setTotalCount(joinService.selectFromTitle(map).size());
//		}else {
//			model.addAttribute("user", joinService.selectAllUser(page));
//			pageMaker.setTotalCount(joinService.countAllUser());
//		}		
//			model.addAttribute("pageMaker", pageMaker);
//	}
//	
//	//임시 관리자페이지 회원관리
//	@RequestMapping(value="/admin/userList",method=RequestMethod.GET)
//	public String user(Model model, PageReady page) {
//		makeUserList(null, model, page);
//		return "admin/userList";
//	}
//	
//	@RequestMapping(value="/admin/userList",method=RequestMethod.POST)
//	public String user(@RequestBody HashMap<String,String> map, Model model, PageReady page) {
//		makeUserList(map, model, page);
//		return "admin/userList";
//	}
	


}
