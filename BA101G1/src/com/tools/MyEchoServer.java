package com.tools;
import java.io.*;
import java.util.*;

import javax.websocket.server.ServerEndpoint;
import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/MyEchoServer")
public class MyEchoServer {
	
private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session userSession) throws IOException { // 2. ���槹�AĲ�oindex.html��webSocket.onopen
		allSessions.add(userSession);
		System.out.println(userSession.getId() + ": �w�s�u");
//		userSession.getBasicRemote().sendText("WebSocket �s�u���\");
	}

	
	@OnMessage
	public void onMessage(Session userSession, String message) { // 4. ���槹�AĲ�oindex.html��webSocket.onmessage
		for (Session session : allSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}
	
	@OnError
	public void onError(Session userSession, Throwable e){
//		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		allSessions.remove(userSession);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}

 
}
