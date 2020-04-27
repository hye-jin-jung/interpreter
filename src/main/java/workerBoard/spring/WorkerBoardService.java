package workerBoard.spring;

import java.util.HashMap;
import java.util.List;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EmployerBoardVO;
import workerBoard.vo.WbCriteria;
import workerBoard.vo.WbSearch;
import workerBoard.vo.WorkerBoardVO;

public interface WorkerBoardService {
	
	public abstract List<WorkerBoardVO> wbList();	//�˹� �Խ��� ���
	
	public abstract void wbDelete(String wbCode);	//�˹� �Խñ� ����
	
	public abstract int wbEdit(WorkerBoardVO vo);		//�˹� �Խñ� ����
	
	public abstract void wbWrite(WorkerBoardVO vo);	//�˹� �Խñ� �ۼ�
	
	public abstract WorkerBoardVO wbRead(String wbCode);	//�˹� �Խñ� �б�
	
	public abstract List<WorkerBoardVO> wbListPage(WbCriteria cri);	//�˹� �Խ��� ����¡
	
	public abstract int wbListCount();	//�˹� �Խñ� ����
	
	public abstract List<WorkerBoardVO> wbSearch(WbSearch wbs);	//��� + ����¡ + �˻�
	
	public int countWbSearch(WbSearch wbs); //�˻� ��� ����

	public List<NoticeVo> getNotice();
	
	public int wbUpdateTimeover(String sysdate); //공고기간만료 'Y' 업데이트
	
public abstract List<WorkerBoardVO> wbDetailSearch(HashMap<String, Object> detail); //상세검색
	
	public int wbCountDetail(HashMap<String, Object> detail);	//상세검색 결과 갯수
		

}
