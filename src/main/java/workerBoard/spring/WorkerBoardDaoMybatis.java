package workerBoard.spring;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EmployerBoardVO;
import workerBoard.vo.WbCriteria;
import workerBoard.vo.WbSearch;
import workerBoard.vo.WorkerBoardVO;


public class WorkerBoardDaoMybatis implements WorkerBoardDao {
	
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public WorkerBoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<WorkerBoardVO> wbList() {
		return sqlSessionTemplate.selectList("wbList");
	}

	@Override
	public int wbDelete(String wbCode) {
		return sqlSessionTemplate.delete("wbDelete", wbCode);
	}

	@Override
	public int wbUpdate(WorkerBoardVO vo) {
		return sqlSessionTemplate.update("wbUpdate", vo);
	}

	@Override
	public void wbInsert(WorkerBoardVO vo) {
		sqlSessionTemplate.insert("wbInsert", vo);
	}

	@Override
	public WorkerBoardVO wbSelect(String wbcode) {
		WorkerBoardVO vo = (WorkerBoardVO) sqlSessionTemplate.selectOne("wbSelect", wbcode);
		return vo;
	}

	@Override
	public int wbUpdateReadCount(String count) {
		return sqlSessionTemplate.update("wbUpdateCount", count);
	}
	
	@Override
	public List<WorkerBoardVO> wbListPage(WbCriteria cri){
		return sqlSessionTemplate.selectList("wbListPage", cri);
	}
	
	@Override
	public int wbListCount() {
		return sqlSessionTemplate.selectOne("wbListCount");
	}
	
	@Override 
	public List<WorkerBoardVO> wbSearch(WbSearch wbs){
		return sqlSessionTemplate.selectList("wbSearch", wbs);	//��� + ����¡ + �˻�
	}
	
	@Override
	public int countWbSearch(WbSearch wbs) {
		return sqlSessionTemplate.selectOne("countWbSearch", wbs);	//�˻� ��� ����
	}
	
	public List<NoticeVo> getNotice() {
		return sqlSessionTemplate.selectList("getNotice");
	}
	
	public int wbUpdateTimeover(String sysdate) { //공고기간만료 'Y' 업데이트
		return sqlSessionTemplate.update("wbUpdateTimeover", sysdate);
	}
	
	@Override
	public List<WorkerBoardVO> wbDetailSearch(HashMap<String, Object> detail) {
		return sqlSessionTemplate.selectList("projectQuery.wbDetailSearch", detail);
	}

	
	@Override
	public int wbCountDetail(HashMap<String, Object> detail) {
		return sqlSessionTemplate.selectOne("wbCountDetail", detail);	//�˻� ��� ����
	}
}
