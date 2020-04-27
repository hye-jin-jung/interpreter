package admin.qna;

public class QuestionDTO {
	
	int questionNo;
	String writerCode;
	String inquiryType;
	String title;
	String content;
	String filePath;
	String complain;
	String regDate;
	String yn;

	public QuestionDTO() {

	}

	public QuestionDTO(int questionNo, String writerCode, String inquiryType, String title, String content,
			String filePath, String complain, String regDate, String yn) {
		this.questionNo = questionNo;
		this.writerCode = writerCode;
		this.inquiryType = inquiryType;
		this.title = title;
		this.content = content;
		this.filePath = filePath;
		this.complain = complain;
		this.regDate = regDate;
		this.yn = yn;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getWriterCode() {
		return writerCode;
	}

	public void setWriterCode(String writerCode) {
		this.writerCode = writerCode;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getComplain() {
		return complain;
	}

	public void setComplain(String complain) {
		this.complain = complain;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getYn() {
		return yn;
	}

	public void setYn(String yn) {
		this.yn = yn;
	}

	@Override
	public String toString() {
		return "QuestionDTO [questionNo=" + questionNo + ", writerCode=" + writerCode + ", inquiryType=" + inquiryType
				+ ", title=" + title + ", content=" + content + ", filePath=" + filePath + ", complain=" + complain
				+ ", regDate=" + regDate + ", yn=" + yn + "]";
	}


}
