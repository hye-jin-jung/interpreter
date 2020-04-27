package admin.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QnAController {
	
	QnAService qnaService;

	public void setQnaService(QnAService qnaService) {
		this.qnaService = qnaService;
	}
	
	@RequestMapping("/admin/qna")
	public String qna(HttpSession session, Model model, @ModelAttribute("qc") QuestionCriteria qc) {
		System.out.println(session.getAttribute("myuserCode"));
		if(!session.getAttribute("myuserCode").equals("admin")) {
			return "redirect:/mypage/myQnaList";
		}else {
			
			Object loginCheck = session.getAttribute("admin");

			if(loginCheck == null) {
				model.addAttribute("message", false);
			}
			
			List<QuestionDTO> list = qnaService.qnaPaging(qc);
			model.addAttribute("dto", list);
			
			QuestionPageMaker pageMaker = new QuestionPageMaker();
			pageMaker.setQc(qc);
			pageMaker.setTotalCount(qnaService.qnaListCount());
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/qna/qna";
			
		}

	}
	
	@RequestMapping("/admin/qna/viewContent")
	public String qnaViewContent(HttpServletRequest request, Model model,HttpSession session) {
	
			String questionNo = request.getParameter("questionNo");
			model.addAttribute("request", request);
			List<QuestionDTO> questionDTO = qnaService.selectQuestion(questionNo);
			model.addAttribute("post", questionDTO);
			System.out.println(questionDTO.toString());
			return "admin/qna/content";
		
	}
	
	@RequestMapping("/admin/qna/deleteContent")
	public String qnaDeleteContent(HttpServletRequest request, @RequestBody String no, Model model, HttpSession session) {
		//일반 사용자의 1:1문의 접근이라면
		String questionNo = request.getParameter("questionNo");
		model.addAttribute("request", request);
		
		if(questionNo != null) {
			qnaService.deleteQuestion(questionNo);
		} else {
			qnaService.deleteQuestion(no);
			System.out.println("컨트롤러: " + no);
		}
		
		if(!session.getAttribute("myuserCode").equals("admin")) {
			return "redirect:/mypage/myQnaList";
		//관리자로 접근후 게시글 삭제
		}else {			
			return "redirect:/admin/qna";
		}

	}

			
			
			
	
			
			
	
	
	//댓글 등록
	@RequestMapping("/admin/qna/insertComment")
    @ResponseBody
    public String addComment(HttpServletRequest request) throws Exception {

		String questionNo = request.getParameter("questionNo");
		String comment = request.getParameter("comment");
		System.out.println("컨트롤러 " + questionNo);
		System.out.println("컨트롤러 " + comment);
		qnaService.insertComment(questionNo, comment);

        return "success";
    }
	
	//댓글 리스트
	@RequestMapping(value="/admin/qna/commentList", produces="text/json; charset=UTF-8", method=RequestMethod.POST)
    @ResponseBody
    public ResponseEntity commentList(@RequestBody String questionNo, HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		List<AnswerDTO> answerDTO = qnaService.selectAllComments(questionNo);
		
		// 해당 게시물 댓글
		if(answerDTO.size() > 0) {
			for(int i = 0; i < answerDTO.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("answerNo", answerDTO.get(i).getAnswerNo());
				hm.put("writer", answerDTO.get(i).getWriter());
				hm.put("comment", answerDTO.get(i).getComment());
				hm.put("regDate", answerDTO.get(i).getRegDate());

				hmlist.add(hm);
				
			}

		}

		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);

	}
	
	@RequestMapping("/admin/qna/updateComment") 
	@ResponseBody
	public String updateComment(HttpServletRequest request, @RequestBody AnswerDTO dto) throws Exception {
		qnaService.updateComment(dto);
		
		return "success";
	}
	
	@RequestMapping("/admin/qna/deleteComment") 
	@ResponseBody //success 문자열을 반환, 없으면 success.jsp 반환
	public String deleteComment(@RequestBody AnswerDTO dto) {
		qnaService.deleteComment(dto);
		
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
}
