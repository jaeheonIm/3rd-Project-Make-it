package com.makeit.main.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.makeit.main.MainService;

//클라이언트를 관리한다.
//연결-데이터전송-종료
public class EchoHandler extends TextWebSocketHandler {
	List<HashMap<String, Object>> list = new ArrayList<>();
	@Autowired
	private MainService mainService;

	
	//웹소켓이 연결되면 호출(=클라이언트와 연결 된 후)
	@SuppressAjWarnings
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished"+session);
		
		boolean flag = false;
		Map<String, Object> roomNumber = session.getAttributes();
		System.out.println("roomNumber정보:"+roomNumber);
		System.out.println("roomNumber:"+roomNumber.get("roomNumber"));
		int idx = list.size(); 
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				String rN = (String) list.get(i).get("roomNumber");
				if(rN.equals(roomNumber.get("roomNumber"))) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		if(flag) { //존재하는 방이라면 세션만 추가한다.
			HashMap<String, Object> map = list.get(idx);
			map.put(session.getId(), session);
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNumber", roomNumber.get("roomNumber"));
			map.put(session.getId(), session);
			list.add(map);
			System.out.println(">>>>>>>>>>>>"+list.toString());
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
		
		List<String> urlList = new ArrayList<String>();
		String url = session.getUri().toString();
		urlList.add(url.split("&")[0]);
		urlList.add(url.split("&")[1]);
		String authority = urlList.get(1).split("authority=")[1];
		if(authority.equals("admin")) {
			mainService.insertCheckAdmin((String)roomNumber.get("roomNumber"),"0",authority);
		}

		
	}
	//클라이언트가 메세지 전송시 호출되는 메소드(=웹소켓 서버로 데이터를 전송했을 경우)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage"+session+":"+message);
		String msg = message.getPayload();

		JSONObject obj = jsonParser(msg);
		System.out.println("obj:"+obj);
		
		String rN = (String) obj.get("roomNumber");

		String conversation = (String) obj.get("msg");
		String authority = (String) obj.get("authority"); 
		if(authority.equals("user")) {
			mainService.insertConversation(rN,conversation,authority,"1");
		}else {
			mainService.insertConversation(rN,conversation,authority,"0");		
		}
		int exist =  mainService.SearchChatRoom(rN);
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(exist == 1) {
			if(list.size() > 0) {
	
				System.out.println("lisg:"+list.toString());
				for(int i=0; i<list.size(); i++) {
					String roomNumber = (String) list.get(i).get("roomNumber"); //세션리스트의 저장된 방번호를 가져와서
					HashMap<String,Object> LIST = list.get(i);
					if(roomNumber.equals(rN)) { //같은값의 방이 존재한다면
						temp = list.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
						break;
					}
				}
				
				//해당 방의 세션들만 찾아서 메시지를 발송해준다.
				for(String k : temp.keySet()) { 
					if(k.equals("roomNumber")) { //다만 방번호일 경우에는 건너뛴다.
						continue;
					}
					
					WebSocketSession wss = (WebSocketSession) temp.get(k);
					if(wss != null) {
						try {
							wss.sendMessage(new TextMessage(obj.toJSONString()));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}else {
			session.close();
		}
	}
	//웹소켓의 연결이 종료되면 호출
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed"+session);
		if(list.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for(int i=0; i<list.size(); i++) {
				list.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
		List<String> urlList = new ArrayList<String>();
		String url = session.getUri().toString();
		urlList.add(url.split("&")[0]);
		urlList.add(url.split("&")[1]);
		String authority = urlList.get(1).split("authority=")[1];
		String chatnum = urlList.get(0).split("roomNumber=")[1];
		System.out.println("authority:"+authority);
		if(authority.equals("user")) {
			System.out.println("chatnum:"+chatnum);
			mainService.deleteChatRoom(chatnum);
		}else {
			mainService.deleteParticipant(authority,chatnum);
		}
	}
	
	//parser함수
	private static JSONObject jsonParser(String msg) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(msg);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
