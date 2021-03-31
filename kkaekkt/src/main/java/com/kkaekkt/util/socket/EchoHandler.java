package com.kkaekkt.util.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kkaekkt.biz.user.AccountVO;
import com.mysql.cj.util.StringUtils;

public class EchoHandler extends TextWebSocketHandler {
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("서버에 접속 성공했을 때 접근");
		sessions.add(session);
		String mno = getMno(session);
		userSessionsMap.put(mno, session);
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지 수신");
		//protocol : mno , 내용
		String msg = message.getPayload();
		System.out.println(msg);
		if(!StringUtils.isNullOrEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 2) {
				String mno = strs[0];
				String content = strs[1];
				
				//작성자가 로그인 해서 있다면
				WebSocketSession boardWriterSession = userSessionsMap.get(mno);
				
				if(boardWriterSession != null) {//작성자가 세션에 있다면, 
					TextMessage tmpMsg = new TextMessage(content);
					boardWriterSession.sendMessage(tmpMsg);// 메시지를 보낸다.
				}
			}
		}
	}
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//System.out.println("afterConnectionClosed " + session + ", " + status);
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓 email 가져오기
	private String getMno(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		AccountVO loginUser = (AccountVO)httpSession.get("person");
		System.out.println(loginUser.getMno()+":회원번호 출력 체크");
		if(loginUser != null) {
			return loginUser.getMno()+"";//mno를 String으로 형변환해서 전달
		}else {//로그인 정보를 찾지 못했으면 sessionId를 반환
			return session.getId();
		}
	}
}