package love.spring;

import java.util.HashMap;
import java.util.List;

import love.vo.LoveVO;

public interface LoveDao {

	public abstract List<LoveVO> loverList(String userCode);	//찜하기 목록

	public abstract void loverInsert(LoveVO vo);		//찜하기 추가
	
	public abstract int loverDelete(LoveVO vo);		//찜하기 삭제
	
	LoveVO loverCheck(HashMap<String,Object> map);	//찜하기 디비 비교

}
