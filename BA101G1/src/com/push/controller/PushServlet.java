package com.push.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.push.model.PushService;
import com.push.model.*;

public class PushServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
System.out.println("action: " + action);
		
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("push_id");
System.out.println("getParameter: " + str);
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors  errorMsgs�����ŭȮ�
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/selectPage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				String push_id = null;
				try {
					push_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/selectPage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				PushService pushSvc = new PushService();
				PushVO pushVO = pushSvc.getOnePush(push_id);
				if (pushVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/selectPage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("pushVO", pushVO); // ��Ʈw���X��pushVO����,�s�Jreq
				String url = "/backend/push/listOnePush.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOnePush.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/push/selectPage.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllPush.jsp ��  /push/listPush_ByDeptno.jsp ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String push_id = new String(req.getParameter("push_id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				PushService pushSvc = new PushService();
				PushVO pushVO = pushSvc.getOnePush(push_id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("pushVO", pushVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/push/update_push_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_push_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z************************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_push_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String push_id = new String(req.getParameter("push_id").trim());
				String man_id = req.getParameter("man_id").trim();
				String push_content = req.getParameter("push_content").trim();				
				
				java.sql.Timestamp push_time = null;
				try {
					push_time = java.sql.Timestamp.valueOf(req.getParameter("push_time").trim());
				} catch (IllegalArgumentException e) {
					push_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}

				String news_id = null;
				try {
					news_id = new String(req.getParameter("news_id").trim());
				} catch (Exception e) {
					news_id = "NEWS-00001";
					errorMsgs.add("�Э��s��Jnews_id.");
				}

				String ad_id = null;
				try {
					ad_id = new String(req.getParameter("ad_id").trim());
				} catch (Exception e) {
					ad_id = "AD-000001";
					errorMsgs.add("�Э��s��Jad_id.");
				}

				
				PushVO pushVO = new PushVO();
				pushVO.setPush_id(push_id);
				pushVO.setMan_id(man_id);
				pushVO.setPush_content(push_content);
				pushVO.setPush_time(push_time);
				pushVO.setNews_id(news_id);
				pushVO.setAd_id(ad_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pushVO", pushVO); // �t����J�榡���~��pushVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/update_push_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				PushService pushSvc = new PushService();
				pushVO = pushSvc.updatePush(push_id, man_id, push_content, push_time, news_id,ad_id);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("pushVO", pushVO); // ��Ʈwupdate���\��,���T����pushVO����,�s�Jreq
				String url = "/backend/push/listOnePush.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOnePush.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/push/update_push_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addPush.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String man_id = req.getParameter("man_id").trim();
				String push_content = req.getParameter("push_content").trim();
				
				java.sql.Timestamp push_time = null;
				try {
					push_time = java.sql.Timestamp.valueOf(req.getParameter("push_time").trim());
				} catch (IllegalArgumentException e) {
					push_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
				
				String news_id = null;
				try {
					news_id = new String(req.getParameter("news_id").trim());
				} catch (Exception e) {
					news_id = "NEWS-00001";
					errorMsgs.add("�Э��s��Jnews_id..");
				}
				
				String ad_id = null;
				try {
					ad_id = new String(req.getParameter("ad_id").trim());
				} catch (Exception e) {
					ad_id = "AD-000001";
					errorMsgs.add("�Э��s��Jad_id..");
				}
				

				PushVO pushVO = new PushVO();
				pushVO.setMan_id(man_id);
				pushVO.setPush_content(push_content);
				pushVO.setPush_time(push_time);
				pushVO.setNews_id(news_id);
				pushVO.setAd_id(ad_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pushVO", pushVO); // �t����J�榡���~��pushVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/addPush.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				PushService pushSvc = new PushService();
				pushVO = pushSvc.addPush(man_id, push_content, push_time, news_id, ad_id);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/backend/push/listAllPush.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/push/addPush.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllPush.jsp ��  /push/listPush_ByPush_id.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/push/listAllPush.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String push_id = new String(req.getParameter("push_id"));
				
				/***************************2.�}�l�R�����***************************************/
				PushService pushSvc = new PushService();
				PushVO pushVO = pushSvc.getOnePush(push_id);
				pushSvc.deletePush(push_id);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
/*				DeptService deptSvc = new DeptService();
				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno())); // ��Ʈw���X��list����,�s�Jrequest
*/				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
}
