package admin.ad;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import cscenter.vo.MemberVo;

public class AdminAdDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	private AdminAdAppVO adminAdAppVO;
	private AdminAdVO adminAdVO;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setAdminAdAppVO(AdminAdAppVO adminAdAppVO) {
		this.adminAdAppVO = adminAdAppVO;
	}
	
	public void setAdminAdVO(AdminAdVO adminAdVO) {
		this.adminAdVO = adminAdVO;
	}

	public AdminAdDAO() {
		
	}

	public AdminAdDAO(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public AdminAdDAO(SqlSessionTemplate sqlSessionTemplate, AdminAdAppVO adminAdAppVO) {
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.adminAdAppVO = adminAdAppVO;
	}
	
	public AdminAdDAO(SqlSessionTemplate sqlSessionTemplate, AdminAdVO adminAdVO) {
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.adminAdVO = adminAdVO;
	}
	
	
	
	
	public List<AdminAdAppVO> adAppList() {
		return sqlSessionTemplate.selectList("admin.adAppList");
	}
	
	public int adListCount() {
		return sqlSessionTemplate.selectOne("admin.adListCount");
	}
	
	public AdminAdAppVO selectAdApp(String pageNo) {
		return sqlSessionTemplate.selectOne("admin.selectAdApp", pageNo);
	}
	
	public void deleteAdApp(String pageNo) {
		sqlSessionTemplate.delete("admin.deleteAdApp", pageNo);
	}
	
	public MemberVo adUserCodeCheck(String userCode) {
		return sqlSessionTemplate.selectOne("adUserCodeCheck", userCode);
	}
	
	
	
	public List<AdminAdVO> selectAdContents() {
		return sqlSessionTemplate.selectList("selectAdContents");
	}
	
	public AdminAdAppVO checkAdAppNo(AdminAdAppVO vo) {
		return sqlSessionTemplate.selectOne("checkAdAppNo", vo);
	}
	
	public void insertAd(HashMap map) {
		sqlSessionTemplate.insert("insertAd", map);
	}
	
	public void deleteAd(HashMap<String,ArrayList<String>> map) {
		sqlSessionTemplate.delete("deleteAd", map);
	}
	
	
	
	
}
