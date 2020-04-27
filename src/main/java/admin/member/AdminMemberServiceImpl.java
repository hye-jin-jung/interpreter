package admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import join.member.MemberAdminVo;
import join.member.PageReady;

public class AdminMemberServiceImpl implements AdminMemberService {
	
	AdminMemberDao adminMemberDao;
	
	
	public AdminMemberServiceImpl() {
		
	}

	public void setAdminMemberDao(AdminMemberDao adminMemberDao) {
		this.adminMemberDao = adminMemberDao;
	}



	//모든 회원정보 검색
	@Override
	public List<MemberAdminVo> selectAllUser(PageReady page) {
		List<MemberAdminVo> member = adminMemberDao.selectUser(page);
		return member;
	}
	
	//모든 회원정보 카운트
	@Override
	public int countAllUser() {
		return adminMemberDao.countAllUser();
	}
	
	//회원정보  select
	@Override
	public List<MemberAdminVo> selectFromTitle(HashMap<String,String> map) {
		
		List<MemberAdminVo> member =null;
		//이메일로 검색할 경우
		if (map.get("title").equals("email")) {
			member= adminMemberDao.selectFromEmail(map);
		//닉네임을 검색할 경우
		} else if (map.get("title").equals("userCode")) {
			member= adminMemberDao.selectFromUsercode(map);
			for(MemberAdminVo e : member) {
				System.out.println("닉네임 검색"+e.getUsercode());
			}
		}
		
		return member;
			//가입일로 검색할 경우(추가예정:LIST로 반환)

	}
	//경고주기
	@Override
	public void updateWarning(HashMap<String,ArrayList<String>> map) {
		adminMemberDao.updateWarning(map);
	}

	//관리자 회원삭제
	@Override
	public void adminDeleteAccount(HashMap<String, ArrayList<String>> map) {
		adminMemberDao.adminDeleteAccount(map);		
	}

}
