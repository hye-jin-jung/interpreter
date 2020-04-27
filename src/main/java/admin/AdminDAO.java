package admin;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	private AdminVO adminVO;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setAdminVO(AdminVO adminVO) {
		this.adminVO = adminVO;
	}
	
	public AdminDAO() {
		
	}
	
	public AdminDAO(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public AdminDAO(SqlSessionTemplate sqlSessionTemplate, AdminVO adminVO) {
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.adminVO = adminVO;
	}
	
	
	
	
	public AdminVO adminLogIn(AdminVO vo) {
		return sqlSessionTemplate.selectOne("adminLogIn", vo);
	}
	
	
	
	
	
	
	
}
