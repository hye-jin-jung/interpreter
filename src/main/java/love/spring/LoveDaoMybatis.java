package love.spring;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import love.vo.LoveVO;

public class LoveDaoMybatis implements LoveDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public LoveDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
		
	//유저코드로 북마크 리스트 불러오기
	@Override
	public List<LoveVO> loverList(String userCode){
		return sqlSessionTemplate.selectList("loverList", userCode);
	}	

	
	//북마크 추가
	@Override
	public void loverInsert(LoveVO vo) {
		//vo에 저장된 값을 받아서 sql세션에 저장하고 insert로 넘어감
		sqlSessionTemplate.insert("loverInsert", vo);
	}
	
	//북마크 삭제
	@Override
	public int loverDelete(LoveVO vo) {	
		return sqlSessionTemplate.delete("loverDelete", vo);
	}

	@Override
	public LoveVO loverCheck(HashMap<String,Object> map) {
		System.out.println("dao:"+map);
		return sqlSessionTemplate.selectOne("loverCheck", map);
	}
	
}
