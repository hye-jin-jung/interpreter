package myBlog.myBlog;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BbomGeDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	private BbomGeVO bbomGeVO;
	private JustVO justVO;
	
	
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public BbomGeVO getBbomGeVO() {
		return bbomGeVO;
	}

	public void setBbomGeVO(BbomGeVO bbomGeVO) {
		this.bbomGeVO = bbomGeVO;
	}

	public JustVO getJustVO() {
		return justVO;
	}

	public void setJustVO(JustVO justVO) {
		this.justVO = justVO;
	}

	public BbomGeDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BbomGeDAO(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//메서드 부분
	//게시판 내용 삽입하기
	public void insertBbomGe(String writerCode, String title, String contents) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("writerCode", writerCode);
		map.put("title", title);
		map.put("contents", contents);
		
		sqlSessionTemplate.insert("myBlogDAO.insertBbomGe", map);
	}
	
	//게시판 목록 불러오기
	public List<BbomGeVO> selectBbomGe(String writerCode, SearchCriteria scri) {
		
		String searchType = scri.getSearchType();
		String keyword = scri.getKeyword();
		int rowStart = scri.getRowStart();
		int rowEnd = scri.getRowEnd();
		
		
		justVO.setWriterCode(writerCode);
		justVO.setKeyword(keyword);
		justVO.setRowStart(rowStart);
		justVO.setRowEnd(rowEnd);
		justVO.setSearchType(searchType);
		
		System.out.println(keyword + rowStart + rowEnd+searchType);
		
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("writerCode", writerCode);
//		map.put("keyword", keyword);
//		map.put("rowStart", rowStart);
//		map.put("rowEnd", rowEnd);
		
		
		
		return sqlSessionTemplate.selectList("myBlogDAO.listSearchB", justVO);
	}
	
	public List<BbomGeVO> selectBbomGe2(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("myBlogDAO.list", map);
	}
	
	//게시물 총 갯수
	public int listCountB(String writerCode) throws Exception {
		return sqlSessionTemplate.selectOne("myBlogDAO.listCountB", writerCode);
	}
	
	//검색 결과 총 갯수
	public int countSearch(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectOne("myBlogDAO.countSearchB", scri);
	}
	

	public List<BbomGeVO> listSearchB(HashMap<String, Object> map){ 
		return sqlSessionTemplate.selectList("myBlogDAO.listSearchB", map);
	}
	
	public int countSearchB(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne("myBlogDAO.countSearchB", map);
	}
	
	//선택한 글 불러오기
	public BbomGeVO selectContent(String showCode) {
		return sqlSessionTemplate.selectOne("myBlogDAO.selectContent", showCode);
	}
	
	//글 수정
	public BbomGeVO updateContent(String showCode, String title, String contents) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("showCode", showCode);
		map.put("title", title);
		map.put("contents", contents);
		
		sqlSessionTemplate.insert("myBlogDAO.updateContent", map);
		return sqlSessionTemplate.selectOne("myBlogDAO.selectContent", showCode);
	}
	
	//글 삭제
	public void deleteContent(String showCode) {
		sqlSessionTemplate.delete("myBlogDAO.deleteContent", showCode);
	}
	
	
	//댓글 삽입
	public void insertBbomGeCmt(BbomGeCmtVO bbomGeCmtVO) {
		sqlSessionTemplate.insert("myBlogDAO.insertBbomGeCmt", bbomGeCmtVO);
	}
	
	//댓글 리스트 가져오기
	public List<BbomGeCmtVO> selectComment(String articleCode) {
		return sqlSessionTemplate.selectList("myBlogDAO.selectCmtList", articleCode);
	}
	
	
	//댓글 수정하기
	public void updateBbomGeCmt(BbomGeCmtVO bbomGeCmtVO) {
		sqlSessionTemplate.update("myBlogDAO.updateBbomGeCmt", bbomGeCmtVO);
	}
	
	//댓글 삭제하기
	public void deleteBbomGeCmt(BbomGeCmtVO vo) {
		sqlSessionTemplate.delete("myBlogDAO.deleteBbomGeCmt", vo);
		
	}




}
