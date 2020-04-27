package admin.qna;

public class AnswerDTO {
	
	int answerNo;
	int questionNo; //게시글 번호
	String comment;
	String writer;
	String regDate;

	public AnswerDTO() {

	}

	public AnswerDTO(int answerNo, int questionNo, String comment, String writer, String regDate) {
		this.answerNo = answerNo;
		this.questionNo = questionNo;
		this.comment = comment;
		this.writer = writer;
		this.regDate = regDate;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
