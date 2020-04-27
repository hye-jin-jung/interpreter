package bookMark.spring;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import bookMark.spring.BookMarkDao;
import bookMark.spring.BookMarkDaoMybatis;
import bookMark.vo.BookMarkVO;

@Service
public class BookMarkServiceImpl implements BookMarkService{
	
	private BookMarkDao bookMarkDao;

	
	public BookMarkDao getBookMarkDao() {
		return bookMarkDao;
	}
	
	public void setBookMarkDao(BookMarkDao BookMarkDao) {
		this.bookMarkDao = BookMarkDao;
	}
	
	//�����ڵ�� �ϸ�ũ ����Ʈ �ҷ�����
	@Override
	public List<BookMarkVO> ebBmkList(String userCode){	
		return bookMarkDao.ebBmkList(userCode);
	}
	public List<BookMarkVO> wbBmkList(String userCode){	
		return bookMarkDao.wbBmkList(userCode);
	}	
	
	
	//�ϸ�ũ �߰�
	@Override
	public void bmkInsert(BookMarkVO vo) {
		bookMarkDao.bmkInsert(vo);
	}
	
	//�ϸ�ũ ����
	@Override
	public int bmkDelete(BookMarkVO vo) {
		return bookMarkDao.bmkDelete(vo);
	}
	
	//�ϸ�ũ DB�� ��
	@Override
	public BookMarkVO bmkCheck(HashMap<String,Object> map) {
		System.out.println("���񽺷� �Ѿ��  :" + map);
		return bookMarkDao.bmkCheck(map);
	}

}
