package love.spring;

import java.util.HashMap;
import java.util.List;

import love.vo.LoveVO;

public interface LoveDao {

	public abstract List<LoveVO> loverList(String userCode);	//���ϱ� ���

	public abstract void loverInsert(LoveVO vo);		//���ϱ� �߰�
	
	public abstract int loverDelete(LoveVO vo);		//���ϱ� ����
	
	LoveVO loverCheck(HashMap<String,Object> map);	//���ϱ� ��� ��

}
