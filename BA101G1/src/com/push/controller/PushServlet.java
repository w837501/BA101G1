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
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出單一推播");    // 資料庫取出的set物件,存入request
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("push_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				// Send the use back to the form, if there were errors  errorMsgs不為空值時
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String push_id = null;
				try {
					push_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				PushService pushSvc = new PushService();
				PushVO pushVO = pushSvc.getOnePush(push_id);
				if (pushVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("pushVO", pushVO); // 資料庫取出的pushVO物件,存入req
				String url = "/backend/push/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOnePush.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/push/selectPage.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllPush.jsp 或  /push/listPush_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "修改單一推播");    // 資料庫取出的set物件,存入request
			try {
				/***************************1.接收請求參數****************************************/
				String push_id = new String(req.getParameter("push_id"));
				
				/***************************2.開始查詢資料****************************************/
				PushService pushSvc = new PushService();
				PushVO pushVO = pushSvc.getOnePush(push_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("pushVO", pushVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/push/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_push_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_push_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有推播");    // 資料庫取出的set物件,存入request
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String push_id = new String(req.getParameter("push_id").trim());
				String man_id = req.getParameter("man_id").trim();
				String push_content = req.getParameter("push_content").trim();				
				
				java.sql.Timestamp push_time = null;
				try {
					push_time = java.sql.Timestamp.valueOf(req.getParameter("push_time").trim());
				} catch (IllegalArgumentException e) {
					push_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				String news_id = null;
				try {
					news_id = new String(req.getParameter("news_id").trim());
				} catch (Exception e) {
					news_id = "NEWS-00001";
					errorMsgs.add("請重新輸入news_id.");
				}

				String ad_id = null;
				try {
					ad_id = new String(req.getParameter("ad_id").trim());
				} catch (Exception e) {
					ad_id = "AD-000001";
					errorMsgs.add("請重新輸入ad_id.");
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
					req.setAttribute("pushVO", pushVO); // 含有輸入格式錯誤的pushVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/update_push_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				PushService pushSvc = new PushService();
				pushVO = pushSvc.updatePush(push_id, man_id, push_content, push_time, news_id,ad_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("pushVO", pushVO); // 資料庫update成功後,正確的的pushVO物件,存入req
				String url = "/backend/push/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOnePush.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/push/update_push_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addPush.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String man_id = req.getParameter("man_id").trim();
				String push_content = req.getParameter("push_content").trim();
				
				java.sql.Timestamp push_time = null;
				try {
					push_time = java.sql.Timestamp.valueOf(req.getParameter("push_time").trim());
				} catch (IllegalArgumentException e) {
					push_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String news_id = null;
				try {
					news_id = new String(req.getParameter("news_id").trim());
				} catch (Exception e) {
					news_id = "NEWS-00001";
					errorMsgs.add("請重新輸入news_id..");
				}
				
				String ad_id = null;
				try {
					ad_id = new String(req.getParameter("ad_id").trim());
				} catch (Exception e) {
					ad_id = "AD-000001";
					errorMsgs.add("請重新輸入ad_id..");
				}
				

				PushVO pushVO = new PushVO();
				pushVO.setMan_id(man_id);
				pushVO.setPush_content(push_content);
				pushVO.setPush_time(push_time);
				pushVO.setNews_id(news_id);
				pushVO.setAd_id(ad_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pushVO", pushVO); // 含有輸入格式錯誤的pushVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/push/addPush.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				PushService pushSvc = new PushService();
				pushVO = pushSvc.addPush(man_id, push_content, push_time, news_id, ad_id);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/push/listAllPush.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/push/addPush.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // 來自listAllPush.jsp 或  /push/listPush_ByPush_id.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有推播");    // 資料庫取出的set物件,存入request
			String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑: 可能為【/push/listAllPush.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】
	
			try {
				/***************************1.接收請求參數***************************************/
				String push_id = new String(req.getParameter("push_id"));
				
				/***************************2.開始刪除資料***************************************/
				PushService pushSvc = new PushService();
				PushVO pushVO = pushSvc.getOnePush(push_id);
				pushSvc.deletePush(push_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
/*				DeptService deptSvc = new DeptService();
				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno())); // 資料庫取出的list物件,存入request
*/				
//				String url = requestURL;
				String url = "/backend/push/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "列出所有推播");    // 資料庫取出的set物件,存入request
				String url = "/backend/push/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
	}
}
