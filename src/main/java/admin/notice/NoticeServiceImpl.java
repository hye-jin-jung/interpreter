package admin.notice;

import java.util.List;

public class NoticeServiceImpl implements NoticeService {
	
	NoticeDAO noticeDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	public NoticeServiceImpl() {

	}
	
	
	
	
	@Override
	public List<NoticeDTO> selectAllContents() {
		return noticeDAO.selectAllContents();
		
	}

	@Override
	public NoticeDTO selectContent(String no) {
		return noticeDAO.selectContent(no);
	}
	
	@Override
	public void insertContent(String title, String content) {
		noticeDAO.insertContent(title, content);
	}
	
	@Override
	public NoticeDTO selectContentEdit(String no) {
		return noticeDAO.selectContentEdit(no);	
	}
	
	@Override
	public NoticeDTO updateContent(String no, String title, String content) {
		return noticeDAO.updateContent(no, title, content);
	}

	@Override
	public void deleteContent(String no) {
		noticeDAO.deleteContent(no);
	}
	
	@Override
	public List<NoticeDTO> noticePaging(NoticeCriteria nc) {
		return noticeDAO.noticePaging(nc);
	}
	
	@Override
	public int noticeListCount() {
		return noticeDAO.noticeListCount();
	}
	
}
