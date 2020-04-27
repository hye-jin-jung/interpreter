package admin.notice;

public class NoticeDTO {
	
	int no;
	String title;
	String content;
	String regDate;
	int hit;
	
	public NoticeDTO() {

	}

	public NoticeDTO(int no, String title, String content, String regDate, int hit) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
