package bookMark.spring;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import bookMark.vo.BookMarkVO;
import cscenter.vo.NoticeVo;


@Repository
public class BookMarkDaoMybatis implements BookMarkDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public BookMarkDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
		
	//북마크 리스트
	@Override
	public List<BookMarkVO> ebBmkList(String userCode){
		return sqlSessionTemplate.selectList("ebBmkList", userCode);
	}
	@Override
	public List<BookMarkVO> wbBmkList(String userCode){
		return sqlSessionTemplate.selectList("wbBmkList", userCode);
	}	


	
	//�ϸ�ũ �߰�
	@Override
	public void bmkInsert(BookMarkVO vo) {
		//vo�� ����� ���� �޾Ƽ� sql���ǿ� �����ϰ� insert�� �Ѿ
		sqlSessionTemplate.insert("bmkInsert", vo);
	}
	
	//�ϸ�ũ ����
	@Override
	public int bmkDelete(BookMarkVO vo) {	
		return sqlSessionTemplate.delete("bmkDelete", vo);
	}

	@Override
	public BookMarkVO bmkCheck(HashMap<String,Object> map) {
		System.out.println("dao:"+map);
		return sqlSessionTemplate.selectOne("bmkCheck", map);
	}


}
