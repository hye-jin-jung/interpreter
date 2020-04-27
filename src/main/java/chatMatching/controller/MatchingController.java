package chatMatching.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import calendar.calendar.CalendarAddDto;
import calendar.service.CalendarService;
import chatMatching.spring.ChatService;
import chatMatching.spring.SmsService;
import employerBoard.vo.EmployerBoardVO;

@Controller
public class MatchingController
{
    private ChatService chatService;
 
	public void setChatService(ChatService chatService){
		this.chatService = chatService;
	}
	
	private SmsService smsService;
	 
	public void setSmsService(SmsService smsService){
		this.smsService = smsService;
	}
	
	CalendarService calendarService;
	
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
   
    @RequestMapping(value = {"/matching/{employeeCode}"})
    public String viewMatching(@PathVariable String employeeCode,
    		HttpSession session, final Model model) {
    	
    	if(session.getAttribute("myuserCode") == null) {
     		 System.out.println("로그인회원아님"); return "redirect:login/login"; }
    	
    	String myuserCode = (String)session.getAttribute("myuserCode");

		session.setAttribute("employeeCode", employeeCode);
		session.setAttribute("fromCode", employeeCode);
 	
    	List<EmployerBoardVO> employerBoardVoList = chatService.selectEb(myuserCode);//1:1채팅 목록을 가져오는 서비스(userCode)
    	
    	model.addAttribute("employerBoardVoList", employerBoardVoList);//결과 model에 담음

        return "chatMatching/matching";
    }
    
    @ResponseBody
    @RequestMapping(value = {"/makeMatching"})
    public void makeMatching(@RequestBody HashMap<String, Object> map, HttpSession session) {
    	String groupId = "null";

    	String myuserCode = (String)session.getAttribute("myuserCode");
    	String employeeCode = (String)session.getAttribute("employeeCode");
    	    	
    	String ebCode = (String)map.get("ebCode");
    	String workStart = (String)map.get("workStart");
    	String workEnd = (String)map.get("workEnd");
    	String title = (String)map.get("title");
    	
    	System.out.println(ebCode);
    	String smsCheck = chatService.selectSmsCheck(employeeCode);
    	System.out.println("smsCheck :" +smsCheck);
    	
       	if(smsCheck.equals("Y")) {    		
        	String date = Integer.parseInt(workStart.replaceAll("/",""))-1 + "120000";
       		String text = "사장님 " + myuserCode + "과 알바생 " + employeeCode +"의 약속이 다음날입니다. 게시글 코드 : " + ebCode + " 게시글 제목 : " + title;
       		System.out.println(text);
       		groupId = smsService.sendReservationSms(employeeCode, text, date);
    	}
       	else {
       		groupId = "null";
       	}
    	chatService.insertMatching(myuserCode,employeeCode,ebCode,groupId);//매칭테이블에 값넣는 서비스
    	
    	String calTitle = "사장님 " + myuserCode + "와(과)의 약속";
    	String calDescription	="게시글 코드 : " + ebCode + " 게시글 제목 : " + title;
		
		CalendarAddDto cal = new CalendarAddDto(null,calDescription,workStart.replaceAll("/","-"), workEnd.replaceAll("/","-"), "매칭",
												employeeCode, "#D25565", "#ffffff", "false", calTitle);
    	System.out.println(cal == null);
    	calendarService.addService(cal);
    }

    
}