package cscenter.vo;

public class NoticeVo {
	private int no;
	private String title;
	private String content;
	private String regdate;
	private int hit;
	
	
	public NoticeVo() {
	}


	public NoticeVo(int no, String title, String content, String regdate, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
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


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}



	
	
}
