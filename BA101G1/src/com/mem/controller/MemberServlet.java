package com.mem.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemberService;
import com.mem.model.MemberVO;

public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("BIG5");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("mem_id");
				if (str == null || str.trim().isEmpty()) {
					errorMsgs.add("請輸入會員編號");
				}
				String mem_id = null;
				try {
					mem_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("格式錯誤");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}

				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneEmp(mem_id);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("memberVO", memberVO);
				String url = "/backend/mem/ListOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
				failureView.forward(req, res);
			}

		}
	}
}
