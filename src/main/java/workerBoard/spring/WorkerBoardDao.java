package workerBoard.spring;

import java.util.HashMap;
import java.util.List;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EmployerBoardVO;
import workerBoard.vo.WbCriteria;
import workerBoard.vo.WbSearch;
import workerBoard.vo.WorkerBoardVO;


public interface WorkerBoardDao {
	
	public abstract List<WorkerBoardVO> wbList(); //�˹� �Խñ� ����Ʈ

	public abstract int wbDelete(String wbCode); //�˹� �Խñ� ����
	
	public abstract int wbUpdate(WorkerBoardVO vo); //�˹� �Խñ� ����
	
	public abstract void wbInsert(WorkerBoardVO vo); //�˹� �Խñ� �ۼ�
	
	public abstract WorkerBoardVO wbSelect(String wbCode); //�˹� �Խñ� �ڵ�� �̾Ƽ� ��������
	
	public abstract int wbUpdateReadCount(String count); //�˹� �Խñ� ��ȸ�� ����

	public abstract List<WorkerBoardVO> wbListPage(WbCriteria cri);	//�˹� �Խ��� ����¡
	
	public abstract int wbListCount();	//�˹� �Խñ� ����
	
	public List<WorkerBoardVO> wbSearch(WbSearch wbs);	//��� + ����¡ + �˻�
	
	public int countWbSearch(WbSearch wbs);	//�˻� ��� ����
	
	public List<NoticeVo> getNotice();
	
	public int wbUpdateTimeover(String sysdate);	//공고기간만료 'Y' 업데이트
	
	public abstract List<WorkerBoardVO> wbDetailSearch(HashMap<String,Object> detail); //상세검색

	public int wbCountDetail(HashMap<String, Object> detail);	//상세검색 결과 갯수

}
