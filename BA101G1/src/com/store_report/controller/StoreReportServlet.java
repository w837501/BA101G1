package com.store_report.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.member_report.model.MemberReportService;
import com.member_report.model.MemberReportVO;
import com.store_report.model.StoreReportService;
import com.store_report.model.StoreReportVO;

public class StoreReportServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session=req.getSession();
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出單一商家檢舉");    // 資料庫取出的set物件,存入request
			try {
			
				String str = req.getParameter("sr_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入檢舉編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;
				}

				String sr_id = null;
				try {
					sr_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;
				}

				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
				if (srVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("srVO", srVO); 
				String url = "/backend/str/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "修改單一商家檢舉");    // 資料庫取出的set物件,存入request
			String requestURL = req.getParameter("requestURL"); 

			try {
				String sr_id = new String(req.getParameter("sr_id"));

				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);

				req.setAttribute("srVO", srVO); 
				String url = "/backend/str/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add( e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有商家檢舉");    // 資料庫取出的set物件,存入request
			String requestURL = req.getParameter("requestURL"); 

			try {
				String sr_id = new String(req.getParameter("sr_id").trim());
				String store_id = req.getParameter("mem_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String sr_content = req.getParameter("sr_content").trim();
				byte[] sr_image = req.getParameter("sr_image").trim().getBytes();

				java.sql.Timestamp sr_time = null;
				try {
					sr_time = java.sql.Timestamp.valueOf(req.getParameter("sr_time").trim());
				} catch (IllegalArgumentException e) {
					sr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("輸入錯誤");
				}

				String sr_state = null;
				try {
					sr_state = req.getParameter("sr_state").trim();
				} catch (Exception e) {
					errorMsgs.add("請輸入狀態");

				}

				String sr_result = null;
				try {
					sr_result = req.getParameter("sr_result").trim();
				} catch (Exception e) {
					errorMsgs.add("請輸入結果");
				}

				StoreReportVO srVO = new StoreReportVO();
				srVO.setSr_id(sr_id);
				srVO.setStore_id(store_id);
				srVO.setSc_id(sc_id);
				srVO.setOrder_id(order_id);
				srVO.setMan_id(man_id);
				srVO.setSr_content(sr_content);
				srVO.setSr_image(sr_image);
				srVO.setSr_time(sr_time);
				srVO.setSr_state(sr_state);
				srVO.setSr_result(sr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srVO", srVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/update_sr_input.jsp");
					failureView.forward(req, res);
					return; 
				}

				StoreReportService srSvc = new StoreReportService();
				srVO = srSvc.updateStoreReport(sr_id, store_id, sc_id, order_id, man_id, sr_content, sr_image, sr_time,
						sr_state, sr_result);


//				String url = requestURL;
				String url="/backend/str/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add( e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/update_sr_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = req.getParameter("store_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String order_id = req.getParameter("order_id").trim().equals("null") ? null
						: req.getParameter("order_id").trim();
				// System.out.println("order_id: " + order_id);
				// System.out.println("order_id == 'null' " + (order_id.trim()
				// == "null"));
				String man_id = req.getParameter("man_id").trim();
				String sr_content = req.getParameter("sr_content").trim();
				byte[] sr_image = req.getParameter("sr_image").trim().getBytes();

				java.sql.Timestamp sr_time = null;
				try {
					System.out.println("req.getParameter('sr_time'): " + req.getParameter("sr_time"));
					sr_time = java.sql.Timestamp.valueOf(req.getParameter("sr_time").trim() + " 11:12:13");
					System.out.println("sr_time: " + sr_time);
				} catch (IllegalArgumentException e) {
					sr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("格式不正確");
				}

				String sr_state = null;
				try {
					System.out.println("req.getParameter('sr_state'): " + req.getParameter("sr_state"));
					sr_state = req.getParameter("sr_state").trim();
					System.out.println("sr_state: " + sr_state);
				} catch (Exception e) {
					errorMsgs.add("請輸入狀態");
				}

				String sr_result = null;
				try {
					System.out.println("req.getParameter('sr_result'): " + req.getParameter("sr_result"));
					sr_result =req.getParameter("sr_result").trim();
					System.out.println("sr_result: " + sr_result);
				} catch (Exception e) {
					errorMsgs.add("請輸入結果");
				}

				StoreReportVO srVO = new StoreReportVO();
				srVO.setStore_id(store_id);
				srVO.setSc_id(sc_id);
				srVO.setOrder_id(order_id);
				srVO.setMan_id(man_id);
				srVO.setSr_content(sr_content);
				srVO.setSr_image(sr_image);
				srVO.setSr_time(sr_time);
				srVO.setSr_state(sr_state);
				srVO.setSr_result(sr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srVO", srVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/addSR.jsp");
					failureView.forward(req, res);
					return;
				}

				StoreReportService srSvc = new StoreReportService();
				srVO = srSvc.addStoreReport(store_id, sc_id, order_id, man_id, sr_content, sr_image, sr_time, sr_state,
						sr_result);

				String url = "/backend/str/listAllSR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/addSR.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有商家檢舉");    // 資料庫取出的set物件,存入request
			String requestURL = req.getParameter("requestURL"); 

			try {
				String sr_id = new String(req.getParameter("sr_id"));

				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
				srSvc.deleteStoreReport(sr_id);
				// DeptService deptSvc = new DeptService();
				// if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") ||
				// requestURL.equals("/dept/listAllDept.jsp"))
				// req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno()));
				//
//				String url = requestURL;
				String url = "/backend/str/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "列出所有商家檢舉");    // 資料庫取出的set物件,存入request
				String url = "/backend/str/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		if ("listAll3".equals(action)) {
			StoreReportService srSvc = new StoreReportService();
			List<StoreReportVO> srList = null;
			String whichTab = req.getParameter("whichTab");
			if(whichTab.equals("tab1")){
				srList = srSvc.findBySR_state("未審核");
			}
			if(whichTab.equals("tab2")){
				srList = srSvc.findBySR_state("審核中");
			}
			if(whichTab.equals("tab3")){
				srList = srSvc.findBySR_state("已審核");
			}
			req.setAttribute("list4", srList);
			System.out.println("whichTab : "+whichTab+" list " + srList);
			String url = "/backend/str/select_str.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}

}
