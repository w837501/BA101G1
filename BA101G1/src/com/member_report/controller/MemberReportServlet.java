package com.member_report.controller;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.member_report.model.*;
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

							.getRequestDispatcher("/backend/memr/select_memr.jsp");

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
							.getRequestDispatcher("/backend/memr/select_memr.jsp");

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
							.getRequestDispatcher("/backend/memr/select_memr.jsp");

					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("mrVO", mrVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/memr/select_memr.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/select_memr.jsp");

				failureView.forward(req, res);
			}
		}
		if ("listAll3".equals(action)) {
			System.out.println("bbbbb"+req.getParameter("action"));
//			req.setAttribute("whichPage", "tab1");    // 資料庫取出的set物件,存入request
			
			String url = "/backend/memr/select_memr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
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
				String url = "/backend/memr/select_memr.jsp";

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
				
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
				byte[] mr_image = mrVO.getMr_image();


				java.sql.Timestamp mr_time = null;
				try {
					mr_time = java.sql.Timestamp.valueOf(req.getParameter("mr_time").trim());
				} catch (IllegalArgumentException e) {
					mr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期87!");
				}

				String mr_state = null;
				try {
					mr_state = "已審核";
				} catch (Exception e) {
					errorMsgs.add("請輸入會員檢舉狀態");
				}

				String mr_result = null;
				try {
					mr_result = req.getParameter("mr_result").trim();
					if(mr_state.isEmpty()){
						mr_state = "未審核";
					}
				} catch (Exception e) {
					errorMsgs.add("會員檢舉狀態請填數字01.");
				}


				mrVO.setMr_id(mr_id);
				mrVO.setMem_id(mem_id);
				mrVO.setOrder_id(order_id);
				mrVO.setSc_id(sc_id);
				mrVO.setMan_id(man_id);
				mrVO.setMr_content(mr_content);
				mrVO.setMr_image(mr_image);
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
				

				MemberReportService mrSvc = new MemberReportService();

				mrVO = mrSvc.updateMemberReport(mr_id , mem_id, order_id, sc_id, man_id, mr_content,mr_image,mr_time,mr_state,mr_result);
				


                String url="/backend/memr/select_memr.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/update_mr_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			System.out.println("安安 ");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

		try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/

				String mem_id = req.getParameter("mem_id");
				System.out.println(mem_id);
				String order_id = req.getParameter("order_id");
				System.out.println(order_id);
				String sc_id = req.getParameter("sc_id");
				System.out.println(sc_id);
				String mr_content = req.getParameter("mr_content");
				Part pic = req.getPart("mr_image");
				byte[] mr_image = getPictureByteArrayFromWeb(pic);
			if(order_id==null){
				order_id=null;
			}
			if(sc_id==null){
				sc_id=null;
			}
			if(sc_id==null){
				sc_id=null;
			}
System.out.println("1");
/*******************************************************************************/
				MemberReportVO memberreportVO = new MemberReportVO();
				memberreportVO.setMem_id(mem_id);
				memberreportVO.setOrder_id(order_id);
				memberreportVO.setSc_id(sc_id);
				memberreportVO.setMan_id(mr_content);
				memberreportVO.setMr_image(mr_image);
System.out.println("2");
			
				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberreportVO", memberreportVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/mem/member_addMR.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.println("3");
				System.out.println(mem_id);
				System.out.println(order_id);
				System.out.println(sc_id);
				System.out.println(mr_content);
				System.out.println(mr_image);
				MemberReportService mrSvc = new MemberReportService();
				memberreportVO = mrSvc.addMemberReport(mem_id, order_id, sc_id, mr_content, mr_image);
				System.out.println("4");
				req.setAttribute("memberreportVO", memberreportVO);
				String url = "/frontend/mem/member_report.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/mem/member_addMR.jsp");
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

		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "列出所有會員檢舉");    // 資料庫取出的set物件,存入request
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		if ("listAll3".equals(action)) {
//			req.setAttribute("whichPage", "tab1");    // 資料庫取出的set物件,存入request
			MemberReportService mrSvc = new MemberReportService();
			List<MemberReportVO> mrList = null;
			String whichTab = req.getParameter("whichTab");
			if(whichTab.equals("tab1")){
				mrList = mrSvc.findByMR_state("未審核");
			}
			if(whichTab.equals("tab2")){
				mrList = mrSvc.findByMR_state("審核中");
			}
			if(whichTab.equals("tab3")){
				mrList = mrSvc.findByMR_state("已審核");
			}
			req.setAttribute("list3", mrList);
			System.out.println("whichTab : "+whichTab+" list " + mrList);
			String url = "/backend/memr/select_memr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("readPic".equals(action)) {
//			req.setAttribute("whichPage", "tab1");    // 資料庫取出的set物件,存入request
			/******************************read img*********************************************/
			res.setContentType("image/gif");  // 與27行互相衝突，SL314 P.90頁
			ServletOutputStream out = res.getOutputStream();
			String mr_id = req.getParameter("mr_id");
			req.setCharacterEncoding("UTF-8");
//			String mr_id2 = new String(mr_id.getBytes("ISO-8859-1"),"UTF-8");
			try {
				Connection con = null;
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(
					"SELECT mr_image FROM member_report WHERE mr_id ='" + mr_id + "'" );
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("mr_image"));//欄位
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println(e);
			}
/******************************read img*********************************************/
			String url = "/backend/memr/select_memr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

	}
	public static byte[] getPictureByteArrayFromWeb(Part part) throws IOException {
		InputStream is = part.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = is.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		is.close();
		return baos.toByteArray();
	}
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;

		}
		return filename;
	}
}

