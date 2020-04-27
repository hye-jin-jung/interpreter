package employerBoard.spring;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import cscenter.vo.NoticeVo;
import employerBoard.vo.EbCriteria;
import employerBoard.vo.EbSearch;
import employerBoard.vo.EmployerBoardVO;

@Repository
public class EmployerBoardDaoMybatis implements EmployerBoardDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public EmployerBoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<EmployerBoardVO> ebList() {
		return sqlSessionTemplate.selectList("ebList");
	}

	@Override
	public int ebDelete(String ebCode) {
		return sqlSessionTemplate.delete("ebDelete", ebCode);
	}
	

	@Override
	public int ebUpdate(EmployerBoardVO vo) {
		return sqlSessionTemplate.update("ebUpdate", vo);
	}

	@Override
	public void ebInsert(EmployerBoardVO vo) {
		sqlSessionTemplate.insert("ebInsert", vo);
	}

	@Override
	public EmployerBoardVO ebSelect(String ebcode) {
		EmployerBoardVO vo = (EmployerBoardVO) sqlSessionTemplate.selectOne("ebSelect", ebcode);
		return vo;
	}

	@Override
	public int ebUpdateReadCount(String count) {
		return sqlSessionTemplate.update("ebUpdateCount", count);
	}
		

	@Override
	public List<EmployerBoardVO> listPage(EbCriteria cri){
		return sqlSessionTemplate.selectList("listPage", cri);
	}
	
	@Override
	public int listCount() {
		return sqlSessionTemplate.selectOne("listCount");
	}
	
	@Override 
	public List<EmployerBoardVO> ebSearch(EbSearch ebs){
		return sqlSessionTemplate.selectList("ebSearch", ebs);	//��� + ����¡ + �˻�
	}
	
	@Override
	public int countEbSearch(EbSearch ebs) {
		return sqlSessionTemplate.selectOne("countEbSearch", ebs);	//�˻� ��� ����
	}
	
	public List<NoticeVo> getNotice() {
		return sqlSessionTemplate.selectList("getNotice");
	}
	
	public int ebUpdateTimeover(String sysdate) { //공고기간만료 'Y' 업데이트
		return sqlSessionTemplate.update("ebUpdateTimeover", sysdate);
	}
	
	@Override
	public List<EmployerBoardVO> detailSearch(HashMap<String, Object> detail) {
		return sqlSessionTemplate.selectList("projectQuery.detailSearch", detail);
	}

	
	@Override
	public int countDetail(HashMap<String, Object> detail) {
		return sqlSessionTemplate.selectOne("countDetail", detail);	//�˻� ��� ����
	}
	
}
