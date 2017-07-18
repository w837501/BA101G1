package com.permission_ability.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.member_report.model.MemberReportService;
import com.member_report.model.MemberReportVO;
import com.permission2.model.PermissionDAO;
import com.permission2.model.PermissionService;
import com.permission2.model.PermissionVO;
public class PAServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {


		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("pa_id");
				
				String pa_id = null;
				pa_id = new String(str);
				/***************************2.開始查詢資料*****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(pa_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("mrVO", mrVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
	}
}

