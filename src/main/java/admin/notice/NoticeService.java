package admin.notice;

import java.util.List;

public interface NoticeService {
	
	List<NoticeDTO> selectAllContents();
	NoticeDTO selectContent(String no);
	void insertContent(String title, String content);
	NoticeDTO selectContentEdit(String no);
	NoticeDTO updateContent(String no, String title, String content);
	void deleteContent(String no);
	
	List<NoticeDTO> noticePaging(NoticeCriteria nc);
	int noticeListCount();
	
}
