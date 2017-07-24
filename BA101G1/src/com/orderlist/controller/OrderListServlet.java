package com.orderlist.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.orderlist.model.OrderlistService;
import com.orderlist.model.OrderlistVO;
import com.product.model.ProductVO;

public class OrderListServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
			System.out.println("action :  "+action);
		if ("getOneOrder_For_DetailDisplay".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String str1 = req.getParameter("order_id");
				String str2 = req.getParameter("pro_id");
				String str3 = req.getParameter("quentity");
				String order_id = req.getParameter("order_id");
System.out.println("orderlist.do : order_id "+str1+" pro_id "+str2+" quentity "+str3);
				OrderlistService orderSvc = new OrderlistService();
				List<OrderlistVO> orderlistVO=new LinkedList<OrderlistVO>();
//				List<ProductVO> productVO=new LinkedList<ProductVO>();
				orderlistVO= orderSvc.getOrderlist(order_id);
//				productVO= orderSvc.getProDetail(str2);

				req.setAttribute("orderlistVO", orderlistVO);
//				req.setAttribute("productVO", productVO);
				
				String url = "/frontend/selectOrder/orderDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				
				errorMsgs.add( e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/selectOrder/listOrderByMem.jsp");
				failureView.forward(req, res);
			}
		}
		

	}
}

