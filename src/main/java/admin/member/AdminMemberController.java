package admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chatMatching.spring.ChatService;
import join.member.MemberAdminVo;
import join.member.PageMaker;
import join.member.PageReady;

@Controller
public class AdminMemberController {
	
	AdminMemberServiceImpl adminMemberService;
	
	
	public AdminMemberController() {
		
	}
	public void setAdminMemberService(AdminMemberServiceImpl adminMemberService) {
		this.adminMemberService = adminMemberService;
	}

	private ChatService chatService;
	    
	public void setChatService(ChatService chatService){
			this.chatService = chatService;
	}

	// 임시 관리자페이지 회원관리
	@RequestMapping(value = "/admin/user/{page}" ,method=RequestMethod.GET)
	public String makeUserList(Model model, @PathVariable int page) {
		System.out.println("도착");
		model.addAttribute("page",page);
		return "admin/member/user";
	}
	
	@RequestMapping(value = "/admin/userList/{pagee}" ,method=RequestMethod.GET)
	public String user(Model model, @PathVariable int pagee, PageReady page) {
		page.setPage(pagee);
		model.addAttribute("user", adminMemberService.selectAllUser(page));
		List<MemberAdminVo> member = adminMemberService.selectAllUser(page);
		for(MemberAdminVo e : member) {
			System.out.println("경고횟수:"+e.getWarningCount());
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagerd(page);
		pageMaker.setTotalCount(adminMemberService.countAllUser());
		model.addAttribute("pageMaker", pageMaker);

		return "admin/member/userList";
	}

	@RequestMapping(value = "/admin/userList" ,method=RequestMethod.POST)
	public String user(@RequestBody HashMap<String, String> map, Model model, PageReady page) {

		if (map.get("title") != null) {
			System.out.println("map있음");
			model.addAttribute("user", adminMemberService.selectFromTitle(map));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setPagerd(page);
			pageMaker.setTotalCount(adminMemberService.selectFromTitle(map).size());
			model.addAttribute("pageMaker", pageMaker);
		}
		return "admin/member/userList";
	}
	
	//경고주기
	@RequestMapping(value = "/admin/warning", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String warning(@RequestBody HashMap<String,ArrayList<String>> map) {
		System.out.println("map:"+map.get("array"));
		ArrayList<String> list = map.get("array");
		for(String e : list) {
			System.out.println("list data: "+e);
			chatService.sendChat("admin", e, "관리자로 부터 경고를 받았습니다.<br/> ※경고 3회시 자동 탈퇴 처리 됩니다.", "1");
		};
		
		adminMemberService.updateWarning(map);
		
		return "경고 처리가 완료 되었습니다.";
	}
	
	//관리자권한 회원탈퇴
	@RequestMapping(value = "/admin/deleteUser", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteUser(@RequestBody HashMap<String,ArrayList<String>> map) {
		ArrayList<String> list = map.get("array");
		for(String e : list) {
			System.out.println("list data: "+e);
		}
		
		adminMemberService.adminDeleteAccount(map);
		
		return "탈퇴가 완료되었습니다.";
	}
}
