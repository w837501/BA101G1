package com.store_class.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.store.model.StoreVO;
import com.store_class.model.*;


public class StoreClassServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getAll".equals(action)){
			StoreClassDAO scDAO = new StoreClassDAO();
			List<StoreClassVO> storeclasslistVO = scDAO.getAll();
			
			HttpSession session = req.getSession();
			session.setAttribute("storeclasslistVO", storeclasslistVO);
			//String url = "/store/store.jsp";
		}
		
		if("listStores_ByStoreClassFormStoreIndex".equals(action) || "listStores_ByStoreClassFormListAllStoreClass".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
//1.接收請求參數	
				Integer sc_id = new Integer(req.getParameter("sc_id"));
//2.開始查詢資料
				StoreClassService scsSvc = new StoreClassService();
				Set<StoreVO> set = scsSvc.getStoresBySc_id(sc_id);
//3.查詢完成,準備轉交
				req.setAttribute("listStores_ByStoreClass", set);
				String url = null;
				if("listStores_ByStoreClassFormStoreIndex".equals(action))
					url = "/backend/store_class/listStores_ByScId.jsp";
				else if("listStores_ByStoreClassFormListAllStoreClass".equals(action))
					url = "/backend/store_class/listAllStoreClass.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//其他可能的錯誤處理
			}catch(Exception e){
				throw new ServletException(e);
			}
		}
	}
}