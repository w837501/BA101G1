package com.store.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		if ("get_store_a".equals(action) || "get_store_b".equals(action)) { 
			System.out.println("我有進來判斷");
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
				System.out.println("str"+str);
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
			String sc_id = req.getParameter("sc_id");
			System.out.println(sc_id);
			
			String str = req.getParameter("sc_id");
			StoreService storeSvc = new StoreService();
			
			List<StoreVO> storelist = storeSvc.getZone(str);
			
			req.setAttribute("storelist", storelist); // 資料庫取出的storeVO物件,存入req
			
			String url ="/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交store.jsp
			System.out.println(successView);
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
				String store_id = new String(req.getParameter("store_id"));
				
				/***************************2.開始查詢資料****************************************/
				StoreService storeSvc = new StoreService();
				StoreVO storeVO = storeSvc.getOneStore(store_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("storeVO", storeVO); // 資料庫取出的empVO物件,存入req
				System.out.println("storeVO="+storeVO);
				String url = "/backend/store/update_store_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				// 成功轉交update_emp_input.jsp
				
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
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】 或 【 /emp/listEmps_ByCompositeQuery.jsp】
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String store_id = new String(req.getParameter("store_id").trim());
				String store_name = req.getParameter("store_name").trim();
				String store_addr = req.getParameter("store_addr").trim();				
System.out.println(store_id);
System.out.println(store_name);
System.out.println(store_addr);
				String store_phone = null;
				try {
					store_phone = new String(req.getParameter("store_phone").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("電話請填數字.");
				}
				
				System.out.println(store_phone);
				String store_state = req.getParameter("store_state");
				
				StoreVO storeVO = new StoreVO();
				storeVO.setStore_id(store_id);
				storeVO.setStore_name(store_name);
				storeVO.setStore_addr(store_addr);
				storeVO.setStore_phone(store_phone);
				storeVO.setStore_state(store_state);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("storeVO", storeVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/store/update_store_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				StoreService storeSvc = new StoreService();
				storeVO = storeSvc.updateStore2(store_phone,store_addr,store_name,  store_state,store_id);
				System.out.println("XXXXXXXXXXXX");
				/***************************3.修改完成,準備轉交(Send the Success view)*************/								
				
                
				String url ="/backend/store/ListAllStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/store/update_store_input.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
