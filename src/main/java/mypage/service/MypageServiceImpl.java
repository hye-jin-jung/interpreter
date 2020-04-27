package mypage.service;

import java.util.HashMap;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import cscenter.vo.QnaRequestVo;
import join.member.Member;

public class MypageServiceImpl implements MypageService {
	
	MypageDaoImpl mypageDao;

	public MypageServiceImpl() {
	}
	
	
	public void setMypageDao(MypageDaoImpl mypageDao) {
		this.mypageDao = mypageDao;
	}


	//회원정보 변경
	@Override
	public void updateInfo(Member member) {
		mypageDao.updateInfo(member);
	}

	//비밀번호 변경
	@Override
	public void updatePwd(HashMap<String,String> map) {
		String hashPwd = BCrypt.hashpw((String)map.get("newPassword"), BCrypt.gensalt());
		System.out.println(hashPwd);
		//해싱된 비밀번호로 map변경
		map.put("newPassword", hashPwd);
		
		mypageDao.updatePwd(map);
		
	}
	
	//회원 탈퇴
	@Override
	public void deleteAccout(String email) {
		mypageDao.deleteAccout(email);		
	}

	//1:1문의 리스트
	@Override
	public List<QnaRequestVo> selectQnAList(HashMap<String,Object> map) {
		return mypageDao.selectQnAList(map);
	}


	@Override
	public int countQnAList(String userCode) {
		return mypageDao.countQnAList(userCode);
	}


	
}
