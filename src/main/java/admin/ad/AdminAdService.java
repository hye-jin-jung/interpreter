package admin.ad;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cscenter.vo.MemberVo;

public interface AdminAdService {
	
	List<AdminAdAppVO> adAppList();
	int adListCount();
	AdminAdAppVO selectAdApp(String pageNo);
	void deleteAdApp(String pageNo);
	
	
	List<AdminAdVO> selectAdContents();
	
	//광고글 닉네임 확인
	MemberVo adUserCodeCheck(String userCode);
	
	//광고글 작성할때 글번호와 카테고리 고정하는 메소드
	AdminAdAppVO checkAdAppNo(AdminAdAppVO vo);
	
	
	void insertAd(HashMap<String, String> map);
	void deleteAd(HashMap<String,ArrayList<String>> map);
}
