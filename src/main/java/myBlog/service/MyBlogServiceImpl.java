package myBlog.service;

import java.util.HashMap;
import java.util.List;

import employerBoard.vo.EmployerBoardVO;
import freeboard.vo.FreeBoardVo;
import join.member.MemberAdminVo;
import love.vo.LoveVO;
import myBlog.myBlog.BbomGeCmtVO;
import myBlog.myBlog.BbomGeDAO;
import myBlog.myBlog.BbomGeVO;
import myBlog.myBlog.MainDAO;
import myBlog.myBlog.SearchCriteria;
import workerBoard.vo.WorkerBoardVO;

public class MyBlogServiceImpl implements MyBlogService{
	
	private MyBlogService myBlogService;
	private BbomGeDAO bbomGeDAO;
	private MainDAO mainDAO;

	public MainDAO getMainDAO() {
		return mainDAO;
	}

	public void setMainDAO(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}

	public MyBlogServiceImpl(MyBlogService myBlogService, BbomGeDAO bbomGeDAO) {
		super();
		this.myBlogService = myBlogService;
		this.bbomGeDAO = bbomGeDAO;
	}

	public MyBlogServiceImpl() {
		super();
	}

	public void setMyBlogService(MyBlogService myBlogService) {
		this.myBlogService = myBlogService;
	}

	public void setBbomGeDAO(BbomGeDAO bbomGeDAO) {
		this.bbomGeDAO = bbomGeDAO;
	}

	@Override
	public void bbomGeInsert(String writerCode, String title, String contents) {
		bbomGeDAO.insertBbomGe(writerCode, title, contents);
	}

	@Override
	public List<BbomGeVO> bbomGeSelect(String writerCode, SearchCriteria scri) {
		return bbomGeDAO.selectBbomGe(writerCode, scri);
	}
	
	@Override
	public int listCountB(String writerCode) throws Exception {
		return bbomGeDAO.listCountB(writerCode);
	}
	
	
	@Override
	public List<BbomGeVO> bbomGeSelect2(HashMap<String, Object> map) {
		return bbomGeDAO.selectBbomGe2(map);
	}
	
	
	
	
	@Override
	public List<BbomGeVO> listSearchB(HashMap<String, Object> map) {
		return bbomGeDAO.listSearchB(map);
	}



	@Override
	public int countSearchB(HashMap<String, Object> map) {
		return bbomGeDAO.countSearchB(map);
	}
	
	

	@Override
	public BbomGeVO bbomGeContent(String showCode) {
		return bbomGeDAO.selectContent(showCode);
	}

	@Override
	public void bbomGeDelete(String showCode) {
		bbomGeDAO.deleteContent(showCode);
	}

	@Override
	public BbomGeVO bbomGeUpdate(String showCode, String title, String contents) {
		return bbomGeDAO.updateContent(showCode, title, contents);
	}

	@Override
	public void bbomGeCmtInsert(BbomGeCmtVO bbomGeCmtVO) {
		bbomGeDAO.insertBbomGeCmt(bbomGeCmtVO);
		
	}

	@Override
	public List<BbomGeCmtVO> bbomGeSelectCmt(String articleCode) {
		return bbomGeDAO.selectComment(articleCode);
	}

	@Override
	public void bbomGeCmtUpdate(BbomGeCmtVO bbomGeCmtVO) {
		bbomGeDAO.updateBbomGeCmt(bbomGeCmtVO);
	}

	@Override
	public void bbomGeCmtDelete(BbomGeCmtVO vo) {
		bbomGeDAO.deleteBbomGeCmt(vo);
	}

	@Override
	public List<FreeBoardVo> selectMyFreeContent(HashMap<String, Object> map) {
		return mainDAO.selectMyFreeContent(map);
	}
	
	@Override
	public int listCountF(HashMap<String, Object> map) throws Exception {
		return mainDAO.listCountF(map);
	}

	@Override
	public List<String> selectHtml(String myuserCode) {
		return mainDAO.selectHtml(myuserCode);
	}

	@Override
	public List<EmployerBoardVO> selectMyErContent(HashMap<String, Object> map) {
		return mainDAO.selectMyErContent(map);
	}

	@Override
	public List<WorkerBoardVO> selectMyEeContent(HashMap<String, Object> map) {
		return mainDAO.selectMyEeContent(map);
	}

	@Override
	public int listCountEr(HashMap<String, Object> map) {
		return mainDAO.listCountEr(map);
	}

	@Override
	public int listCountEe(HashMap<String, Object> map) {
		return mainDAO.listCountEe(map);
	}

	@Override
	public MemberAdminVo selectUserInfo(String myuserCode) {
		return mainDAO.selectUserInfo(myuserCode);
	}
	
	@Override
	public int selectUserLoveInfo(String blogMaster) {
		return mainDAO.selectUserLoveInfo(blogMaster);
	}

	@Override
	public int selectLoveCount(String blogMaster) {
		return mainDAO.selectLoveCount(blogMaster);
	}

	@Override
	public int selectMarkCount(String blogMaster) {
		return mainDAO.selectMarkCount(blogMaster);
	}

	@Override
	public int selectGesiCount(String blogMaster) {
		return mainDAO.selectGesiCount(blogMaster);
	}



	

}
