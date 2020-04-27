package employerBoard.spring;

import java.util.HashMap;
import java.util.List;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EbCriteria;
import employerBoard.vo.EbSearch;
import employerBoard.vo.EmployerBoardVO;

public interface EmployerBoardService {
	
	public abstract List<EmployerBoardVO> ebList();	//사장 게시판 목록
	
	public abstract void ebDelete(String ebCode);	//사장 게시글 삭제
	
	public abstract int ebEdit(EmployerBoardVO vo);		//사장 게시글 수정
	
	public abstract void ebWrite(EmployerBoardVO vo);	//사장 게시글 작성
	
	public abstract EmployerBoardVO ebRead(String ebCode);	//사장 게시글 읽기
	
	public abstract List<EmployerBoardVO> listPage(EbCriteria cri);	//사장 게시판 페이징
	
	public abstract int listCount();	//게시글 갯수
	
	public abstract List<EmployerBoardVO> ebSearch(EbSearch ebs);	//목록 + 페이징 + 검색
	
	public int countEbSearch(EbSearch ebs); //검색 결과 갯수
	
	public List<NoticeVo> getNotice();
	
	public int ebUpdateTimeover(String sysdate); //공고기간만료 'Y' 업데이트
	
	public abstract List<EmployerBoardVO> detailSearch(HashMap<String, Object> detail); //상세검색
	
	public int countDetail(HashMap<String, Object> detail);	//상세검색 결과 갯수
		

	

}
