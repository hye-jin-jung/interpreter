package bookMark.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import bookMark.vo.BookMarkVO;
import bookMark.spring.BookMarkService;

@Controller
@SessionAttributes("bookMarkVO")
public class BookMarkController {

	private BookMarkService bookMarkService;

	public void setBookMarkService(BookMarkService bookMarkService) {
		this.bookMarkService = bookMarkService;
	}

	
	// 북마크 DB비교 및 추가 제거
	@RequestMapping(value = "/bookMark/bookMark", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bmkCheck(@RequestBody HashMap<String,Object> map, HttpSession session) {
		
		System.out.println("data가져옴");
		String userCode = (String)map.get("userCode");
		String bmkCode = (String)map.get("bmkCode");
		System.out.println(userCode);
		System.out.println(bmkCode);
		
		//서비스로 map값 보냄	
		BookMarkVO bookMarkVO = bookMarkService.bmkCheck(map);
		
		//비교값 데이터 제이슨으로 보내주기 위한 텍스트
		String check = "";
		
		//로그인 안했을 경우
		if(session.getAttribute("myuserCode") == null) {
			System.out.println("로그인 안함");
			check = "notSession";
		
		//로그인 했을 경우	
		}else if(session.getAttribute("myuserCode") != null) {
			//북마크 VO null이 아니고 DB에 값이 있을 경우 삭제
			if(bookMarkVO != null) {	//문자열 비교라서 == 아닌 equals
				if(map.get("userCode").equals(bookMarkVO.getUserCode())) {
					if(map.get("bmkCode").equals(bookMarkVO.getBmkCode())) {
						//delete 서비스로 보냄
						bookMarkService.bmkDelete(bookMarkVO);
						check = "있어요";
					}
				}
			}else if(bookMarkVO == null){
				//map값이 담겨있는 VO객체 생성
				bookMarkVO = new BookMarkVO();
				//VO에 map값 담아주고
				bookMarkVO.setUserCode(userCode);
				bookMarkVO.setBmkCode(bmkCode);
				//insert 서비스로 보냄
				bookMarkService.bmkInsert(bookMarkVO);
				check = "없어요";
			}
		}
		return check;
	}
	

	//유저코드로 북마크 리스트 불러오기
	@RequestMapping(value="/bookMark/bmkList/{blogMaster}")
	public String bmkList(@PathVariable String blogMaster, HttpServletRequest request,Model model) {

//		HttpSession session = request.getSession();
		List<BookMarkVO> ebBmkList = new ArrayList<BookMarkVO>();
		List<BookMarkVO> wbBmkList = new ArrayList<BookMarkVO>();
		
//		String userCode = (String) session.getAttribute("myuserCode");//session에 저장된 userCode
		
		ebBmkList = bookMarkService.ebBmkList(blogMaster);
		wbBmkList = bookMarkService.wbBmkList(blogMaster);
		
		model.addAttribute("myuserCode", blogMaster);
		model.addAttribute("ebBmkList", ebBmkList);
		model.addAttribute("wbBmkList", wbBmkList);
		return "/bookMark/bmkList";
	}
		

}
