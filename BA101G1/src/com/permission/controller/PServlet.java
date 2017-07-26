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
			String iswhich = req.getParameter("iswhich");
			if("drop".equals(iswhich)){
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("man_id");
				String man_id = null;
				man_id = new String(str);
				// Send the use back to the form, if there were errors
				/***************************2.開始查詢資料*****************************************/
				PermissionService pSvc = new PermissionService();
				List<PermissionVO> listPerVO = pSvc.getOneRecord(man_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("listPerVO", listPerVO); // 資料庫取出的empVO物件,存入req
				req.setAttribute("whichPage", "列出單一權限功能"); // 資料庫取出的empVO物件,存入req
				req.setAttribute("user", man_id); // 資料庫取出的empVO物件,存入req
				String url = "/backend/per/ListAllPer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			}
			if("add".equals(iswhich)){
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String man_id = req.getParameter("man_id");
				// Send the use back to the form, if there were errors
				/***************************2.開始查詢資料*****************************************/
				PermissionService pSvc = new PermissionService();
				List<PermissionVO> listPerVO = pSvc.getOneRecord(man_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("listPerVO", listPerVO); // 資料庫取出的empVO物件,存入req
				req.setAttribute("whichPage", "新增單一管理員權限"); // 資料庫取出的empVO物件,存入req
				req.setAttribute("man_id", man_id); // 資料庫取出的empVO物件,存入req
				String url = "/backend/per/ListAllPer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			}

		}
		


        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
	        	String[] per = req.getParameterValues("per");
	        	System.out.println("AAAAAAAAAAA "+per.length);
	        	String man_id = req.getParameter("man_id").trim();
	        	
//				String pa_id = req.getParameter("pa_id").trim();
//				System.out.println("man_id "+man_id+" pa_id "+pa_id);
			try{
//				PermissionService pSvc = new PermissionService();
//
				for(String a : per){
					PermissionService pSvc = new PermissionService();
					pSvc.addPermission(man_id, a);
				}
//				
//				
//				PermissionVO paVO = new PermissionVO();
//				paVO.setMan_id(man_id);
//				paVO.setPa_id(pa_id);
//				
//				/***************************2.開始新增資料***************************************/
////				PermissionService pSvc = new PermissionService();
//				paVO = pSvc.addPermission(man_id, pa_id);
//				
//				/*************************** new Session for permission ***********/
//				List<PermissionVO> permList = null;
//				permList = pSvc.findByManId(man_id);
//				System.out.println(permList.toString());
//				HttpSession sessionId = req.getSession();
//				sessionId.setAttribute("permList", permList);
				/*************************** new Session for permission ***********/
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/per/ListAllPer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				}catch(Exception e){
					String url = "/backend/per/ListAllPer.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);
				}
			
		}
		
       
		if ("delete".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp的請求

				/***************************1.接收請求參數***************************************/
				String man_id = new String(req.getParameter("man_id"));
				String pa_id = new String(req.getParameter("pa_id"));
				System.out.println("man_id "+man_id+" pa_id "+pa_id);
				/***************************2.開始刪除資料***************************************/
				try{
				PermissionService pSvc = new PermissionService();
				pSvc.deletePermission(man_id , pa_id);
				
				/*************************** new Session for permission ***********/
				List<PermissionVO> permList = null;
				permList = pSvc.findByManId(man_id);
				System.out.println(permList.toString());
				HttpSession sessionId = req.getSession();
				sessionId.setAttribute("permList", permList);
				/*************************** new Session for permission ***********/
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				String url = "/backend/per/ListAllPer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				/***************************其他可能的錯誤處理**********************************/
				}catch(Exception e){
					String url = "/backend/per/ListAllPer.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);
				}
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

