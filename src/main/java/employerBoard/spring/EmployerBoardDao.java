package employerBoard.spring;

import java.util.HashMap;
import java.util.List;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EbCriteria;
import employerBoard.vo.EbSearch;
import employerBoard.vo.EmployerBoardVO;

public interface EmployerBoardDao {
	
	public abstract List<EmployerBoardVO> ebList(); //사장 게시글 리스트

	public abstract int ebDelete(String ebCode); //사장 게시글 삭제
	
	public abstract int ebUpdate(EmployerBoardVO vo); //사장 게시글 수정
	
	public abstract void ebInsert(EmployerBoardVO vo); //사장 게시글 작성
	
	public abstract EmployerBoardVO ebSelect(String ebCode); //사장 게시글 코드로 뽑아서 가져오기
	
	public abstract int ebUpdateReadCount(String count); //사장 게시글 조회수 증가
	
	public abstract List<EmployerBoardVO> listPage(EbCriteria cri);	//사장 게시판 페이징
	
	public abstract int listCount();	//게시글 갯수
	
	public List<EmployerBoardVO> ebSearch(EbSearch ebs);	//목록 + 페이징 + 검색
	
	public int countEbSearch(EbSearch ebs);	//검색 결과 갯수
	
	public List<NoticeVo> getNotice();
	
	public int ebUpdateTimeover(String sysdate);	//공고기간만료 'Y' 업데이트
	
	public abstract List<EmployerBoardVO> detailSearch(HashMap<String,Object> detail); //상세검색

	public int countDetail(HashMap<String, Object> detail);	//상세검색 결과 갯수
	
	
}
