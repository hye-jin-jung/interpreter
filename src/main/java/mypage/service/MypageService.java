package mypage.service;

import java.util.HashMap;
import java.util.List;

import cscenter.vo.QnaRequestVo;
import join.member.Member;

public interface MypageService {
	
	List<QnaRequestVo> selectQnAList (HashMap<String,Object> map);
	void updateInfo(Member member);
	void updatePwd(HashMap<String,String> map);
	void deleteAccout(String email);
	int countQnAList(String userCode);
}
