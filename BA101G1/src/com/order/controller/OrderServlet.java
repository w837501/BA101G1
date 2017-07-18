package com.order.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.order.model.Store_OrderService;
import com.order.model.Store_OrderVO;
import com.orderlist.model.OrderlistService;
import com.orderlist.model.OrderlistVO;
import com.product.model.ProductVO;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String str = req.getParameter("mem_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				Store_OrderService orderSvc = new Store_OrderService();
				List<Store_OrderVO> store_orderVO = new LinkedList<Store_OrderVO>();
				store_orderVO = orderSvc.getOrderByMem_id(str);// DAO��k
				// ==================================orderDetail.jsp======================
				// OrderlistService orderlistSvc = new OrderlistService();
				// List<OrderlistVO> orderlistVO=new LinkedList<OrderlistVO>();
				// orderlistVO = orderlistSvc.getAll();
				// =======================================================================
				System.out.println("mem_id:" + str);
				System.out.println(store_orderVO);
				if (store_orderVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 *************/
				req.setAttribute("store_orderVO", store_orderVO); // ��Ʈw���X��empVO����,�s�Jreq
				// req.setAttribute("orderlistVO", orderlistVO);
				String url = "/frontend/mem/member_info_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				System.out.println("successView" + successView);
				// ���\���listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {

				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}

		// insert order and orderlist into db
		if ("setOrder_Into".equals(action)) { // �Ӧ�Checkout.jsp���ШD

			HttpSession session = req.getSession();
			Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
			System.out.println("buylist" + buylist);
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			// String amountStr = (String) req.getAttribute("amount");
			try {
				String mem_id =req.getParameter("mem_id");
				String store_id = req.getParameter("store_id");
				System.out.println("store_id" + store_id);
				String amountStr = req.getParameter("amount").trim();
				System.out.println("amountStr" + amountStr);
				int amount = Integer.parseInt(amountStr);
				System.out.println("amount" + amount);
				String order_way = req.getParameter("order_way");
				String receive_address = req.getParameter("receive_address");
				String order_note = req.getParameter("order_note");
				// int quentity = new Integer(req.getParameter("quentity"));
				// String pro_id = req.getParameter("pro_id");
				System.out.println("store_id" + store_id);
				System.out.println("mem_id" + mem_id);
				System.out.println("amount" + amount);
				System.out.println("order_way" + order_way);
				System.out.println("receive_address" + receive_address);
				System.out.println("order_note" + order_note);
				String order_taketime1 = req.getParameter("order_taketime1").trim();
				String order_taketime2 = req.getParameter("order_taketime2").trim();
				String order_taketime3 = order_taketime1 + " " + order_taketime2 + ":00";
				System.out.println(order_taketime3);
				java.sql.Timestamp order_taketime = null;
				try {
					order_taketime = java.sql.Timestamp.valueOf(order_taketime3);
				} catch (IllegalArgumentException e) {
					order_taketime = new java.sql.Timestamp(System.currentTimeMillis());
				}
				System.out.println("order_taketime" + order_taketime);
				Store_OrderVO orderVO = new Store_OrderVO();
				OrderlistVO orderlistVO = new OrderlistVO();

				orderVO.setMem_id(mem_id);
				orderVO.setStore_id(store_id);
				// orderVO.setTotalprice(amount);
				orderVO.setOrder_way(order_way);
				orderVO.setReceive_address(receive_address);
				orderVO.setOrder_note(order_note);
				orderVO.setOrder_taketime(order_taketime);

				if (!errorMsgs.isEmpty()) {
					System.out.println("?????????1121");
					req.setAttribute("orderVO", orderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					req.setAttribute("orderlistVO", orderlistVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/shoppingcart/Checkout.jsp");
					failureView.forward(req, res);
					return;
				}
				Store_OrderService orderSvc = new Store_OrderService();
				orderVO = orderSvc.addOrder(mem_id, store_id, amount, order_way, receive_address, order_note,
						order_taketime, buylist);//insert order data and buylist
				// req.setAttribute("orderVO", orderVO);
				// req.setAttribute("orderlistVO", orderlistVO);
				session.removeAttribute("shoppingcart");
				session.removeAttribute("amount");
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/shoppingcart/Checkout.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOrder_State".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String state = req.getParameter("order_state");
				String store_id=req.getParameter("store_id");
				if (state.equals("���T�{")) {
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state,store_id);

					if (orderList.isEmpty()) {
						errorMsgs.add("�d�L���");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/frontend/selectOrder/ListOrderState_unconfirm.jsp");
					successView.forward(req, res);

				} else if (state.equals("�w�T�{")) {
					System.out.println("�w�T�{");
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> store_orderVO1 = new LinkedList<Store_OrderVO>();
					store_orderVO1= orderSvc.getOrderByState(state,store_id);
//
//					if (store_orderVO.isEmpty()) {
//						errorMsgs.add("�d�L���");
//						return;
//					}
//
//					if (!errorMsgs.isEmpty()) {
//					System.out.println("??????????????");
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
//						failureView.forward(req, res);
//					}
					System.out.println("12313213");
					req.setAttribute("store_orderVO1", store_orderVO1);
					RequestDispatcher successView = req
							.getRequestDispatcher("/store/store_order_handleing.jsp");
					successView.forward(req, res);
				} else if (state.equals("�ݨ��\")) {
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state,store_id);
//
//					if (orderList.isEmpty()) {
//						errorMsgs.add("�d�L���");
//						return;
//					}
//
//					if (!errorMsgs.isEmpty()) {
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/store/store_order_handleing.jsp");
//						failureView.forward(req, res);
//					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/store/store_order_handleing.jsp");
					successView.forward(req, res);
				} else if (state.equals("�w���\")) {
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state,store_id);

					if (orderList.isEmpty()) {
						errorMsgs.add("�d�L���");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/store/store_order_handleing.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/store/store_order_finish.jsp");
					successView.forward(req, res);
				} else if (state.equals("�w����")) {
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state,store_id);

					if (orderList.isEmpty()) {
						errorMsgs.add("�d�L���");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/frontend/mem/member_info_order.jsp");
					successView.forward(req, res);
				}
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("Confirm_Order".equals(action)) {
			try {
				String order_id = req.getParameter("order_id");

				Store_OrderService store_orderSvc = new Store_OrderService();
				store_orderSvc.confirm_order(order_id, "�w�T�{");

				RequestDispatcher successView = req
						.getRequestDispatcher("/frontend/selectOrder/order.do?action=getOrder_State&order_state=�w�T�{");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("Change_Order_To_Take".equals(action)) {
			try {
				String order_id = req.getParameter("order_id");

				Store_OrderService store_orderSvc = new Store_OrderService();
				store_orderSvc.confirm_order(order_id, "�ݨ��\");

				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=�ݨ��\");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("Change_Order_To_Finish".equals(action)) {
			try {
				String order_id = req.getParameter("order_id");

				Store_OrderService store_orderSvc = new Store_OrderService();
				store_orderSvc.confirm_order(order_id, "�w���\");

				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=�w���\");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("Cancel".equals(action)) {
			try {
				String order_id = req.getParameter("order_id");

				Store_OrderService store_orderSvc = new Store_OrderService();
				store_orderSvc.confirm_order(order_id, "�w����");

				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=�w����");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
