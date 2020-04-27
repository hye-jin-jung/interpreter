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
		
	//�����ڵ�� �ϸ�ũ ����Ʈ �ҷ�����
	@Override
	public List<LoveVO> loverList(String userCode){
		return sqlSessionTemplate.selectList("loverList", userCode);
	}	

	
	//�ϸ�ũ �߰�
	@Override
	public void loverInsert(LoveVO vo) {
		//vo�� ����� ���� �޾Ƽ� sql���ǿ� �����ϰ� insert�� �Ѿ
		sqlSessionTemplate.insert("loverInsert", vo);
	}
	
	//�ϸ�ũ ����
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
