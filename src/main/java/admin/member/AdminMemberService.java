package admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import join.member.MemberAdminVo;
import join.member.PageReady;

public interface AdminMemberService {
	int countAllUser();
	List<MemberAdminVo> selectAllUser(PageReady page);
	List<MemberAdminVo> selectFromTitle(HashMap<String,String> map);
	void updateWarning(HashMap<String,ArrayList<String>> map);
	void adminDeleteAccount(HashMap<String,ArrayList<String>> map);

}
