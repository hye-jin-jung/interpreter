package workerBoard.spring;

import java.util.HashMap;
import java.util.List;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EmployerBoardVO;
import workerBoard.spring.WorkerBoardDao;
import workerBoard.vo.WbCriteria;
import workerBoard.vo.WbSearch;
import workerBoard.vo.WorkerBoardVO;


public class WorkerBoardServiceImpl implements WorkerBoardService{
	
	private WorkerBoardDao workerBoardDao;
	
	public WorkerBoardDao getEmployerBoardDao() {
		return workerBoardDao;
	}
	
	public void setWorkerBoardDao(WorkerBoardDao WorkerBoardDao) {
		this.workerBoardDao = WorkerBoardDao;
	}

	@Override
	public List<WorkerBoardVO> wbList() {	//�˹� �Խñ� ����Ʈ
		return workerBoardDao.wbList();
	}

	@Override
	public void wbDelete(String wbCode) {	//�˹� �Խñ� ����
		workerBoardDao.wbDelete(wbCode);
	}

	@Override
	public int wbEdit(WorkerBoardVO vo) {		//�˹� �Խñ� ����
		return workerBoardDao.wbUpdate(vo);
	}

	@Override
	public void wbWrite(WorkerBoardVO vo) {	//�˹� �Խñ� ����
		workerBoardDao.wbInsert(vo);		
	}

	@Override
	public WorkerBoardVO wbRead(String count) {	//�˹� �Խñ� �б� �� ��ȸ�� ����
		workerBoardDao.wbUpdateReadCount(count);
		return workerBoardDao.wbSelect(count);
	}
	
	@Override
	public List<WorkerBoardVO> wbListPage(WbCriteria cri){	//�˹� �Խ��� ����¡
		return workerBoardDao.wbListPage(cri);
	}
	
	@Override
	public int wbListCount() {	//�˹� �Խù� ����
		return workerBoardDao.wbListCount();
	}
	
	@Override
	public List<WorkerBoardVO> wbSearch(WbSearch wbs){
		return workerBoardDao.wbSearch(wbs);	//��� + ����¡ + �˻�
	}	
	
	@Override
	public int countWbSearch(WbSearch wbs) {
		return workerBoardDao.countWbSearch(wbs);  //�˻� ��� ����
	}

	@Override
	public List<NoticeVo> getNotice(){	//최신 공지글 하나 가져오기
		return workerBoardDao.getNotice();
	}
	
	@Override
	public int wbUpdateTimeover(String sysdate) {		 //공고기간만료 'Y' 업데이트
		return workerBoardDao.wbUpdateTimeover(sysdate);
	}
	
	@Override
	public List<WorkerBoardVO> wbDetailSearch(HashMap<String, Object> detail) {
		return workerBoardDao.wbDetailSearch(detail);
	}
	
	@Override
	public int wbCountDetail(HashMap<String, Object> detail) {
		return workerBoardDao.wbCountDetail(detail);
	}

}
