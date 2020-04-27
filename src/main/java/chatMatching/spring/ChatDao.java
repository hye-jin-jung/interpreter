package chatMatching.spring;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import chatMatching.vo.ChatVo;
import employerBoard.vo.EmployerBoardVO;
import workerBoard.vo.WorkerBoardVO;


public class ChatDao implements ChatDaoImpl {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ChatDao() {}
	
	public ChatDao(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public void insertChatOne2(String userCode,String fromCode, String toCode, String chatContent, String readCheck) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userCode", userCode);
		map.put("fromCode", fromCode);
		map.put("toCode", toCode);
		map.put("chatContent", chatContent);
		map.put("readCheck", readCheck);
		
		sqlSessionTemplate.insert("insertChatOne", map);
			
	}
	
	public ChatVo selectChatOne2(String fromCode, String toCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("fromCode", fromCode);
		map.put("toCode", toCode);
		return sqlSessionTemplate.selectOne("selectChatOne", map);
	}
	
	@Override
	public void updateReadCheck2(String fromCode, String toCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("fromCode", fromCode);
		map.put("toCode", toCode);
		System.out.println("채팅방입장 읽음 처리 : "+ map);
		sqlSessionTemplate.update("updateReadCheck",map);
		
	}
	
	@Override
	public List<ChatVo> selectOneChatList2(String myuserCode, String toCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userCode", myuserCode);
		map.put("toCode", toCode);

		return sqlSessionTemplate.selectList("selectOneChatList", map );
	}
	
	@Override
	public int selectAllReadCount2(String myUserCode) {
		
		return sqlSessionTemplate.selectOne("selectAllReadCount", myUserCode);
	}
	
	@Override
	public int selectReadCount2(String toCode, String fromCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("toCode", toCode);
		map.put("fromCode", fromCode);
		return sqlSessionTemplate.selectOne("selectReadCount", map);
	}
	
	@Override
	public List<ChatVo> selectAllChatList2(String myUserCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userCode", myUserCode);
		System.out.println("selectAllChatList2: " + map.toString());
		return sqlSessionTemplate.selectList("selectAllChatList", map);
	}
	
	public void deleteChat2(String myuserCode, String fromCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("fromCode", myuserCode);
		map.put("toCode", fromCode);
		
		sqlSessionTemplate.delete("deleteChat", map);
		
	}
	
	//매칭하기에 사용될 사장님게시글을 가져오는 쿼리문 <임시 : 수현언니꺼에 있음> 
	public List<EmployerBoardVO> selectEb(String writerCode) {
		return sqlSessionTemplate.selectList("selectEb", writerCode);	
	}
	
	public List<WorkerBoardVO> selectWb(String writerCode) {
		return sqlSessionTemplate.selectList("selectWb", writerCode);	
	}

	public void insertMatching2(String myuserCode, String employeeCode, String ebCode,
			String groupID) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("employerCode", myuserCode);
		map.put("employeeCode", employeeCode);
		map.put("ebCode", ebCode);
		map.put("groupID", groupID);
		
		sqlSessionTemplate.insert("insertMatching",map);
	}

	public String selectSmsCheck2(String myuserCode) {
		String smsCheck = sqlSessionTemplate.selectOne("selectSmsCheck",myuserCode);
		return  smsCheck;	
	}


	
}
