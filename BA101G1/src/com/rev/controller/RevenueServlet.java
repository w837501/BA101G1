package com.rev.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rev.model.RevenueService;
import com.rev.model.RevenueVO;

public class RevenueServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getStore_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = req.getParameter("store_id");
				if (store_id == null || store_id.trim().isEmpty()) {
					errorMsgs.add("請輸入店家編號");
				}

				System.out.println("store_id1 : " + store_id);
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc = new RevenueService();
				List<RevenueVO> list = new LinkedList<RevenueVO>();
				list = revSvc.getByStore(store_id);
				if (list == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("list", list);
				for (RevenueVO aaa : list) {
					System.out.println("STORE_ID : " + aaa.getStore_id());
				}
				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料 : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
		}

		if ("getMonth_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String revenue_month = req.getParameter("revenue_month");
				if (revenue_month == null || revenue_month.trim().isEmpty()) {
					errorMsgs.add("請輸入月份");
				}

				System.out.println("revenue_month : " + revenue_month);
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc = new RevenueService();
				List<RevenueVO> list = new LinkedList<RevenueVO>();
				list = revSvc.getByMonth(revenue_month);
				if (list.size() == 0) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("list", list);

				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料 : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Display".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String revenue_month=req.getParameter("revenue_month");
				String store_id=req.getParameter("store_id");
				
				if(revenue_month==null||revenue_month.trim().isEmpty()){
					errorMsgs.add("請輸入月份");
				}
				if(store_id==null||store_id.trim().isEmpty()){
					errorMsgs.add("請輸入商家編號");
				}
				
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				
				RevenueService revSvc=new RevenueService();
				List<RevenueVO> list=new LinkedList<RevenueVO>();
				list.add(revSvc.getOneRev(store_id, revenue_month));
				
				if(list.size()==0){
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("list", list);
				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料 : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
			
		}
	}
}
