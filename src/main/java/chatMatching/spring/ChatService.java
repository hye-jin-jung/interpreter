package chatMatching.spring;

import java.util.ArrayList;
import java.util.List;

import chatMatching.vo.ChatVo;
import employerBoard.vo.EmployerBoardVO;
import workerBoard.vo.WorkerBoardVO;


public class ChatService {
	private ChatDao chatDao;
	
	
	public ChatService() {
		super();
	}

	public ChatService(ChatDao chatDao){
		this.chatDao = chatDao;
	}
	//안읽은 채팅 갯수 
	public int allChatCount(String myUserCode) {
		int count = chatDao.selectAllReadCount2(myUserCode);
		return count;
	}
	//채팅전송서비스
	public ChatVo sendChat(String fromCode, String toCode, String chatContent, String readCheck){
		chatDao.insertChatOne2(fromCode, fromCode, toCode, chatContent, readCheck);
		chatDao.insertChatOne2(toCode, fromCode, toCode, chatContent, readCheck);
		ChatVo result = chatDao.selectChatOne2(fromCode,toCode);
		//if 문으로 오전, 오후 붙여주기
		return result;
	}
	
	//채팅창 들어온후 서비스
	public List<ChatVo> getOneChatList(String myuserCode, String toCode){
		System.out.println("getOneChatList");
		System.out.println(myuserCode +","+toCode);
		chatDao.updateReadCheck2(toCode, myuserCode);
		List<ChatVo> oneChatVoList = chatDao.selectOneChatList2(myuserCode, toCode);
		
		for(ChatVo e :  oneChatVoList) {
			System.out.println(e.getUserCode()+":" + e.getChatContent() +"채팅리스트" );
		}
		//if 문으로 오전, 오후 붙여주기
		return oneChatVoList;
	}
	
	//채팅목록 띄우기 서비스
	public List<ChatVo> getAllChatList(String myUserCode){
		List<ChatVo> resultChatVoList = new ArrayList<ChatVo>();
		
		List<ChatVo> chatVoList = chatDao.selectAllChatList2(myUserCode);
		
		for(int i = 0; i < chatVoList.size(); i++) {
			ChatVo x = chatVoList.get(i);
			for(int j = 0; j < chatVoList.size(); j++) {
				ChatVo y = chatVoList.get(j);
				if(x.getFromCode().equals(y.getToCode()) && x.getToCode().equals(y.getFromCode())) {
					if(x.getChatNum() < y.getChatNum()) {
						chatVoList.remove(x);
						i--;
						break;
					}else {
						chatVoList.remove(y);
						j--;
					}
				}
			}
		}
		
		for(ChatVo o : chatVoList) {
			String fromCode = "";
			if(myUserCode.equals(o.getFromCode())) {
				fromCode = o.getToCode();
			}else {
				fromCode = o.getFromCode();
			}
			int readCount = chatDao.selectReadCount2(myUserCode, fromCode);
			o.setReadCheck(readCount); //readCheck를 안읽은 채팅갯수로 변경
			resultChatVoList.add(o);
		}
		
		
		return resultChatVoList;
	}
	
	public void deleteChat(String fromCode, String toCode){
		chatDao.updateReadCheck2(fromCode, toCode);
		chatDao.deleteChat2(fromCode, toCode);
	}
	
	//임시 : 수현언니 사장님게시글 뽑아오는 서비스
	public List<EmployerBoardVO> selectEb(String writerCode) {
		return chatDao.selectEb(writerCode);
		
	}

	public void insertMatching(String myuserCode, String employeeCode, String ebCode,
			String groupID) {
		chatDao.insertMatching2(myuserCode,employeeCode,ebCode,groupID);
		
	}

	public String selectSmsCheck(String myuserCode) {
		String smsCheck = chatDao.selectSmsCheck2(myuserCode);
		return smsCheck;
	}

	public List<WorkerBoardVO> selectWb(String writerCode) {
		return chatDao.selectWb(writerCode);
	}
	
	
	
}
