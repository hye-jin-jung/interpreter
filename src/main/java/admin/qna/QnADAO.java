package admin.qna;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class QnADAO {
	
	SqlSessionTemplate sqlSessionTemplate;
	QuestionDTO questionDTO;
	AnswerDTO answerDTO;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setQuestionDTO(QuestionDTO questionDTO) {
		this.questionDTO = questionDTO;
	}

	public void setAnswerDTO(AnswerDTO answerDTO) {
		this.answerDTO = answerDTO;
	}

	public QnADAO() {

	}

	public QnADAO(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public QnADAO(SqlSessionTemplate sqlSessionTemplate, QuestionDTO questionDTO) {
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.questionDTO = questionDTO;
	}
	
	public QnADAO(SqlSessionTemplate sqlSessionTemplate, AnswerDTO answerDTO) {
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.answerDTO = answerDTO;
	}
	
	
	
	
	
	public List<QuestionDTO> selectAllQuestions() {
		return sqlSessionTemplate.selectList("admin.selectAllQuestions");
	}	
	
	public List<QuestionDTO> selectQuestion(String questionNo) {
		return sqlSessionTemplate.selectList("admin.selectQuestion", questionNo);
	}
	
	public void deleteQuestion(String questionNo) {
		System.out.println("dao" + questionNo);

		sqlSessionTemplate.delete("admin.deleteQuestion", questionNo);
	}
	

	
	
	public List<AnswerDTO> selectAllComments(String questionNo) {
		return sqlSessionTemplate.selectList("admin.selectAllComments", questionNo);
	}
	
	public void insertComment(String questionNo, String comment) {
		System.out.println("dao " + questionNo);
		System.out.println("dao " + comment);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("questionNo", questionNo);
		map.put("comment", comment);

		System.out.println(map.get("questionNo"));
		System.out.println(map.get("comment"));

		sqlSessionTemplate.insert("admin.insertComment", map);
	}

	public void updateComment(AnswerDTO dto) {
		sqlSessionTemplate.update("admin.updateComment", dto);
	}
	
	public void deleteComment(AnswerDTO dto) {
		sqlSessionTemplate.delete("admin.deleteComment", dto);
	}
	
	
	
	
	public List<QuestionDTO> qnaPaging(QuestionCriteria qc) {
		return sqlSessionTemplate.selectList("admin.qnaPaging", qc);
	}

	public int qnaListCount() {
		return sqlSessionTemplate.selectOne("admin.qnaListCount");
	}
	
}
