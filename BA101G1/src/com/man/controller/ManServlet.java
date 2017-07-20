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
import com.permission.model.PermissionService;
import com.permission.model.PermissionVO;
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
		// �d��
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�C�X��@�޲z��");    // ��Ʈw���X��set����,�s�Jrequest
			try {
				String str = req.getParameter("man_id");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("�п�J���u�s��");
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
					errorMsgs.add("��J�榡���~");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				ManagerVO managerVO = manSvc.getOneMan(man_id);
				if (managerVO == null) {
					errorMsgs.add("�d�L���");
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
				errorMsgs.add("�L�k���o���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}

		}
		// �ק�
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�ק��@�޲z��");    // ��Ʈw���X��set����,�s�Jrequest
			try {
				String man_id = new String(req.getParameter("man_id"));
				ManagerService managerSvc = new ManagerService();
				ManagerVO managerVO = managerSvc.getOneMan(man_id);
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMan.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�C�X�Ҧ��޲z��");    // ��Ʈw���X��set����,�s�Jrequest
			try {
				String man_id = new String(req.getParameter("man_id"));

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_pw = req.getParameter("man_pw");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("�п�J�W�r");
				} else {
					man_name = req.getParameter("man_name");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("�п�J�q��");
				} else {
					man_phone = req.getParameter("man_phone");
				}
				if (req.getParameter("man_pw") == null || req.getParameter("man_pw").trim().isEmpty()) {
					errorMsgs.add("�п�J�K�X");
				} else {
					man_pw = req.getParameter("man_pw");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("�п�J�H�c");
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
				errorMsgs.add("�ק異��" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
				failureView.forward(req, res);
			}
		}
		// �s�W

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				 /*String man_name="";
				 try{
				 man_name=req.getParameter("man_name").trim();
				 }catch(Exception e){
				 man_name="";
				 errorMsgs.add("�п�J�W�r");
				 }
				 String man_phone="";
				 try{
				 man_phone=new String(req.getParameter("man_phone").trim());
				 }catch (Exception e) {
				 man_phone="";
				 errorMsgs.add("�п�J�q��");
				 }
				 String man_pw=null;
				 try{
				 man_pw=new String(req.getParameter("man_pw").trim());
				 }catch (Exception e) {
				 man_pw="";
				 errorMsgs.add("�п�J�K�X");
				 }
				
				 String man_mail=null;
				 try{
				 man_mail=new String(req.getParameter("man_mail").trim());
				 }catch (Exception e) {
				 man_mail="";
				 errorMsgs.add("�п�J�H�c");
				 }*/

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("�п�J�W�r");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("�п�J�q��");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("�п�J�H�c");
				}
				/**********�üƱK�X*****************************/
				int a = (int)(Math.random()*(999-100+1))+100;
				String man_pw = String.valueOf(a);
				System.out.println("�üƱK�X222�� "+man_pw);
				/**********�üƱK�X*****************************/
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
		/**************�H�email********************************************/
				String to = man_mail;
			    String subject = "���߱z�w�g����<<�Y�q��>>���x�޲z���F��";
			    String ch_name = man_name;
			    String passRandom = man_pw;
			    String messageText = "Hello! " + ch_name + " ���԰O���K�X: " + passRandom + "\n" +" (�w�g�ҥΤF��)"; 
			    sendMail(to, subject, messageText);
		/**************�H�e�ܤ��********************************************/
		/**************�H�e�ܤ��********************************************/
			 	Send se = new Send();
			 	String[] tel ={man_phone};
			 	String message = man_name+"���ͧA�n�A�o�̬O�Y�q�ڽu�W���x�t�ΡA���ߧA���U�o�A�K�X�w�e�ܫH�c�A�w�g�i�H�n�J�o";
			 	se.sendMessage(tel , message);
		/**************�H�email********************************************/
	
				String url = "/backend/man/login_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/addMan.jsp");
				failureView.forward(req, res);
			}

		}
		// �R��

		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String man_id = new String(req.getParameter("man_id"));

				ManagerService manSvc = new ManagerService();
				manSvc.deleteMan(man_id);
				String url = "/backend/man/ListAllMan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/ListAllMan.jsp");
				failureView.forward(req, res);
			}
		}
		// �C�X�Ҧ��޲z��include
		
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�C�X�Ҧ��޲z��");    // ��Ʈw���X��set����,�s�Jrequest
//			try {
//				String man_id = new String(req.getParameter("man_id"));
//				
//				ManagerService manSvc = new ManagerService();
//				manSvc.deleteMan(man_id);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//			} catch (Exception e) {
//				errorMsgs.add("�R����ƥ���" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
//				failureView.forward(req, res);
//			}
		}
		// login �n�J�ˬd
		if ("loginCHK".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			errorMsgs.add("");
			/******************�ڷs�W���b�K����P�_*********************/
			String account = req.getParameter("loginUser").trim();
			String password = req.getParameter("loginPwd").trim();
			HttpSession session = req.getSession();
			ManagerService manSvc = new ManagerService();
			
			
			
			session.setAttribute("errorMsgs", errorMsgs);
			session.setAttribute("location" , req.getRequestURI());
			session.setAttribute("loginUser" , account);
			try {
				if(account.isEmpty()){
					errorMsgs.add("���u�s�����ର��");
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					return;
				}
				if(manSvc.getOneMan(account)==null){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("�п�J���T���u�s��");
					return;
				}
				if(manSvc.getOneMan(account).getMan_id()==null){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("�п�J���T���u�s��");
					return;
				}
				if(password.isEmpty()){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("�K�X���ର��");
					return;
				}
				if(!manSvc.getOneMan(account).getMan_pw().equals(password)){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("�п�J���T�K�X");
					return;
				}
				/******************�ڷs�W���b�K����P�_*********************/
			String man_id = account;
			ManagerVO managerVO = manSvc.getOneMan(man_id);
			PermissionService pSvc = new PermissionService();
			List<PermissionVO> permList = null;
			permList = pSvc.findByManId(man_id);
			System.out.println(permList.toString());
			/****************transferID***********************/
			HttpSession sessionId = req.getSession();
			sessionId.setAttribute("account", account);
			sessionId.setAttribute("permList", permList);
			/****************transferID***********************/
				errorMsgs.removeAll(errorMsgs);
				req.getSession().setAttribute("manVO", managerVO);
				String url = "/backend/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/login_man.jsp");
				failureView.forward(req, res);
			}

		}
		
	}
	
	/**************************** �]�w�ǰe�l��:�ܦ��H�H��Email�H�c,Email�D��,Email���e************************/
		public void sendMail(String to, String subject, String messageText) {
				
		   try {
			   // �]�w�ϥ�SSL�s�u�� Gmail smtp Server
			   Properties props = new Properties();
			   props.put("mail.smtp.host", "smtp.gmail.com");
			   props.put("mail.smtp.socketFactory.port", "465");
			   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			   props.put("mail.smtp.auth", "true");
			   props.put("mail.smtp.port", "465");

	       // ���]�w gmail ���b�� & �K�X (�N�ǥѧA��Gmail�ӶǰeEmail)
	       // �����NmyGmail���i�w���ʸ��C�����ε{���s���v�j���}
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
			  
			   //�]�w�H�����D��  
			   message.setSubject(subject);
			   //�]�w�H�������e 
			   message.setText(messageText);

			   Transport.send(message);
			   System.out.println("�ǰe���\!");
	     }catch (MessagingException e){
		     System.out.println("�ǰe����!");
		     e.printStackTrace();
	     }
	   }

		
}
