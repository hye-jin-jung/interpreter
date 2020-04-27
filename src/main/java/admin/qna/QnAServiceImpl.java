package admin.qna;

import java.util.List;

public class QnAServiceImpl implements QnAService {
	
	QnADAO qnaDAO;

	public void setQnaDAO(QnADAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}
	
	public QnAServiceImpl() {

	}

	@Override
	public List<QuestionDTO> selectAllQuestions() {
		return qnaDAO.selectAllQuestions();
	}

	@Override
	public List<QuestionDTO> selectQuestion(String questionNo) {
		return qnaDAO.selectQuestion(questionNo);
	}

	@Override
	public void deleteQuestion(String questionNo) {
		System.out.println("서비스" + questionNo);
		qnaDAO.deleteQuestion(questionNo);
	}
	
	
	
	
	@Override
	public List<AnswerDTO> selectAllComments(String questionNo) {
		return qnaDAO.selectAllComments(questionNo);
	}
	
	@Override
	public void insertComment(String questionNo, String comment) {
		qnaDAO.insertComment(questionNo, comment);
	}
	
	@Override
	public void updateComment(AnswerDTO dto) {
		qnaDAO.updateComment(dto);
	}
	
	public void deleteComment(AnswerDTO dto) {
		qnaDAO.deleteComment(dto);
	}
	
	
	
	
	
	@Override
	public List<QuestionDTO> qnaPaging(QuestionCriteria qc) {
		return qnaDAO.qnaPaging(qc);
	}
	
	@Override
	public int qnaListCount() {
		return qnaDAO.qnaListCount();
	}
	
}