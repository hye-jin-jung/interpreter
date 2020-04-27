package bookMark.spring;

import java.util.HashMap;
import java.util.List;

import bookMark.vo.BookMarkVO;
import cscenter.vo.NoticeVo;

public interface BookMarkDao {
	
	public abstract List<BookMarkVO> ebBmkList(String userCode);		//북마크리스트 사장게시글
	public abstract List<BookMarkVO> wbBmkList(String userCode);		//북마크리스트 사장게시글
	
	public abstract void bmkInsert(BookMarkVO vo);		//�ϸ�ũ �߰�
	
	public abstract int bmkDelete(BookMarkVO vo);		//�ϸ�ũ ����
	
	BookMarkVO bmkCheck(HashMap<String,Object> map);	//��� ��

}
