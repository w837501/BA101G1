package com.man.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.man.model.ManagerService;
import com.man.model.ManagerVO;

public class ManServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("Big5");
		String action = req.getParameter("action");
		// 查詢
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("man_id");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("請輸入員工編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				String man_id = null;
				try {
					man_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("輸入格式錯誤");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				ManagerVO managerVO = manSvc.getOneEmp(man_id);
				if (managerVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/ListOneMan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}

		}
		// 修改
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String man_id = new String(req.getParameter("man_id"));
				ManagerService managerSvc = new ManagerService();
				ManagerVO managerVO = managerSvc.getOneEmp(man_id);
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/UpdateMan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMan.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String man_id = new String(req.getParameter("man_id"));

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_pw = req.getParameter("man_pw");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					man_name = req.getParameter("man_name");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					man_phone = req.getParameter("man_phone");
				}
				if (req.getParameter("man_pw") == null || req.getParameter("man_pw").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					man_pw = req.getParameter("man_pw");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					man_mail = req.getParameter("man_mail");
				}

				ManagerVO managerVO = new ManagerVO();
				managerVO.setMan_id(man_id);
				managerVO.setMan_name(man_name);
				managerVO.setMan_phone(man_phone);
				managerVO.setMan_pw(man_pw);
				managerVO.setMan_mail(man_mail);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				managerVO = manSvc.updateMan(man_id, man_name, man_phone, man_pw, man_mail);

				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/ListOneMan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
				failureView.forward(req, res);
			}
		}
		// 新增

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// String man_name="";
				// try{
				// man_name=req.getParameter("man_name").trim();
				// System.out.println("648465654");
				// }catch(Exception e){
				// man_name="";
				// System.out.println("648465654");
				// errorMsgs.add("請輸入名字");
				// }
				// String man_phone="";
				// try{
				// man_phone=new String(req.getParameter("man_phone").trim());
				// }catch (Exception e) {
				// man_phone="";
				// System.out.println("1321312");
				// errorMsgs.add("請輸入電話");
				// }
				// String man_pw=null;
				// try{
				// man_pw=new String(req.getParameter("man_pw").trim());
				// }catch (Exception e) {
				// man_pw="";
				// errorMsgs.add("請輸入密碼");
				// }
				//
				// String man_mail=null;
				// try{
				// man_mail=new String(req.getParameter("man_mail").trim());
				// }catch (Exception e) {
				// man_mail="";
				// errorMsgs.add("請輸入信箱");
				// }

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_pw = req.getParameter("man_pw");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					man_name = req.getParameter("man_name");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					man_phone = req.getParameter("man_phone");
				}
				if (req.getParameter("man_pw") == null || req.getParameter("man_pw").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					man_pw = req.getParameter("man_pw");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					man_mail = req.getParameter("man_mail");
				}

				ManagerVO managerVO = new ManagerVO();
				managerVO.setMan_name(man_name);
				managerVO.setMan_phone(man_phone);
				managerVO.setMan_pw(man_pw);
				managerVO.setMan_mail(man_mail);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/addMan.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				managerVO = manSvc.addMan(man_name, man_phone, man_pw, man_mail);

				String url = "/backend/man/ListAllMan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/addMan.jsp");
				failureView.forward(req, res);
			}

		}
		// 刪除

		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String man_id = new String(req.getParameter("man_id"));

				ManagerService manSvc = new ManagerService();
				manSvc.deleteEmp(man_id);
				String url = "/backend/man/ListAllMan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/ListAllMan.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
