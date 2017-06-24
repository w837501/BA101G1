package com.store_report.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store_report.model.StoreReportService;
import com.store_report.model.StoreReportVO;

public class StoreReportServlet extends HttpServlet {


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

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("sr_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商家檢舉編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String sr_id = null;
				try {
					sr_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("商家檢舉編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
				if (srVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("srVO", srVO); // 資料庫取出的srVO物件,存入req
				String url = "/backend/str/listOneSR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneSR.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/str/selectPage.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】		
			
			try {
				/***************************1.接收請求參數****************************************/
				String sr_id = new String(req.getParameter("sr_id"));
				
				/***************************2.開始查詢資料****************************************/
				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("srVO", srVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/str/update_sr_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_sr_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String sr_id = new String(req.getParameter("sr_id").trim());
				String store_id = req.getParameter("mem_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String sr_content = req.getParameter("sr_content").trim();
				byte[] sr_image = req.getParameter("sr_image").trim().getBytes();
				
				java.sql.Timestamp sr_time = null;
				try {
					sr_time = java.sql.Timestamp.valueOf(req.getParameter("sr_time").trim());
				} catch (IllegalArgumentException e) {
					sr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期87!");
				}

				Integer sr_state = null;
				try {
					sr_state = new Integer(req.getParameter("sr_state").trim());
				} catch (NumberFormatException e) {
					sr_state = 0;
					errorMsgs.add("會員檢舉狀態請填數字012.");
				}

				Integer sr_result = null;
				try {
					sr_result = new Integer(req.getParameter("sr_result").trim());
				} catch (NumberFormatException e) {
					sr_result = 0;
					errorMsgs.add("會員檢舉狀態請填數字01.");
				}


				StoreReportVO srVO = new StoreReportVO();
				srVO.setSr_id(sr_id);
				srVO.setStore_id(store_id);
				srVO.setSc_id(sc_id);
				srVO.setOrder_id(order_id);
				srVO.setMan_id(man_id);
				srVO.setSr_content(sr_content);
				srVO.setSr_image(sr_image);
				srVO.setSr_time(sr_time);
				srVO.setSr_state(sr_state);
				srVO.setSr_result(sr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srVO", srVO); // 含有輸入格式錯誤的mrVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/str/update_sr_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				StoreReportService srSvc = new StoreReportService();
				srVO = srSvc.updateStoreReport(sr_id , store_id, sc_id, order_id, man_id, sr_content,sr_image,sr_time,sr_state,sr_result);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				

                String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/str/update_sr_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String store_id = req.getParameter("store_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String order_id = req.getParameter("order_id").trim().equals("null") ? null : req.getParameter("order_id").trim();
//				System.out.println("order_id: " + order_id);
//				System.out.println("order_id == 'null' " + (order_id.trim() == "null"));
				String man_id = req.getParameter("man_id").trim();
				String sr_content = req.getParameter("sr_content").trim();
				byte[] sr_image = req.getParameter("sr_image").trim().getBytes();
				
				java.sql.Timestamp sr_time = null;
				try {
					System.out.println("req.getParameter('sr_time'): " + req.getParameter("sr_time"));
					sr_time = java.sql.Timestamp.valueOf(req.getParameter("sr_time").trim() + " 11:12:13");
					System.out.println("sr_time: " + sr_time);
				} catch (IllegalArgumentException e) {
					sr_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				Integer sr_state = null;
//				try {
					System.out.println("req.getParameter('sr_state'): " + req.getParameter("sr_state"));
					sr_state = new Integer(req.getParameter("sr_state").trim());
					System.out.println("sr_state: " + sr_state);
//				} catch (NumberFormatException e) {
////					sr_state = 0;
//					errorMsgs.add("薪水請填數字.");
//				}
				
				Integer sr_result = 0;
				try {
					System.out.println("req.getParameter('sr_result'): " + req.getParameter("sr_result"));
					sr_result = new Integer(req.getParameter("sr_result").trim());
					System.out.println("sr_result: " + sr_result);
				} catch (NumberFormatException e) {
					sr_result = 0;
					errorMsgs.add("獎金請填數字.");
				}
				
				StoreReportVO srVO = new StoreReportVO();
				srVO.setStore_id(store_id);
				srVO.setSc_id(sc_id);
				srVO.setOrder_id(order_id);
				srVO.setMan_id(man_id);
				srVO.setSr_content(sr_content);
				srVO.setSr_image(sr_image);
				srVO.setSr_time(sr_time);
				srVO.setSr_state(sr_state);
				srVO.setSr_result(sr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srVO", srVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/str/addSR.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				StoreReportService srSvc = new StoreReportService();
				srVO = srSvc.addStoreReport(store_id, sc_id, order_id, man_id, sr_content, sr_image,sr_time,sr_state,sr_result);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/str/listAllSR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/str/addSR.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】

			try {
				/***************************1.接收請求參數***************************************/
				String sr_id = new String(req.getParameter("sr_id"));
				
				/***************************2.開始刪除資料***************************************/
				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
				srSvc.deleteStoreReport(sr_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
//				DeptService deptSvc = new DeptService();
//				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
//					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno())); // 資料庫取出的list物件,存入request
//				
				String url = requestURL;
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
	}

}
