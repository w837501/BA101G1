package com.mem.controller;

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

public class MemberLoginHandler extends HttpServlet {
	// 【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	// 【實際上應至資料庫搜尋比對】
	List<String> errorMsgs_Login = new LinkedList<String>();
	MemberVO memberVO = null;
	
	protected MemberVO allowUser(String mem_mail, String mem_pw) {
		if (!errorMsgs_Login.isEmpty()) {
			errorMsgs_Login.removeAll(errorMsgs_Login);
		}
		MemberService memberSvc = new MemberService();

		 memberVO = memberSvc.getMem_Acc(mem_mail);
		System.out.println(memberVO);
		if (memberVO == null) {
			errorMsgs_Login.add("查無帳號");
			return null;
		} else {
			if (memberVO.getMem_mail().equals(mem_mail) && memberVO.getMem_pw().equals(mem_pw))
				return memberVO;
			else
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
		String mem_mail = req.getParameter("mem_mail");
		String mem_pw = req.getParameter("mem_pw");
		System.out.println("requestURL" + requestURL);
		req.setAttribute("errorMsgs_Login", errorMsgs_Login);
		// 【檢查該帳號 , 密碼是否有效】
		if (allowUser(mem_mail, mem_pw) != null) { // 【帳號 , 密碼無效時】

			// 【帳號 , 密碼有效時, 才做以下工作】
			System.out.println("有密碼");
			HttpSession session = req.getSession();
			session.setAttribute("memberVO", memberVO); // *工作1:
														// 才在session內做已經登入過的標識
			System.out.println("63"+memberVO);
			System.out.println(memberVO.getMem_id());
			System.out.println(memberVO.getMem_mail());
			System.out.println(memberVO.getMem_pw());
			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location"); // *工作2: 看看有無來源網頁
															// (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);
					return;
				}
			} catch (Exception ignored) {
			}

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