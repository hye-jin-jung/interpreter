package myBlog.myBlog;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import employerBoard.vo.EmployerBoardVO;
import freeboard.vo.FreeBoardVo;
import join.member.MemberAdminVo;
import love.vo.LoveVO;
import workerBoard.vo.WorkerBoardVO;

public class MainDAO {
	
	
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}



	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}



	public MainDAO() {
		super();
	}



	public MainDAO(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}



	public List<String> selectHtml(String myuserCode) {
		return sqlSessionTemplate.selectList("selectHtml",myuserCode);
	}



	public List<FreeBoardVo> selectMyFreeContent(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("selectMyFreeContent", map);
	}
	
	
	public int listCountF(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne("myBlogDAO.listCountF", map);
	}



	public List<EmployerBoardVO> selectMyErContent(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("selectMyErContent", map);
	}
	
	public int listCountEr(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne("myBlogDAO.listCountEr", map);
	}



	public List<WorkerBoardVO> selectMyEeContent(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("selectMyEeContent", map);
	}
	
	public int listCountEe(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne("myBlogDAO.listCountEe", map);
	}



	public MemberAdminVo selectUserInfo(String myuserCode) {
		return sqlSessionTemplate.selectOne("selectUserInfo",myuserCode);
	}

	

	public int selectLoveCount(String blogMaster) {
		return sqlSessionTemplate.selectOne("selectLoveCount", blogMaster);
	}



	public int selectMarkCount(String blogMaster) {
		return sqlSessionTemplate.selectOne("selectMarkCount", blogMaster);
	}



	public int selectGesiCount(String blogMaster) {
		return sqlSessionTemplate.selectOne("selectGesiCount", blogMaster);
	}



	public int selectUserLoveInfo(String blogMaster) {
		return sqlSessionTemplate.selectOne("selectUserLoveInfo", blogMaster);
	}


}
