package bookMark.spring;

import java.util.HashMap;
import java.util.List;

import bookMark.vo.BookMarkVO;

public interface BookMarkService {
	
	public abstract List<BookMarkVO> ebBmkList(String userCode);	//�ϸ�ũ ���
	public abstract List<BookMarkVO> wbBmkList(String userCode);
	
	public abstract void bmkInsert(BookMarkVO vo);	//�ϸ�ũ �߰�
	
	public abstract int bmkDelete(BookMarkVO vo);	//�ϸ�ũ ����
	
	BookMarkVO bmkCheck(HashMap<String,Object> map);	//��� �ϸ�ũ ���� �ִ��� ��

}
