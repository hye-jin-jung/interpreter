package love.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

import love.vo.LoveVO;
import love.spring.LoveService;

@Controller
@SessionAttributes("loveVO")
public class LoveController {
	
	private LoveService loveService;

	public void setLoveService(LoveService loveService) {
		this.loveService = loveService;
	}
	
	//찜하기 DB비교 및 추가 제거
	@RequestMapping(value="/lover/lover", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loverCheck(@RequestBody HashMap<String,Object> map, HttpSession session) {
		System.out.println("data가져옴");
		String userCode = (String)map.get("userCode");
		String loverCode = (String)map.get("loverCode");
		System.out.println(userCode);
		System.out.println(loverCode);
		
		//서비스로 map값 보냄
		LoveVO loveVO = loveService.loverCheck(map);
		
		//비교값 데이터 제이슨으로 보내주기 위한 텍스트
		String check = "";
		
		
		//로그인 안했을 경우
		if(session.getAttribute("myuserCode") == null) {
			System.out.println("로그인 안함");
			check = "notSession";
		
		//로그인 했을 경우	
		}else if(session.getAttribute("myuserCode") != null) {	
			//찜하기VO가 null이 아니고 DB에 값이 있을 경우 삭제
			if(loveVO != null) {
				if(map.get("userCode").equals(loveVO.getUserCode())) {
					if(map.get("loverCode").equals(loveVO.getLoverCode())) {
						loveService.loverDelete(loveVO);
						check = "있어요";
					}
				}
			//찜하기VO null일 경우 추가(본인 일 경우 안됨)
			}else if(loveVO == null){
				//map값이 담겨있는 VO객체 생성
				loveVO = new LoveVO();
				//VO에 map값 담기
				loveVO.setUserCode(userCode);
				loveVO.setLoverCode(loverCode);
				
				if(map.get("userCode").equals(loveVO.getLoverCode())) {
					check = "전데요";
				}else {
					//insert 서비스로 보냄
					loveService.loverInsert(loveVO);
					check = "없어요";
				}
			}
		}
		return check;
	}
	
	
	//유저코드로 내가 찜한 사용자 리스트 불러오기
	@RequestMapping(value="/lover/loverList/{blogMaster}")
	public String loverList(@PathVariable String blogMaster, HttpServletRequest request, Model model) {
		
//		HttpSession session = request.getSession();
		List<LoveVO> loverList = new ArrayList<LoveVO>();
//		String userCode = (String) session.getAttribute("myuserCode");//session에 저장된 userCode
		loverList = loveService.loverList(blogMaster);
		model.addAttribute("blogMaster", blogMaster);
		model.addAttribute("loverList", loverList);
		return "/lover/loverList";
		
	}
	 

}
