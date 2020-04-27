package employerBoard.controller;

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

import employerBoard.vo.EbCriteria;
import employerBoard.vo.EbSearch;
import employerBoard.vo.EmployerBoardVO;
import employerBoard.vo.PageMaker;
import employerBoard.spring.EmployerBoardService;

@Controller
@SessionAttributes("employerBoardVO")
public class EmployerBoardController {
	
	private EmployerBoardService employerBoardService;
	
	public void setEmployerBoardService(EmployerBoardService EmployerBoardService) {
		this.employerBoardService = EmployerBoardService;
	}
	
	//세션에서 아이디 얻어오기
	public String getUserCode(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String myuserCode = (String)session.getAttribute("myuserCode");
		model.addAttribute("myuserCode", myuserCode);
		return myuserCode;
	}
	
	
	//사장 게시판 목록 + 페이징 + 검색
	@RequestMapping(value="/employerBoard/list")
	public String ebList(HttpServletRequest request, EbSearch ebs, Model model) {
		
//		String myuserCode = getUserCode(request, model);
//		if(myuserCode == null) {
//			System.out.println("로그인 회원 아님");
//			return "login/login";
//		}
		 
		model.addAttribute("employerBoardList", employerBoardService.ebSearch(ebs));
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(ebs);
		pageMaker.setTotalCount(employerBoardService.countEbSearch(ebs));
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("getNotice", employerBoardService.getNotice());	//최신 공지글 출력
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");	//공고기간만료 'Y' 업데이트
		Date time = new Date();
		String sysdate = format.format(time);
		employerBoardService.ebUpdateTimeover(sysdate);
		
		return "/employerBoard/list";
	}
	
	
	//사장 게시글 읽기	@PathVariable URL경로에 변수 넣는 어노테이션
	@RequestMapping(value="/employerBoard/read/{ebCode}")
	public String ebRead(Model model, @PathVariable String ebCode) {
		
		EmployerBoardVO employerBoardVO = employerBoardService.ebRead(ebCode);
		System.out.println("ebCode : " + employerBoardVO);
		
		if(employerBoardVO == null) {	//게시물이 없을 경우
			model.addAttribute("notRead", "이미 삭제된 게시글입니다.");
			return "/employerBoard/notRead";
			
		}else if(employerBoardVO != null){ //게시물이 있을 경우
			model.addAttribute("employerBoardVO", employerBoardService.ebRead(ebCode));	
		}	
		return "/employerBoard/read";
	}
	

	
	//사장 새 글 작성
	@RequestMapping(value="/employerBoard/write", method=RequestMethod.GET)
	public String ebWrite(HttpServletRequest request, Model model) {
		
		model.addAttribute("employerBoardVO", new EmployerBoardVO());
		return "/employerBoard/write";
	}
		
	
	//사장 새 글 등록	@Valid 객체에 들어가는 값을 검증해주는 어노테이션
	@RequestMapping(value="/employerBoard/write", method=RequestMethod.POST)
	public String ebWrite(@Valid EmployerBoardVO employerBoardVO, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "/employerBoard/write";
		}
		
		employerBoardService.ebWrite(employerBoardVO);
		return "redirect:/employerBoard/list";
	}
	
	
	//사장 게시글 수정 
	@RequestMapping(value="/employerBoard/edit/{ebCode}", method=RequestMethod.GET)
	public String ebEdit(@PathVariable String ebCode, Model model) {
		EmployerBoardVO employerBoardVO = employerBoardService.ebRead(ebCode);
		model.addAttribute("employerBoardVO", employerBoardVO);
		return "/employerBoard/edit";
	}
	
	//사장 글 수정 등록
	@RequestMapping(value="/employerBoard/edit/{ebCode}", method=RequestMethod.POST)
	public String ebEdit(
			@Valid @ModelAttribute EmployerBoardVO employerBoardVO,
			BindingResult result,
			String ebCode,
			SessionStatus sessionStatus, 
			Model model) {
			if(result.hasErrors()) {
				return "/employerBoard/edit";
			}
			else {
				if(employerBoardVO.getEbCode() == ebCode) {
					employerBoardService.ebEdit(employerBoardVO);
					sessionStatus.setComplete();
					return "redirect:/employerBoard/list";
				}
			}
			model.addAttribute("msg", "작성자가 일치하지 않습니다.");
			return "/employerBoard/edit";
	}
	
	//사장 글 삭제 요청 처리 
	@RequestMapping(value="/employerBoard/delete/{ebCode}", method=RequestMethod.GET)
	public String ebDelete(@PathVariable String ebCode, Model model) {
		model.addAttribute("ebCode", ebCode);
		return "/employerBoard/delete";
	}

	//사장 글 삭제
	@RequestMapping(value="/employerBoard/delete", method=RequestMethod.POST)
	public String ebDelete2(String ebCode, Model model) {
		employerBoardService.ebDelete(ebCode);
		return "redirect:/employerBoard/list";

	}
	

	//좌표 api
	@RequestMapping(value="/jusoPopup")
	public String jusoPopup() {
		return "/jusoPopup";
	}
	
	
	//상세검색 받기 + 페이징
    @RequestMapping(value="/employerBoard/detail")
    public String detailSch(
          String sido, 
          String[] gugun,
          String workStartDate,
          String workEndDate,
          String[] worktime,
          String[] job,
          String[] age,
          EbSearch ebs, Model model) throws ParseException {
       
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
    int rowStart = ebs.getRowStart();
    int rowEnd = ebs.getRowEnd();
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
    
    List<EmployerBoardVO> data = employerBoardService.detailSearch(detail);
    System.out.println("리턴값 길이"+ data.size());
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(ebs);
    pageMaker.setTotalCount(employerBoardService.countDetail(detail));
    
    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("employerBoardList", data);
    model.addAttribute("getNotice", employerBoardService.getNotice()); // 최신 공지글 출력

    return "/employerBoard/list";

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