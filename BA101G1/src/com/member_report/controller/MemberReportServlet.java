package com.member_report.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.member_report.model.*;
@WebServlet("/BA101G1/member_report/member_report.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemberReportServlet extends HttpServlet {

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
				String str = req.getParameter("mr_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員檢舉編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String mr_id = null;
				try {
					mr_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員檢舉編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
				if (mrVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/selectPage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("mrVO", mrVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/memr/listOneMR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/selectPage.jsp");
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
				String mr_id = new String(req.getParameter("mr_id"));
				
				/***************************2.開始查詢資料****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("mrVO", mrVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/memr/update_mr_input.jsp";
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
		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mr_id = new String(req.getParameter("mr_id").trim());
				String mem_id = req.getParameter("mem_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String mr_content = req.getParameter("mr_content").trim();
				byte[] mr_image = req.getParameter("mr_image").trim().getBytes();
				
				java.sql.Timestamp mr_time = null;
				try {
					mr_time = java.sql.Timestamp.valueOf(req.getParameter("mr_time").trim());
				} catch (IllegalArgumentException e) {
					mr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期87!");
				}

				String mr_state = null;
				try {
					mr_state = req.getParameter("mr_state").trim();
				} catch (Exception e) {
					errorMsgs.add("請輸入會員檢舉狀態");
				}

				String mr_result = null;
				try {
					mr_result = req.getParameter("mr_result").trim();
				} catch (Exception e) {
					errorMsgs.add("會員檢舉狀態請填數字01.");
				}


				MemberReportVO mrVO = new MemberReportVO();
				mrVO.setMr_id(mr_id);
				mrVO.setMem_id(mem_id);
				mrVO.setOrder_id(order_id);
				mrVO.setSc_id(sc_id);
				mrVO.setMan_id(man_id);
				mrVO.setMr_content(mr_content);
				mrVO.setMr_image(null);
				mrVO.setMr_time(mr_time);
				mrVO.setMr_state(mr_state);
				mrVO.setMr_result(mr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mrVO", mrVO); // 含有輸入格式錯誤的mrVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/update_mr_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				MemberReportService mrSvc = new MemberReportService();
				mrVO = mrSvc.updateMemberReport(mr_id , mem_id, order_id, sc_id, man_id, mr_content,mr_image,mr_time,mr_state,mr_result);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				

                String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/update_mr_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String mem_id = req.getParameter("mem_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String mr_content = req.getParameter("mr_content").trim();
//				byte[] mr_image = req.getParameter("mr_image").trim().getBytes();
/*******************************************************************************/
				Part addPic = req.getPart("mr_image");
//				InputStream in = addPic.getInputStream();
				InputStream in = new InputStream(addPic);
				ByteArrayOutputStream baos =  new ByteArrayOutputStream();
				byte[] mr_image = new byte[8 * 1024];
				int i;
				while((i = in.read(mr_image)) != -1){
					baos.write(mr_image, 0, i);
				}
				baos.close();
				in.close();

/*******************************************************************************/
				java.sql.Timestamp mr_time = null;
				try {
					 mr_time = java.sql.Timestamp.valueOf(req.getParameter("mr_time").trim());
				} catch (IllegalArgumentException e) {
					mr_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				
				String mr_state = null;
				try {
					mr_state =req.getParameter("mr_state").trim();
				} catch (Exception e) {
					errorMsgs.add("第238行.");
				}
				
				String mr_result = null;
				try {
					mr_result = req.getParameter("mr_result").trim();
				} catch (Exception e) {
				
					errorMsgs.add("第250行.");
				}
				
				MemberReportVO mrVO = new MemberReportVO();
				mrVO.setMem_id(mem_id);
				mrVO.setOrder_id(order_id);
				mrVO.setSc_id(sc_id);
				mrVO.setMan_id(man_id);
				mrVO.setMan_id(mr_content);
				mrVO.setMr_image(mr_image);
				mrVO.setMr_time(mr_time);
				mrVO.setMr_state(mr_state);
				mrVO.setMr_result(mr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mrVO", mrVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/addMR.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MemberReportService mrSvc = new MemberReportService();
				mrVO = mrSvc.addMemberReport(mem_id, order_id, sc_id, man_id, mr_content, mr_image,mr_time,mr_state,mr_result);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/memr/listAllMR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage()+"第280行");
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/backend/memr/addMR.jsp");
//				failureView.forward(req, res);
//			}
		}
		
       
		if ("delete".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】

			try {
				/***************************1.接收請求參數***************************************/
				String mr_id = new String(req.getParameter("mr_id"));
				
				/***************************2.開始刪除資料***************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
				mrSvc.deleteMemberReport(mr_id);
				
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
	public static void encodingPic(){
	}

}

