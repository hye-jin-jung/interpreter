package chatMatching.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chatMatching.spring.ChatService;
import chatMatching.spring.MatchingService;
import chatMatching.spring.MatchingServiceImpl;

import chatMatching.vo.MatchingVo;
import join.member.PageMaker;
import join.member.PageReady;

@Controller
public class Matching2Controller
{
    private MatchingService matchingService;
 
	public void setMatchingService(MatchingService matchingService){
		this.matchingService = matchingService;
	}
	
	 private ChatService chatService;
	 
		public void setChatService(ChatService chatService){
			this.chatService = chatService;
		}
	
	    
    //EchoHandler 의존주입
    
    @RequestMapping(value = {"/erMatchingManage/{page}"})
    public String erMatchingManage(Model model, HttpSession session, @PathVariable int page) {
    	
    	if(session.getAttribute("myuserCode") == null) {
     		 System.out.println("로그인회원아님"); return "login/login"; }
    	
    	model.addAttribute("page",page);	
        return "chatMatching/erMatchingManage";
    }
    
    @RequestMapping(value = {"/eeMatchingManage/{page}"})
    public String eeMatchingManage(Model model, HttpSession session, @PathVariable int page) {
    	if(session.getAttribute("myuserCode") == null) {
     		 System.out.println("로그인회원아님"); return "login/login"; }
    	
    	String myuserCode = (String)session.getAttribute("myuserCode");
    	
    	String smsCheck = chatService.selectSmsCheck(myuserCode);
    	model.addAttribute("page",page);
    	model.addAttribute("smsCheck",smsCheck);
        return "chatMatching/eeMatchingManage";
    }
    
    @ResponseBody
    @RequestMapping(value = "/newerList/{pageNum}", produces = "text/json; charset=utf-8")
    public String neweeList(HttpSession session, Model model, @PathVariable int pageNum, PageReady page) {

    	
    	String myuserCode = (String)session.getAttribute("myuserCode");
//		System.out.println("사장님 매칭가져오기 메서드myuserCode:" + myuserCode);
    	page.setPage(pageNum);   	    	
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setPagerd(page);
		pageMaker.setTotalCount(matchingService.getErMatchingCount(myuserCode));
		
//    
    	List<MatchingVo> erMatchingVoList = matchingService.getErMatching(myuserCode, page);
    	
		JSONObject resultjson = new JSONObject();   
		if(!erMatchingVoList.isEmpty()) {    	
			JSONArray jarray = new JSONArray();
			for(MatchingVo i : erMatchingVoList){
	            JSONObject json = new JSONObject(); 
	            json.put("matchingCode", i.getMatchingCode()); 
	            json.put("employerCode",i.getEmployerCode());
	            json.put("employeeCode",i.getEmployeeCode());
	            json.put("ebCode", i.getEbCode());
	            json.put("title", i.getTitle());
	            json.put("cfCheck", i.getCfCheck());
	            json.put("groupID", i.getGroupID());
	            json.put("reviewCode", i.getReviewCode());
	            
	            jarray.add(json);
			}   	
			resultjson.put("newerList", jarray);
			resultjson.put("startPage", pageMaker.getStartPage());
			resultjson.put("endPage", pageMaker.getEndPage());
			resultjson.put("prev", pageMaker.isPrev());
			resultjson.put("next", pageMaker.isNext());
//	         System.out.println("제이슨 newChatList만들기 성공");
	     }
		else if(erMatchingVoList.isEmpty()){
			resultjson.put("not", "매칭내역이 없습니다.");
//	         System.out.println("제이슨 매칭내역 없음");
		}
		System.out.println(resultjson.toJSONString());//임시//제이슨 보내기 
		return resultjson.toJSONString();
    }
    

    
   @ResponseBody
    @RequestMapping(value = "/neweeList/{pageNum}" ,produces = "text/json; charset=utf-8")
    public String newerList(HttpSession session, Model model, @PathVariable int pageNum, PageReady page) {

    	String myuserCode = (String)session.getAttribute("myuserCode");

    	page.setPage(pageNum);
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setPagerd(page);
		pageMaker.setTotalCount(matchingService.getEeMatchingCount(myuserCode));
    	List<MatchingVo> eeMatchingVoList = matchingService.getEeMatching(myuserCode, page);
	
    	JSONObject resultjson = new JSONObject();   
		if(!eeMatchingVoList.isEmpty()) {
    	
			JSONArray jarray = new JSONArray();
			for(MatchingVo i : eeMatchingVoList){
	            JSONObject json = new JSONObject(); 
	            json.put("matchingCode", i.getMatchingCode()); 
	            json.put("employerCode",i.getEmployerCode());
	            json.put("employeeCode",i.getEmployeeCode());
	            json.put("ebCode", i.getEbCode());
	            json.put("title", i.getTitle());
	            json.put("cfCheck", i.getCfCheck());
	            json.put("groupID", i.getGroupID());
	            json.put("reviewCode", i.getReviewCode());
	            
	            jarray.add(json);
			}
	      //제이슨 만들기 
			resultjson.put("neweeList", jarray);
			resultjson.put("startPage", pageMaker.getStartPage());
			resultjson.put("endPage", pageMaker.getEndPage());
			resultjson.put("prev", pageMaker.isPrev());
			resultjson.put("next", pageMaker.isNext());

	     }
		else if(eeMatchingVoList.isEmpty()){
			resultjson.put("not", "매칭내역이 없습니다.");

		}
		//제이슨 보내기 
		System.out.println(resultjson.toJSONString());//임시
		return resultjson.toJSONString();
    }
   
