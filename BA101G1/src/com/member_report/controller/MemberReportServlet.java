package com.member_report.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.member_report.model.*;

public class MemberReportServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");

		    // 來自select_page.jsp的請求                                  // 來自 dept/listAllDept.jsp的請求
		if ("listEmps_ByDeptno_A".equals(action) || "listEmps_ByDeptno_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer deptno = new Integer(req.getParameter("deptno"));

				/*************************** 2.開始查詢資料 ****************************************/
				DeptService deptSvc = new DeptService();
				Set<EmpVO> set = deptSvc.getEmpsByDeptno(deptno);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("listEmps_ByDeptno", set);    // 資料庫取出的set物件,存入request

				String url = null;
				if ("listEmps_ByDeptno_A".equals(action))
					url = "/dept/listEmps_ByDeptno.jsp";        // 成功轉交 dept/listEmps_ByDeptno.jsp
				else if ("listEmps_ByDeptno_B".equals(action))
					url = "/dept/listAllDept.jsp";              // 成功轉交 dept/listAllDept.jsp

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		
		if ("delete_Dept".equals(action)) { // 來自/dept/listAllDept.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer deptno = new Integer(req.getParameter("deptno"));
				
				/***************************2.開始刪除資料***************************************/
				DeptService deptSvc = new DeptService();
				deptSvc.deleteDept(deptno);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				String url = "/dept/listAllDept.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後, 成功轉交 回到 /dept/listAllDept.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理***********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/dept/listAllDept.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
