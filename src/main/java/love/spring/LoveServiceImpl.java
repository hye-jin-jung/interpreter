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

	//유저코드로 찜하기 리스트 불러오기
	@Override
	public List<LoveVO> loverList(String userCode){	
		return loveDao.loverList(userCode);
	}	
	
	//찜하기 추가
	@Override
	public void loverInsert(LoveVO vo) {
		loveDao.loverInsert(vo);
	}
	
	//찜하기 삭제
	@Override
	public int loverDelete(LoveVO vo) {
		return loveDao.loverDelete(vo);
	}
	
	//찜하기 DB값 비교
	@Override
	public LoveVO loverCheck(HashMap<String,Object> map) {
		System.out.println("서비스로 넘어옴  :" + map);
		return loveDao.loverCheck(map);
	}

}