    @ResponseBody
    @RequestMapping(value = {"/cancelMatching"})
    public void cancelMatching(@RequestBody HashMap<String, Object> map) {
 
    	String matchingCode = (String)map.get("matchingCode");
    	System.out.println("매칭코드 삭제"+matchingCode);
    	matchingService.deleteMatching(matchingCode);

    }
    
    @RequestMapping(value = {"/review/{category}"})
    public String reivew(@PathVariable String category, 
    		@RequestParam(value="targetCode") String targetCode,
    		@RequestParam(value="matchingCode", required = false) String matchingCode,
    		HttpSession session, Model model) {
    	
    	if(session.getAttribute("myuserCode") == null) {
      		 System.out.println("로그인회원아님"); return "redirect:login/login"; }
       	
    	System.out.println("targetCode" + targetCode);
    	
    	if(matchingCode != null) {
    		model.addAttribute("matchingCode", matchingCode);
    	}
    	
    	model.addAttribute("category", category);//결과 model에 담음
    	model.addAttribute("targetCode", targetCode);//결과 model에 담음
    	
        return "chatMatching/review";
    }
    
    @ResponseBody
    @RequestMapping(value = {"/cf"})
    public void reivew(@RequestBody HashMap<String, Object> map) {
    	
    	System.out.println("인증완료");
    	String targetCode = (String)map.get("targetCode");
    	String matchingCode = (String)map.get("matchingCode");
    	
    	System.out.println(targetCode + "매칭코드 :" + matchingCode);
    	matchingService.makeCf(targetCode,matchingCode);
    }
    
    @RequestMapping(value = {"/reviewSuccess"})
    public String reviewSuccess(@RequestParam(value="category") String category,
    		@RequestParam(value="matchingCode") String matchingCode, 
    		@RequestParam(value="targetCode") String targetCode,
    		@RequestParam(value="star") double star,@RequestParam(value="content") String content,
    		HttpSession session) {

    	String myuserCode = (String)session.getAttribute("myuserCode");
    	
    	matchingService.makeReview(category,matchingCode,myuserCode,targetCode,star,content);
    	return "chatMatching/reviewSuccess";
    }
    
    @ResponseBody
    @RequestMapping(value = {"/updateSms"})
    public void updateSms(@RequestBody HashMap<String, Object> map, HttpSession session) {
   	
    	String myuserCode = (String)session.getAttribute("myuserCode");
    	String employeeCode = (String)session.getAttribute("employeeCode");
    	    	
    	String smsCheck = (String)map.get("smsCheck"); 
    	
       	if(smsCheck.equals("Y")) {    		
       		matchingService.onMatchangeSms(myuserCode);
       	}else if (smsCheck.equals("N")) {
       		matchingService.offMatchangeSms(myuserCode);
       	}
    	
    }
   
	
    
}