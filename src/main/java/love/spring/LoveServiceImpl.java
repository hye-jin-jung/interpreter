package love.spring;

import java.util.HashMap;
import java.util.List;

import love.spring.LoveDao;
import love.vo.LoveVO;

public class LoveServiceImpl implements LoveService {

	private LoveDao loveDao;

	

	public LoveDao getLoveDao() {
		return loveDao;
	}

	public void setLoveDao(LoveDao loveDao) {
		this.loveDao = loveDao;
	}

	//�����ڵ�� ���ϱ� ����Ʈ �ҷ�����
	@Override
	public List<LoveVO> loverList(String userCode){	
		return loveDao.loverList(userCode);
	}	
	
	//���ϱ� �߰�
	@Override
	public void loverInsert(LoveVO vo) {
		loveDao.loverInsert(vo);
	}
	
	//���ϱ� ����
	@Override
	public int loverDelete(LoveVO vo) {
		return loveDao.loverDelete(vo);
	}
	
	//���ϱ� DB�� ��
	@Override
	public LoveVO loverCheck(HashMap<String,Object> map) {
		System.out.println("���񽺷� �Ѿ��  :" + map);
		return loveDao.loverCheck(map);
	}

}
