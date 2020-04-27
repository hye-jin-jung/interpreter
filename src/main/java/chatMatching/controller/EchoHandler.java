package chatMatching.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import chatMatching.spring.ChatService;
import chatMatching.vo.ChatVo;

public class EchoHandler extends TextWebSocketHandler {

	public EchoHandler() {
		System.out.println("웹소켓 객체 생성");
	}

	private ChatService chatService;

	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, String> chatUsers = new ConcurrentHashMap<String, String>();

	private Map<String, WebSocketSession> main = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓연결");
		  Map<String, Object> map = session.getAttributes();
			if(map.get("fromCode") !=null) {
			  System.out.println(session.getId() + "웹 소켓 접속자 : " + map.get("myuserCode"));
			  users.put((String)map.get("myuserCode"), session);
			  chatUsers.put((String)map.get("myuserCode"),(String)map.get("fromCode"));
			  
			  System.out.println("users========================");
			  System.out.println(users.toString());
			  System.out.println("========================");
			}else {
				main.put((String) map.get("myuserCode"), session);
				  System.out.println("main========================");
				  System.out.println(main.toString());
				  System.out.println("========================");
			}
		 
	}

	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
			Map<String, Object> map = session.getAttributes();
			
			System.out.println("메시지 전송됨");
			String myuserCode = (String) map.get("myuserCode");
			String fromCode = (String) map.get("fromCode");// 이부분 조심 fromCode이지만 채팅받는사람
			if(message.getPayload().charAt(0) == '3') {
				if (users.get(fromCode) != null && chatUsers.get(fromCode).equals(myuserCode)) {
					JSONObject json = new JSONObject();
					json.put("readUser", fromCode);
					String readMessage = json.toJSONString();
					users.get(fromCode).sendMessage(new TextMessage(readMessage));
				}
			}
			else{
				String chatContent = message.getPayload().substring(1);
				System.out.println(myuserCode + "가 " + fromCode + "에게 " + chatContent + "전송");
			
				String readCheck = "1";
				if (users.get(fromCode) != null && chatUsers.get(fromCode).equals(myuserCode)) {
					System.out.println("null아님");
					readCheck = "0";
				}
				ChatVo o = chatService.sendChat(myuserCode, fromCode, chatContent, readCheck);// 채팅 테이블에 insert

				int hour = Integer.parseInt(o.getChatTime().substring(0, 2));
				String min = o.getChatTime().substring(2);
				System.out.println(o.getChatTime());
				System.out.println(hour);
				if (hour > 12) {
					System.out.println("오후 -12");
					hour -= 12;
					o.setChatTime("오후 " + hour + min);
				} else if (hour == 12) {
					o.setChatTime("오후 " + hour + min);
				} else {
					System.out.println("오전");
					o.setChatTime("오전 " + hour + min);
				}

				JSONObject json = new JSONObject();
				json.put("fromCode", o.getFromCode());
				json.put("chatContent", o.getChatContent());
				json.put("chatTime", o.getChatTime());
				json.put("readCheck", o.getReadCheck());
			
				String result = json.toJSONString();

				System.out.println(result);

				users.get(myuserCode).sendMessage(new TextMessage(result));
				System.out.println("전송성공");

				if (users.get(fromCode) != null) {
					users.get(fromCode).sendMessage(new TextMessage(result));
				}
				if (main.get(fromCode) != null) {
					String count = String.valueOf(chatService.allChatCount(fromCode));
					main.get(fromCode).sendMessage(new TextMessage(count));
				}
			}
	}

	public void sendMatching(String ebURL) {
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		System.out.println("메시지 전송됨");
		String myuserCode = (String) map.get("myuserCode");
		
		users.remove(myuserCode);
		System.out.println("세션삭제");
		System.out.println(users);
		
		main.remove(myuserCode);
	
	}

}