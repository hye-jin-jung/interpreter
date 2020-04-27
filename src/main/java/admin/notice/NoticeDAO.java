package admin.notice;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import admin.qna.QuestionCriteria;
import admin.qna.QuestionDTO;

public class NoticeDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	private NoticeDTO noticeDTO;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setNoticeDTO(NoticeDTO noticeDTO) {
		this.noticeDTO = noticeDTO;
	}
	
	public NoticeDAO() {

	}

	public NoticeDAO(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public NoticeDAO(SqlSessionTemplate sqlSessionTemplate, NoticeDTO noticeDTO) {
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.noticeDTO = noticeDTO;
	}

	//DB에서 전체글을 받아오는 메소드
	public List<NoticeDTO> selectAllContents() {
		return sqlSessionTemplate.selectList("admin.selectAllContents");
	}
	
	//글번호로 해당 글을 가져오는 메소드
	public NoticeDTO selectContent(String no) {
		upHit(no);
		return sqlSessionTemplate.selectOne("admin.selectContent", no);
	}
	
	public void insertContent(String title, String content) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("content", content);
		sqlSessionTemplate.insert("admin.insertContent", map);
	}
	
	public NoticeDTO selectContentEdit(String no) {
		return sqlSessionTemplate.selectOne("admin.selectContent", no);
	}
	
	public NoticeDTO updateContent(String no, String title, String content) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		map.put("title", title);
		map.put("content", content);
		sqlSessionTemplate.update("admin.updateContent", map);
		
		return sqlSessionTemplate.selectOne("admin.selectContent", no);
	}
	
	public void deleteContent(String no) {
		sqlSessionTemplate.selectOne("admin.deleteContent", no);
	}
	
	//페이징
	public List<NoticeDTO> noticePaging(NoticeCriteria nc) {
		return sqlSessionTemplate.selectList("admin.noticePaging", nc);
	}
	
	public int noticeListCount() {
		return sqlSessionTemplate.selectOne("admin.noticeListCount");
	}

	//조회수 올리는 메소드
	public void upHit(String no) {
		sqlSessionTemplate.update("admin.upHit", no);
	}
	
}
