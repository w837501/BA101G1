package com.permission.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.permission.model.PermissionService;
import com.permission.model.PermissionVO;
public class PServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("man_id");
				String man_id = null;
				man_id = new String(str);
				// Send the use back to the form, if there were errors
				/***************************2.開始查詢資料*****************************************/
				PermissionService pSvc = new PermissionService();
				PermissionVO paVO = pSvc.getOneRecord(man_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("paVO", paVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
		}
		


        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String man_id = req.getParameter("man_id").trim();
				String pa_id = req.getParameter("pa_id").trim();
				
				PermissionVO paVO = new PermissionVO();
				paVO.setMan_id(man_id);
				paVO.setPa_id(pa_id);
				
				/***************************2.開始新增資料***************************************/
				PermissionService pSvc = new PermissionService();
				paVO = pSvc.addPermission(man_id, pa_id);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/memr/listAllMR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
		}
		
       
		if ("delete".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp的請求

				/***************************1.接收請求參數***************************************/
				String man_id = new String(req.getParameter("man_id"));
				
				/***************************2.開始刪除資料***************************************/
				PermissionService pSvc = new PermissionService();
				PermissionVO pVO = pSvc.getOneRecord(man_id);
				pSvc.deletePermission(man_id);
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
		}
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "列出所有會員檢舉");    // 資料庫取出的set物件,存入request
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}

	}
}

