package com.orderlist.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.orderlist.model.OrderlistService;
import com.orderlist.model.OrderlistVO;

public class OrderListServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOneOrder_For_DetailDisplay".equals(action)) { // 來自listOrderByMem_id.jsp的請求
			
			System.out.println("友維大棒棒??????????????????");
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str1 = req.getParameter("order_id");
				String str2 = req.getParameter("pro_id");
				String str3 = req.getParameter("quentity");
				System.out.println(str1+" "+str2);
				/***************************2.開始查詢資料*****************************************/
				OrderlistService orderSvc = new OrderlistService();
				List<OrderlistVO> orderlistVO=new LinkedList<OrderlistVO>();
				orderlistVO= orderSvc.getDetailOrder(str1,str2);//DAO方法
				System.out.println("友維大棒棒?????????101020025025200202");
				
			
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("orderlistVO", orderlistVO); // 資料庫取出的empVO物件,存入req
				
				String url = "/frontend/selectOrder/orderDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/selectOrder/listOrderByMem.jsp");
				failureView.forward(req, res);
			}
		}
		

	}
}

