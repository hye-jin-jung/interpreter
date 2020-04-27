package cscenter.vo;

public class QnaRequestVo {
	private String questionNo;
	private String writercode;
	private String regdate;
	private String inquirytype;
	private String title;
	private String content;
	private String complain;
	
	public QnaRequestVo() {
		
	}

	

	public String getQuestionNo() {
		return questionNo;
	}



	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}



	public QnaRequestVo(String questionNo, String writercode, String regdate, String inquirytype, String title,
			String content, String complain) {
		super();
		this.questionNo = questionNo;
		this.writercode = writercode;
		this.regdate = regdate;
		this.inquirytype = inquirytype;
		this.title = title;
		this.content = content;
		this.complain = complain;
	}



	public String getWritercode() {
		return writercode;
	}

	public void setWritercode(String writercode) {
		this.writercode = writercode;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getInquirytype() {
		return inquirytype;
	}

	public void setInquirytype(String inquirytype) {
		this.inquirytype = inquirytype;
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

	public String getComplain() {
		return complain;
	}

	public void setComplain(String complain) {
		this.complain = complain;
	}
	
	
	
	
	
	
	
	
}
