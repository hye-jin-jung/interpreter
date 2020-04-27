package workerBoard.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import employerBoard.vo.EbSearch;
import employerBoard.vo.EmployerBoardVO;
import employerBoard.vo.PageMaker;
import workerBoard.vo.WbCriteria;
import workerBoard.vo.WbPageMaker;
import workerBoard.vo.WbSearch;
import workerBoard.vo.WorkerBoardVO;
import workerBoard.spring.WorkerBoardService;

@Controller
@SessionAttributes("workerBoardVO")
public class WorkerBoardController {
	
	private WorkerBoardService workerBoardService;

	public void setWorkerBoardService(WorkerBoardService workerBoardService) {
		this.workerBoardService = workerBoardService;
	}
	
	//세션에서 아이디 얻어오기
	public String getUserCode(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String myuserCode = (String)session.getAttribute("myuserCode");
		model.addAttribute("myuserCode", myuserCode);
		return myuserCode;
	}
	
	//알바 게시판 목록 + 페이징 + 검색
	@RequestMapping(value="/workerBoard/list")
	public String wbList(HttpServletRequest request, WbSearch wbs, Model model) {
		
//		String myuserCode = getUserCode(request, model);
//		if(myuserCode == null) {
//			System.out.println("로그인 회원 아님");
//			return "login/login";
//		}
		model.addAttribute("workerBoardList", workerBoardService.wbSearch(wbs));
		
		WbPageMaker wbPageMaker = new WbPageMaker();
		wbPageMaker.setCri(wbs);
		wbPageMaker.setTotalCount(workerBoardService.countWbSearch(wbs));
		model.addAttribute("wbPageMaker", wbPageMaker);
		
		model.addAttribute("getNotice", workerBoardService.getNotice());	//최신 공지글 출력
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");	//공고기간만료 'Y' 업데이트
		Date time = new Date();
		String sysdate = format.format(time);
		workerBoardService.wbUpdateTimeover(sysdate);
		
		return "/workerBoard/list";
	}
	
	//알바 게시글 읽기
	@RequestMapping(value="workerBoard/read/{wbCode}")
	public String wbRead(Model model, @PathVariable String wbCode) {
		
		WorkerBoardVO workerBoardVO = workerBoardService.wbRead(wbCode);
		System.out.println("wbCode : " + workerBoardVO);
		
		if(workerBoardVO == null) {	//게시글 없을 경우
			model.addAttribute("notRead", "이미 삭제된 게시글입니다.");
			return "/workerBoard/notRead";
		}else if(workerBoardVO != null) {	//게시글 있을 경우
			model.addAttribute("workerBoardVO", workerBoardService.wbRead(wbCode));
		}
		return "/workerBoard/read";
	}
	
	//알바 새 글 작성
	@RequestMapping(value="workerBoard/write", method=RequestMethod.GET)
	public String wbWrite(HttpServletRequest request, Model model) {
		
//		HttpSession session = request.getSession();
//		session.setAttribute("myuserCode", "김코딩");
//		
//		model.addAttribute("myuserCode", "김코딩");
		
		model.addAttribute("workerBoardVO", new WorkerBoardVO());
		return "/workerBoard/write";
	}
	
