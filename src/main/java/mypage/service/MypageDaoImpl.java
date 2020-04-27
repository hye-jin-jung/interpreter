package mypage.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import cscenter.vo.QnaRequestVo;
import join.member.Member;

public class MypageDaoImpl implements MypageDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public MypageDaoImpl() {
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	@Override
	//회원정보 update
	public void updateInfo(Member member) {
		sqlSessionTemplate.update("updateInfo", member);
		
	}

	@Override
	//비밀번호 update
	public void updatePwd(HashMap<String,String> map) {
		sqlSessionTemplate.update("updatePwd",map);
		
	}

	@Override
	//회원 delete
	public void deleteAccout(String email) {
		System.out.println(email);
		sqlSessionTemplate.delete("JoinDao.deleteAccount", email);
		
	}

	@Override
	//1:1문의 리스트
	public List<QnaRequestVo> selectQnAList(HashMap<String,Object> map) {
		System.out.println("dao:"+map.get("userCode"));
		System.out.println("pageReady:"+map.get("pageReady").toString());
		return sqlSessionTemplate.selectList("mypageDao.selectQnAList", map);
	}

	@Override
	//1:1문의 리스트갯수
	public int countQnAList(String userCode) {
		return sqlSessionTemplate.selectOne("countQnAList", userCode);		
	}
	
	

}
