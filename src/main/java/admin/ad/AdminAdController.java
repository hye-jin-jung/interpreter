package admin.ad;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.qna.AnswerDTO;
import cscenter.vo.MemberVo;

@Controller
public class AdminAdController {
	
	AdminAdService adminAdService;

	public void setAdminAdService(AdminAdService adminAdService) {
		this.adminAdService = adminAdService;
	}

	//광고 문의글 리스트
	@RequestMapping("/admin/adApp")
	public String adAppList(HttpSession session, Model model) {
		
		Object loginCheck = session.getAttribute("admin");

		if(loginCheck == null) {
			model.addAttribute("message", false);
		}
		
		List<AdminAdAppVO> list = adminAdService.adAppList();
		model.addAttribute("vo", list);
		
		return "admin/ad/adApp";
	}
	
	//글제목을 클릭하면 글번호를 가지고 DB에서 가져와서 글을 볼 수 있는 페이지
	@RequestMapping("/admin/adApp/viewContent")
	public String contentView(HttpServletRequest request, Model model) {
		String pageNo = request.getParameter("pageNo");
		model.addAttribute("request", request);
		AdminAdAppVO adverAppVO = adminAdService.selectAdApp(pageNo);
		model.addAttribute("content", adverAppVO);
		
		return "admin/ad/content";
	}
	
	@RequestMapping("/admin/adApp/deleteContent")
	public String deleteAdApp(HttpServletRequest request, @RequestBody String no, Model model) {
		String pageNo = request.getParameter("pageNo");
		model.addAttribute("request", request);
		
		if(pageNo != null) {
			adminAdService.deleteAdApp(pageNo);
		} else {
			adminAdService.deleteAdApp(no);
			System.out.println("컨트롤러: " + no);
		}
		
		return "redirect:/admin/adApp";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/admin/ad")
	public String adminAd(HttpSession session, Model model) {
		
		Object loginCheck = session.getAttribute("admin");

		if(loginCheck == null) {
			model.addAttribute("message", false);
		}
		
		List<AdminAdVO> list = adminAdService.selectAdContents();
		model.addAttribute("vo", list);

		return "admin/ad/ad";
	}
	

	
	
	
	@RequestMapping(value="/admin/ad/writeContent", method=RequestMethod.POST)
	public String adminAdWriteContent(AdminAdAppVO vo, Model model) {
		AdminAdAppVO adAppVO = adminAdService.checkAdAppNo(vo);
	
		System.out.println(adAppVO.pageNo);
		System.out.println(adAppVO.adCategory);
		
		model.addAttribute("adAppVO", vo);
		
		return "admin/ad/write";
	}
	
	@RequestMapping(value="/admin/ad/insertContent", method=RequestMethod.POST)
	public String adminAdInsertContent(HttpServletRequest request, Model model) {
			String adCategory = request.getParameter("adCategory");
			String adAppNo = request.getParameter("adAppNo");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			System.out.println(adAppNo);
			System.out.println(adCategory);
			System.out.println(start);
			System.out.println(end);
			
			HashMap<String, String> map = new HashMap<String, String>();
				map.put("adAppNo", adAppNo);
				map.put("adCategory", adCategory);
				map.put("start", start);
				map.put("end", end);
				
				adminAdService.insertAd(map);
				
				
		return "redirect:/admin/ad";
	}
	
	@RequestMapping(value="/admin/ad/deleteContent", method=RequestMethod.POST, produces="text/json; charset=UTF-8")
	@ResponseBody
	public String adminAdDeleteContent(@RequestBody HashMap<String,ArrayList<String>> map) {
		adminAdService.deleteAd(map);
		
		return "삭제가 완료되었습니다.";
	}
	
	/*
	 * //존재하는 회원인지 확인
	 * 
	 * @RequestMapping(value="/admin/ad/userCodeCheck", method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String adminAdUserCodeCheck(@RequestBody String
	 * userCode) { MemberVo result = adminAdService.adUserCodeCheck(userCode);
	 * 
	 * String a = ""; boolean chk = (result == null); if (chk) { a = "0"; } else { a
	 * = "1"; }
	 * 
	 * return a; }
	 */
	
}
