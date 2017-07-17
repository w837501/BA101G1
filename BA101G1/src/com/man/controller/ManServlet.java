package com.man.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.man.model.ManagerService;
import com.man.model.ManagerVO;
import com.tools.Send;

import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ManServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// 查詢
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出單一管理員");    // 資料庫取出的set物件,存入request
			try {
				String str = req.getParameter("man_id");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("請輸入員工編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				String man_id = null;
				try {
					man_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("輸入格式錯誤");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				ManagerVO managerVO = manSvc.getOneMan(man_id);
				if (managerVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}

		}
		// 修改
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "修改單一管理員");    // 資料庫取出的set物件,存入request
			try {
				String man_id = new String(req.getParameter("man_id"));
				ManagerService managerSvc = new ManagerService();
				ManagerVO managerVO = managerSvc.getOneMan(man_id);
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMan.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有管理員");    // 資料庫取出的set物件,存入request
			try {
				String man_id = new String(req.getParameter("man_id"));

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_pw = req.getParameter("man_pw");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					man_name = req.getParameter("man_name");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					man_phone = req.getParameter("man_phone");
				}
				if (req.getParameter("man_pw") == null || req.getParameter("man_pw").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					man_pw = req.getParameter("man_pw");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					man_mail = req.getParameter("man_mail");
				}

				ManagerVO managerVO = new ManagerVO();
				managerVO.setMan_id(man_id);
				managerVO.setMan_name(man_name);
				managerVO.setMan_phone(man_phone);
				managerVO.setMan_pw(man_pw);
				managerVO.setMan_mail(man_mail);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				managerVO = manSvc.updateMan(man_id, man_name, man_phone, man_pw, man_mail);

				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
				failureView.forward(req, res);
			}
		}
		// 新增

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				 /*String man_name="";
				 try{
				 man_name=req.getParameter("man_name").trim();
				 }catch(Exception e){
				 man_name="";
				 errorMsgs.add("請輸入名字");
				 }
				 String man_phone="";
				 try{
				 man_phone=new String(req.getParameter("man_phone").trim());
				 }catch (Exception e) {
				 man_phone="";
				 errorMsgs.add("請輸入電話");
				 }
				 String man_pw=null;
				 try{
				 man_pw=new String(req.getParameter("man_pw").trim());
				 }catch (Exception e) {
				 man_pw="";
				 errorMsgs.add("請輸入密碼");
				 }
				
				 String man_mail=null;
				 try{
				 man_mail=new String(req.getParameter("man_mail").trim());
				 }catch (Exception e) {
				 man_mail="";
				 errorMsgs.add("請輸入信箱");
				 }*/

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				}
				/**********亂數密碼*****************************/
				int a = (int)(Math.random()*(999-100+1))+100;
				String man_pw = String.valueOf(a);
				System.out.println("亂數密碼222行 "+man_pw);
				/**********亂數密碼*****************************/
				ManagerVO managerVO = new ManagerVO();
				managerVO.setMan_name(man_name);
				managerVO.setMan_phone(man_phone);
				managerVO.setMan_pw(man_pw);
				managerVO.setMan_mail(man_mail);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/addMan.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				managerVO = manSvc.addMan(man_name, man_phone, man_pw, man_mail);
				req.setAttribute("managerVO", managerVO);
		/**************寄送mail********************************************/
				String to = man_mail;
			    String subject = "恭喜您已經成為<<吃訂我>>平台管理員了喔";
			    String ch_name = man_name;
			    String passRandom = man_pw;
			    String messageText = "Hello! " + ch_name + " 請謹記此密碼: " + passRandom + "\n" +" (已經啟用了喔)"; 
			    sendMail(to, subject, messageText);
		/**************寄送至手機********************************************/
		/**************寄送至手機********************************************/
			 	Send se = new Send();
			 	String[] tel ={man_phone};
			 	String message = man_name+"先生你好，這裡是吃訂我線上平台系統，恭喜你註冊囉，密碼已送至信箱，已經可以登入囉";
			 	se.sendMessage(tel , message);
		/**************寄送mail********************************************/
	
				String url = "/backend/man/login_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/addMan.jsp");
				failureView.forward(req, res);
			}

		}
		// 刪除

		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有管理員");    // 資料庫取出的set物件,存入request
			try {
				String man_id = new String(req.getParameter("man_id"));

				ManagerService manSvc = new ManagerService();
				manSvc.deleteMan(man_id);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/ListAllMan.jsp");
				failureView.forward(req, res);
			}
		}
		// 列出所有管理員include
		
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有管理員");    // 資料庫取出的set物件,存入request
//			try {
//				String man_id = new String(req.getParameter("man_id"));
//				
//				ManagerService manSvc = new ManagerService();
//				manSvc.deleteMan(man_id);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
//				failureView.forward(req, res);
//			}
		}
		// login 登入檢查
		if ("loginCHK".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			errorMsgs.add("");
			/******************我新增的帳密條件判斷*********************/
			String account = req.getParameter("loginUser").trim();
			String password = req.getParameter("loginPwd").trim();
			HttpSession session = req.getSession();
			ManagerService manSvc = new ManagerService();
			
			
			
			session.setAttribute("errorMsgs", errorMsgs);
			session.setAttribute("location" , req.getRequestURI());
			session.setAttribute("loginUser" , account);
			try {
				if(account.isEmpty()){
					errorMsgs.add("員工編號不能為空");
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					return;
				}
				if(manSvc.getOneMan(account)==null){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("請輸入正確員工編號");
					return;
				}
				if(manSvc.getOneMan(account).getMan_id()==null){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("請輸入正確員工編號");
					return;
				}
				if(password.isEmpty()){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("密碼不能為空");
					return;
				}
				if(!manSvc.getOneMan(account).getMan_pw().equals(password)){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("請輸入正確密碼");
					return;
				}
				/******************我新增的帳密條件判斷*********************/
			String man_id = account;
			ManagerVO managerVO = manSvc.getOneMan(man_id);
			/****************transferID***********************/
			HttpSession sessionId = req.getSession();
			sessionId.setAttribute("account", account);
			/****************transferID***********************/
				errorMsgs.removeAll(errorMsgs);
				req.getSession().setAttribute("manVO", managerVO);
				String url = "/backend/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/login_man.jsp");
				failureView.forward(req, res);
			}

		}
		
	}
	
	/**************************** 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容************************/
		public void sendMail(String to, String subject, String messageText) {
				
		   try {
			   // 設定使用SSL連線至 Gmail smtp Server
			   Properties props = new Properties();
			   props.put("mail.smtp.host", "smtp.gmail.com");
			   props.put("mail.smtp.socketFactory.port", "465");
			   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			   props.put("mail.smtp.auth", "true");
			   props.put("mail.smtp.port", "465");

	       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
	       // ●須將myGmail的【安全性較低的應用程式存取權】打開
		     final String myGmail = "ixlogic.wu@gmail.com";
		     final String myGmail_password = "AAA45678";
			   Session session = Session.getInstance(props, new Authenticator() {
				   protected PasswordAuthentication getPasswordAuthentication() {
					   return new PasswordAuthentication(myGmail, myGmail_password);
				   }
			   });

			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(myGmail));
			   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			  
			   //設定信中的主旨  
			   message.setSubject(subject);
			   //設定信中的內容 
			   message.setText(messageText);

			   Transport.send(message);
			   System.out.println("傳送成功!");
	     }catch (MessagingException e){
		     System.out.println("傳送失敗!");
		     e.printStackTrace();
	     }
	   }

		
}
