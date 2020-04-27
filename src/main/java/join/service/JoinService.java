package join.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import join.member.Member;
import join.member.MemberAdminVo;
import join.member.PageReady;

public interface JoinService {
	String Check(String title,String data);
	void userInsert(Member member);
	String userCheck(String email, String pwd);
	Member selectUser(String title, String data);

}
