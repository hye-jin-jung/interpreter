package myBlog.service;

import java.util.HashMap;
import java.util.List;

import employerBoard.vo.EmployerBoardVO;
import freeboard.vo.FreeBoardVo;
import join.member.MemberAdminVo;
import love.vo.LoveVO;
import myBlog.myBlog.BbomGeCmtVO;
import myBlog.myBlog.BbomGeVO;
import myBlog.myBlog.Criteria;
import myBlog.myBlog.SearchCriteria;
import workerBoard.vo.WorkerBoardVO;

public interface MyBlogService {
	
	void bbomGeInsert(String writerCode, String title, String contents);
	List<BbomGeVO> bbomGeSelect(String writerCode, SearchCriteria scri);
	BbomGeVO bbomGeContent(String showCode);
	BbomGeVO bbomGeUpdate(String showCode, String title, String contents);
	void bbomGeDelete(String showCode);
	
	void bbomGeCmtInsert(BbomGeCmtVO bbomGeCmtVO);
	List<BbomGeCmtVO> bbomGeSelectCmt(String articleCode);
	int listCountB(String writerCode) throws Exception;
	void bbomGeCmtUpdate(BbomGeCmtVO bbomGeCmtVO);
	void bbomGeCmtDelete(BbomGeCmtVO vo);
	
	List<EmployerBoardVO> selectMyErContent(HashMap<String, Object> map);
	int listCountEr(HashMap<String, Object> map);
	List<WorkerBoardVO> selectMyEeContent(HashMap<String, Object> map);
	int listCountEe(HashMap<String, Object> map);
	List<FreeBoardVo> selectMyFreeContent(HashMap<String, Object> map);
	int listCountF(HashMap<String, Object> map) throws Exception;
	List<String> selectHtml(String myuserCode);
	
	MemberAdminVo selectUserInfo(String myuserCode);
	int selectLoveCount(String blogMaster);
	int selectMarkCount(String blogMaster);
	int selectGesiCount(String blogMaster);
	List<BbomGeVO> bbomGeSelect2(HashMap<String, Object> map);
	List<BbomGeVO> listSearchB(HashMap<String, Object> map);
	int countSearchB(HashMap<String, Object> map);
	int selectUserLoveInfo(String blogMaster);
	
}
