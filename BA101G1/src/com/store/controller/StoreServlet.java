package com.store.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.model.StoreService;
import com.store.model.StoreVO;


public class StoreServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
			// 來自index.jsp的請求			       來自store.jsp的請求
		if ("get_store".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("store_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商家關鍵字");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/store.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				StoreService storeSvc = new StoreService();
				List<StoreVO> storelist = storeSvc.getName(str);
				if (storelist == null) {
					errorMsgs.add("查無資料");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/store.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("storelist", storelist); // 資料庫取出的StoreVO物件,存入req
				String url = "/store/store.jsp";
				
				/*
				if ("get_store_a".equals(action))
					url = "/store/listSearchStore.jsp";     // 成功轉交/store/listSearchStore.jsp
				else if ("get_store_b".equals(action))
					url = "/store.jsp";             		// 成功轉交 /store.jsp
				*/
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交store.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store/store.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("get_zone".equals(action)) { // 來自store.jsp的請求

			String str = req.getParameter("store_zone");
			StoreService storeSvc = new StoreService();
			
			List<StoreVO> storelist = storeSvc.getZone(str);
			req.setAttribute("storelist", storelist); // 資料庫取出的storeVO物件,存入req
			
			String url ="/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交store.jsp
			System.out.println(successView);
			successView.forward(req, res);
		} 
		
		if ("getStoreClass".equals(action)) { // 來自storeClass.jsp的請求
			String str = req.getParameter("sc_id");
			StoreService storeSvc = new StoreService();
			
			List<StoreVO> storelist = storeSvc.getStoreClass(str);
			req.setAttribute("storelist", storelist); // 資料庫取出的storeVO物件,存入req
			
			String url ="/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交store.jsp
			System.out.println(successView);
			successView.forward(req, res);
		} 
	}
}
