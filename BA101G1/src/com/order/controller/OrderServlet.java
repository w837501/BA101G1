package com.order.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;


import com.order.model.Store_OrderService;
import com.order.model.Store_OrderVO;
import com.orderlist.model.OrderlistService;
import com.orderlist.model.OrderlistVO;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String str = req.getParameter("mem_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				Store_OrderService orderSvc = new Store_OrderService();
				List<Store_OrderVO> store_orderVO = new LinkedList<Store_OrderVO>();
				store_orderVO = orderSvc.getOrderByMem_id(str);// DAO方法
				// ==================================orderDetail.jsp======================
				// OrderlistService orderlistSvc = new OrderlistService();
				// List<OrderlistVO> orderlistVO=new LinkedList<OrderlistVO>();
				// orderlistVO = orderlistSvc.getAll();
				// =======================================================================
				System.out.println("mem_id:" + str);
				System.out.println(store_orderVO);
				if (store_orderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("store_orderVO", store_orderVO); // 資料庫取出的empVO物件,存入req
				// req.setAttribute("orderlistVO", orderlistVO);
				String url = "/frontend/selectOrder/listOrderByMem_id.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				System.out.println("successView" + successView);
				// 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {

				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}

		
		if ("setOrder_Into".equals(action)) { // 來自Checkout.jsp的請求
			
			System.out.println("友維小胖妹");
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try{

				String mem_id = req.getParameter("mem_id");
				String store_id = req.getParameter("store_id");
				int totalprice = new Integer (req.getParameter("totalprice"));
				String order_way = req.getParameter("order_way");
				String receive_address = req.getParameter("receive_address");
				String order_note = req.getParameter("order_note");
				
				java.sql.Timestamp order_taketime = null;
				try {
					order_taketime = java.sql.Timestamp.valueOf(req.getParameter("order_taketime").trim());
				} catch (IllegalArgumentException e) {
					order_taketime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				Store_OrderVO orderVO = new Store_OrderVO();
				orderVO.setMem_id(mem_id);
				orderVO.setStore_id(store_id);
				orderVO.setTotalprice(totalprice);
				orderVO.setOrder_way(order_way);
				orderVO.setReceive_address(receive_address);
				orderVO.setOrder_note(order_note);
				orderVO.setOrder_taketime(order_taketime);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shoppingcart/Checkout.jsp");
					failureView.forward(req, res);
					return;
				}
				
				Store_OrderService orderSvc = new Store_OrderService();
				orderVO = orderSvc.addOrder(new Timestamp(System.currentTimeMillis()), mem_id, store_id,totalprice, order_way, receive_address, null, order_note, order_taketime);
				
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shoppingcart/Checkout.jsp");
				failureView.forward(req, res);
			}
		}
		


		if ("getOrder_State".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String state = req.getParameter("order_state");

				if (state.equals("未確認")) {
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state);

					if (orderList.isEmpty()) {
						errorMsgs.add("查無資料");
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
					
				} else if (state.equals("已確認")) {
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state);

					if (orderList.isEmpty()) {
						errorMsgs.add("查無資料");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/frontend/selectOrder/ListOrderState_confirm.jsp");
					successView.forward(req, res);
				}else if(state.equals("待取餐")){
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state);

					if (orderList.isEmpty()) {
						errorMsgs.add("查無資料");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/frontend/selectOrder/ListOrderState_nottake.jsp");
					successView.forward(req, res);
				}else if(state.equals("已取餐")){
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state);

					if (orderList.isEmpty()) {
						errorMsgs.add("查無資料");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/frontend/selectOrder/ListOrderState_finish.jsp");
					successView.forward(req, res);
				}else if(state.equals("已取消")){
					Store_OrderService orderSvc = new Store_OrderService();
					List<Store_OrderVO> orderList = new LinkedList<Store_OrderVO>();
					orderList = orderSvc.getOrderByState(state);

					if (orderList.isEmpty()) {
						errorMsgs.add("查無資料");
						return;
					}

					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
						failureView.forward(req, res);
					}
					req.setAttribute("orderList", orderList);
					RequestDispatcher successView = req
							.getRequestDispatcher("/frontend/selectOrder/ListOrderState_cancel.jsp");
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
				store_orderSvc.confirm_order(order_id, "已確認");

				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=已確認");
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
				store_orderSvc.confirm_order(order_id, "待取餐");

				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=待取餐");
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
				store_orderSvc.confirm_order(order_id, "已取餐");
				
				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=已取餐");
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
				store_orderSvc.confirm_order(order_id, "已取消");
				
				RequestDispatcher successView = req
						.getRequestDispatcher("order.do?action=getOrder_State&order_state=已取消");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
				failureView.forward(req, res);
			}
		}

		// if ("getOneOrder_For_DetailDisplay".equals(action)) { //
		// 來自select_page.jsp的請求
		//
		// System.out.println("友維小棒棒");
		//
		// List<String> errorMsgs = new LinkedList<String>();
		// // Store this set in the request scope, in case we need to
		// // send the ErrorPage view.
		// req.setAttribute("errorMsgs", errorMsgs);
		//
		// try {
		// /***************************1.接收請求參數 -
		// 輸入格式的錯誤處理**********************/
		// String str = req.getParameter("order_id");
		// /***************************2.開始查詢資料*****************************************/
		// Store_OrderService orderSvc = new Store_OrderService();
		// List<Store_OrderVO> store_orderVO=new LinkedList<Store_OrderVO>();
		// store_orderVO= orderSvc.getOrderByMem_id(str);//DAO方法
		// System.out.println(str);
		// System.out.println(store_orderVO);
		// if (store_orderVO == null) {
		// errorMsgs.add("查無資料");
		// }
		// // Send the use back to the form, if there were errors
		// if (!errorMsgs.isEmpty()) {
		// RequestDispatcher failureView = req
		// .getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
		// failureView.forward(req, res);
		// return;//程式中斷
		// }
		//
		// /***************************3.查詢完成,準備轉交(Send the Success
		// view)*************/
		// req.setAttribute("store_orderVO", store_orderVO); //
		// 資料庫取出的empVO物件,存入req
		//
		// String url = "/frontend/selectOrder/listOrderByMem_id.jsp";
		// RequestDispatcher successView = req.getRequestDispatcher(url); //
		// 成功轉交listOneEmp.jsp
		// successView.forward(req, res);
		//
		// /***************************其他可能的錯誤處理*************************************/
		// } catch (Exception e) {
		//
		// errorMsgs.add("無法取得資料:" + e.getMessage());
		// RequestDispatcher failureView = req
		// .getRequestDispatcher("/frontend/selectOrder/selectOrder.jsp");
		// failureView.forward(req, res);
		// }
		// }

	

	}
}
