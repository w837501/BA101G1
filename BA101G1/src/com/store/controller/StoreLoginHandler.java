package com.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemberService;
import com.mem.model.MemberVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;

public class StoreLoginHandler extends HttpServlet {
	// 【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	// 【實際上應至資料庫搜尋比對】
	List<String> errorMsgs_Login = new LinkedList<String>();
	StoreVO storeVO = null;

	protected StoreVO allowUser(String store_acc, String store_pw) {
		if (!errorMsgs_Login.isEmpty()) {
			errorMsgs_Login.removeAll(errorMsgs_Login);
		}
		StoreService storeSvc = new StoreService();

		storeVO = storeSvc.getOneStoreByAcc(store_acc);
		System.out.println(storeVO);
		if (storeVO == null) {
			errorMsgs_Login.add("查無帳號");
			return null;
		} else {
			if (storeVO.getStore_acc().equals(store_acc) && storeVO.getStore_pw().equals(store_pw)) {
				if (storeVO.getStore_state().equals("審核中")) {
					errorMsgs_Login.add("帳號尚未審核");
					return null;
				} else {
					return storeVO;
				}
			} else
				errorMsgs_Login.add("密碼錯誤");
			return null;
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=Big5");
		PrintWriter out = res.getWriter();
		String requestURL = req.getParameter("requestURL");
		// 【取得使用者 帳號(account) 密碼(password)】
		String store_acc = req.getParameter("store_acc");
		String store_pw = req.getParameter("store_pw");
		System.out.println("requestURL" + requestURL);
		req.setAttribute("errorMsgs_Login", errorMsgs_Login);
		// 【檢查該帳號 , 密碼是否有效】
		if (allowUser(store_acc, store_pw) != null) { // 【帳號 , 密碼無效時】

			// 【帳號 , 密碼有效時, 才做以下工作】
			System.out.println("有密碼");
			HttpSession session = req.getSession();
			session.setAttribute("storeVO", storeVO); // *工作1:
														// 才在session內做已經登入過的標識
			System.out.println("63" + storeVO);
			System.out.println(storeVO.getStore_id());
			System.out.println(storeVO.getStore_acc());
			System.out.println(storeVO.getStore_pw());
			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					System.out.println("123123");
					session.removeAttribute("location"); // *工作2: 看看有無來源網頁
															// (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(req.getContextPath()+"index.jsp");
					return;
				}
			} catch (Exception ignored) {
			}
			System.out.println("456456");
			res.sendRedirect(req.getContextPath() + "/index.jsp"); // *工作3:
																	// (-->如無來源網頁:則重導至login_success.jsp)

		} else {
			System.out.println("無密碼");
			RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
			failureView.forward(req, res);
			return;
		}
	}
}