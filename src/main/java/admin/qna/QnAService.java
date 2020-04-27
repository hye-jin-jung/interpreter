package admin.qna;

import java.util.List;

public interface QnAService {
	
	List<QuestionDTO> selectAllQuestions();
	List<QuestionDTO> selectQuestion(String questionNo);
	void deleteQuestion(String questionNo);
	
	List<AnswerDTO> selectAllComments(String questionNo);
	void insertComment(String questionNo, String comment);
	void updateComment(AnswerDTO dto);
	void deleteComment(AnswerDTO dto);
	
	List<QuestionDTO> qnaPaging(QuestionCriteria qc);
	int qnaListCount();
}
