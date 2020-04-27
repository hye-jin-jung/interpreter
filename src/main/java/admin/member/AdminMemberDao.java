package admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import join.member.MemberAdminVo;
import join.member.PageReady;

public class AdminMemberDao {
	
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminMemberDao() {
	
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	/*------------------------------관리자----------------------------------------*/
	//모든 회원정보 select
	public List<MemberAdminVo> selectUser(PageReady page) {
		return sqlSessionTemplate.selectList("JoinDao.selectAllUser",page);
	}
	
	//회원정보 email select
	public List<MemberAdminVo> selectFromEmail(HashMap map) {
		return sqlSessionTemplate.selectList("selectFromEmail",map);
	}
	
	//회원정보 usercode select
	public List<MemberAdminVo> selectFromUsercode(HashMap map) {
		return sqlSessionTemplate.selectList("selectFromUsercode",map);
	}
	
	//회원정보 regdate select
	public List<MemberAdminVo> selectFromRegdate(HashMap map) {
		return sqlSessionTemplate.selectList("selectFromRegiDate",map);
	}
		
	//모든 회원 count
	public int countAllUser() {
		return sqlSessionTemplate.selectOne("countAllUser");
	}
	
	//경고주기
	public void updateWarning(HashMap<String,ArrayList<String>> map) {
		sqlSessionTemplate.update("updateWarning", map);
	}
	
	//회원삭제
	public void adminDeleteAccount(HashMap<String,ArrayList<String>> map) {
		sqlSessionTemplate.delete("adminDeleteAccount", map);
	}

	
	/*------------------------------관리자----------------------------------------*/

}
