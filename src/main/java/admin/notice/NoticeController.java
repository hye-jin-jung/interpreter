package admin.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NoticeController {
	
	NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	//공지사항 관리 페이지, 게시글 리스트 나옴
	@RequestMapping("/admin/notice")
	public String adminNotice(HttpSession session, Model model) {
		Object loginCheck = session.getAttribute("admin");

		if(loginCheck == null) {
			model.addAttribute("message", false);
		}
		
		List<NoticeDTO> list = noticeService.selectAllContents();
		model.addAttribute("dto", list);

		return "admin/notice/notice";
	}
	
	//글제목을 클릭하면 글번호를 가지고 DB에서 가져와서 글을 볼 수 있는 페이지
	@RequestMapping("/admin/notice/viewContent")
	public String noticeViewContent(HttpServletRequest request, Model model) {
		String no = request.getParameter("no");
		model.addAttribute("request", request);
		NoticeDTO noticeDTO = noticeService.selectContent(no);
		model.addAttribute("post", noticeDTO);
		 
		return "admin/notice/content";
	}
	
	//글쓰는 페이지
	@RequestMapping("/admin/notice/writeContent")
	public String noticeWriteContent() {

		return "admin/notice/write";
	}
	
	//글 작성하고 등록 버튼을 눌렀을 때 실행되는 메소드
	@RequestMapping("/admin/notice/insertContent")
	public String noticeInsertContent(HttpServletRequest request, Model model) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		noticeService.insertContent(title, content);
		model.addAttribute("request", request);
		
		return "redirect:/admin/notice";
	}
	
	//수정 버튼을 누르면  글 데이터를 가져와 editform에서 보여줌
	@RequestMapping(value="/admin/notice/updateContent", method=RequestMethod.GET)
	public String noticeUpdateContent(HttpServletRequest request, Model model) {
		String no = request.getParameter("no");
		model.addAttribute("request", request);
		NoticeDTO noticeDTO = noticeService.selectContentEdit(no);
		model.addAttribute("post", noticeDTO);
		
		return "admin/notice/updateContent";
	}
	
	//updateContent.jsp에서 등록 버튼을 누르면 실행되는 메소드
	@RequestMapping(value="/admin/notice/updateContent", method=RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model) {
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		model.addAttribute("request", request);
		
		NoticeDTO post = noticeService.updateContent(no, title, content);
		model.addAttribute("post", post);
		
		return "admin/notice/content";
	}
	
	@RequestMapping("/admin/notice/deleteContent")
	public String delete(HttpServletRequest request, @RequestBody String noticeNo, Model model) {
		String no = request.getParameter("no");
		model.addAttribute("request", request);
		
		if(no != null) {
			noticeService.deleteContent(no);
		} else {
			noticeService.deleteContent(noticeNo);
			System.out.println("컨트롤러: " + noticeNo);
		}
		
		return "redirect:/admin/notice";
	}
	
}
