package employerBoard.spring;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import cscenter.vo.NoticeVo;
import employerBoard.spring.EmployerBoardDao;
import employerBoard.vo.EbCriteria;
import employerBoard.vo.EbSearch;
import employerBoard.vo.EmployerBoardVO;

@Service
public class EmployerBoardServiceImpl implements EmployerBoardService{
	
	private EmployerBoardDao employerBoardDao;
	
	public EmployerBoardDao getEmployerBoardDao() {
		return employerBoardDao;
	}
	
	public void setEmployerBoardDao(EmployerBoardDao EmployerBoardDao) {
		this.employerBoardDao = EmployerBoardDao;
	}

	
	@Override
	public List<EmployerBoardVO> ebList() {	//사장 게시글 리스트
		return employerBoardDao.ebList();
	}
	
	@Override
	public void ebDelete(String ebCode) {	//사장 게시글 삭제
		employerBoardDao.ebDelete(ebCode);
	}

	@Override
	public int ebEdit(EmployerBoardVO vo) {		//사장 게시글 수정
		return employerBoardDao.ebUpdate(vo);
	}

	@Override
	public void ebWrite(EmployerBoardVO vo) {	//사장 게시글 쓰기
		employerBoardDao.ebInsert(vo);		
	}
	
	@Override
	public EmployerBoardVO ebRead(String count) {	//사장 게시글 읽기 및 조회수 증가
		employerBoardDao.ebUpdateReadCount(count);
		return employerBoardDao.ebSelect(count);
	}
	
	@Override
	public List<EmployerBoardVO> listPage(EbCriteria cri){	//페이징
		return employerBoardDao.listPage(cri);
	}
	
	@Override
	public int listCount() {	//게시물 갯수
		return employerBoardDao.listCount();
	}
	
	@Override
	public List<EmployerBoardVO> ebSearch(EbSearch ebs){
		return employerBoardDao.ebSearch(ebs);	//목록 + 페이징 + 검색
	}	
	
	@Override
	public int countEbSearch(EbSearch ebs) {
		return employerBoardDao.countEbSearch(ebs);  //검색 결과 갯수
	}
	
	
	@Override
	public List<NoticeVo> getNotice(){	//최신 공지글 하나 가져오기
		return employerBoardDao.getNotice();
	}
	
	@Override
	public int ebUpdateTimeover(String sysdate) {		 //공고기간만료 'Y' 업데이트
		return employerBoardDao.ebUpdateTimeover(sysdate);
	}
	
	@Override
	public List<EmployerBoardVO> detailSearch(HashMap<String, Object> detail) {
		return employerBoardDao.detailSearch(detail);
	}
	
	@Override
	public int countDetail(HashMap<String, Object> detail) {
		return employerBoardDao.countDetail(detail);
	}
	
	
	
	

	
}