	//알바 새 글 등록 
	@RequestMapping(value="/workerBoard/write", method=RequestMethod.POST)
	public String wbWrite(@Valid WorkerBoardVO workerBoardVO, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "/workerBoard/write";
		}
		workerBoardService.wbWrite(workerBoardVO);
		return "redirect:/workerBoard/list";
	}
	
	//알바 게시글 수정
	@RequestMapping(value="/workerBoard/edit/{wbCode}", method=RequestMethod.GET)
	public String wbEdit(@PathVariable String wbCode, Model model) {
		WorkerBoardVO workerBoardVO = workerBoardService.wbRead(wbCode);
		model.addAttribute("workerBoardVO", workerBoardVO);
		return "/workerBoard/edit";	
	}
	
	//알바 글 수정 등록
	@RequestMapping(value="workerBoard/edit/{wbCode}", method=RequestMethod.POST)
	public String wbEdit(
			@Valid @ModelAttribute WorkerBoardVO workerBoardVO,
			BindingResult result,
			String wbCode,
			SessionStatus sessionStatus,
			Model model) {
			if(result.hasErrors()) {
				return "/workerBoard/edit";
			}
			else {
				if(workerBoardVO.getWbCode() == wbCode) {
					workerBoardService.wbEdit(workerBoardVO);
					sessionStatus.setComplete();
					return "redirect:/workerBoard/list";
				}
			}
			model.addAttribute("msg", "작성자가 일치하지 않습니다.");
			return "/workerBoard/edit";
	}
	
	
	//알바 글 삭체 요청 처리
	@RequestMapping(value="/workerBoard/delete/{wbCode}", method=RequestMethod.GET)
	public String wbDelete(@PathVariable String wbCode, Model model) {
		model.addAttribute("wbCode", wbCode);
		return "/workerBoard/delete";
	}
	//알바 글 삭제
	@RequestMapping(value="/workerBoard/delete", method=RequestMethod.POST)
	public String wbDelete2(String wbCode, Model model) {
		workerBoardService.wbDelete(wbCode);
		return "redirect:/workerBoard/list";
	}
	
	
		//상세검색 받기 + 페이징
	    @RequestMapping(value="/workerBoard/detail")
	    public String detailSch(
	          String sido, 
	          String[] gugun,
	          String workStartDate,
	          String workEndDate,
	          String[] worktime,
	          String[] job,
	          String[] age,
	          WbSearch wbs, Model model) throws ParseException {
	       
	    System.out.println("상세검색제이슨 맵으로 도착");
	    
	    //날짜형식 변환
	    
	    String newStartDate = changeDate(workStartDate);
	    String newEndDate = changeDate(workEndDate);
	    
	    ArrayList<String> addr = changeCity(sido, gugun);
	    ArrayList<String> worktimeArr = changeMtd(worktime);
	    ArrayList<String> jobArr = changeMtd(job);
	    ArrayList<String> ageArr = changeMtd(age);
	    
	    System.out.println("비운거" + addr.size());
	    
	    //인자로 보낼 맵 만들기
	    int rowStart = wbs.getRowStart();
	    int rowEnd = wbs.getRowEnd();
	     HashMap<String,Object> detail = new HashMap<String,Object>();
	     
	    detail.put("addr", addr);
	    detail.put("workStartDate", newStartDate); 
	    detail.put("workEndDate", newEndDate);
	    detail.put("worktime", worktimeArr); 
	    detail.put("job", jobArr); 
	    detail.put("age", ageArr);
	    detail.put("rowStart", rowStart);
	    detail.put("rowEnd", rowEnd);
	    
	    detail.forEach((key, value)   
	            -> System.out.println("key: " + key + ", value: " + value));
	    
	    List<WorkerBoardVO> data = workerBoardService.wbDetailSearch(detail);
	    System.out.println("리턴값 길이"+ data.size());
	    
	    WbPageMaker wbPageMaker = new WbPageMaker();
	    wbPageMaker.setCri(wbs);
	    wbPageMaker.setTotalCount(workerBoardService.wbCountDetail(detail));
	    
	    model.addAttribute("wbPageMaker", wbPageMaker);
	    model.addAttribute("workerBoardList", data);
	    model.addAttribute("getNotice", workerBoardService.getNotice()); // 최신 공지글 출력
	
	    return "/workerBoard/list";
	
	    }

	  //String배열을 Array로 변환하는 메서드 
	  public ArrayList<String> changeMtd(String[] arr){
		  ArrayList<String> afterArr = new ArrayList<String>();
		  if(arr != null ) {
			  for(int i = 0; i < arr.length ; i++) {
				  afterArr.add(arr[i]);
			  }
			  return afterArr;
		  } else {
			  return afterArr;
		  }
	    }
	  
	  
	  //시+군구를  변환하는 메서드 
	  public ArrayList<String> changeCity(String sido, String[] gugun){
		  
		  ArrayList<String> afterCity = new ArrayList<String>();
		  
		  if(gugun != null) {
			  for(int i = 0; i < gugun.length ; i++) {
				  afterCity.add(sido + " " + gugun[i]);
			  }
			  return afterCity;
		  } else if(sido != null) {
			  afterCity.add(sido);
			  return afterCity;
		  } else {
			  return afterCity;
		  }
	    }
	  

	  //날짜형식 만들기
	  public String changeDate(String before) throws ParseException{
		  
		  SimpleDateFormat oldDt = new SimpleDateFormat("yyyy-mm-dd");
	      Date date = oldDt.parse(before);
	      SimpleDateFormat newDt = new SimpleDateFormat("yy/mm/dd");
	      String newDate = newDt.format(date);
	      System.out.println("바뀐날짜" + newDate);
	      return newDate;
	      
	  }
	


}
