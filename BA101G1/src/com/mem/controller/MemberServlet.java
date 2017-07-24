package com.mem.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.man.model.ManagerService;
import com.mem.model.MemberService;
import com.mem.model.MemberVO;
import com.tools.MailService;

public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("!!!!!!!!!!!!!!!!!!!");
			try {
				String mem_id = req.getParameter("mem_id");
				if (mem_id == null || mem_id.trim().isEmpty()) {
					errorMsgs.add("請輸入會員編號");
				}
				System.out.println("mem_id" + mem_id);
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMem(mem_id);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
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
		// 修改
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String mem_id = new String(req.getParameter("mem_id"));
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(mem_id);
				System.out.println("mem_id1:" + mem_id);
				req.setAttribute("memberVO", memberVO);

				String url = "/backend/mem/Update_mem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String mem_id = req.getParameter("mem_id");

				String mem_name = req.getParameter("mem_name");
				String mem_phone = req.getParameter("mem_phone");
				String mem_pw = req.getParameter("mem_pw");
				String mem_mail = req.getParameter("mem_mail");

				if (mem_name == null || mem_name.trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					mem_name = req.getParameter("mem_name");
				}
				if (mem_phone == null || mem_phone.trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					mem_phone = req.getParameter("mem_phone");
				}
				if (mem_pw == null || mem_pw.trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					mem_pw = req.getParameter("mem_pw");
				}
				if (mem_mail == null || mem_mail.trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					mem_mail = req.getParameter("mem_mail");
				}

				MemberVO memberVO = new MemberVO();
				memberVO.setMem_id(mem_id);
				memberVO.setMem_name(mem_name);
				memberVO.setMem_phone(mem_phone);
				memberVO.setMem_pw(mem_pw);
				memberVO.setMem_mail(mem_mail);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/Update_mem.jsp");
					failureView.forward(req, res);
					return;
				}

				MemberService memberSvc = new MemberService();
				System.out.println("mem_id00" + mem_id);
				memberVO = memberSvc.updateMem(mem_id, mem_name, mem_phone, mem_pw, mem_mail);

				req.setAttribute("memberVO", memberVO);
				session.removeAttribute("memberVO");
				session.setAttribute("memberVO", memberVO);
				String url = "/frontend/mem/member_info.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/Update_mem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			System.out.println(requestURL);
			try {
				String mem_name = req.getParameter("mem_name");
				String mem_phone = req.getParameter("mem_phone");
				String mem_pw = req.getParameter("mem_pw");
				String mem_pw1 = req.getParameter("mem_pw1");
				String mem_mail = req.getParameter("mem_mail");
				String tab = req.getParameter("tab");

				if (req.getParameter("mem_name") == null || req.getParameter("mem_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					mem_name = req.getParameter("mem_name");
				}
				if (req.getParameter("mem_phone") == null || req.getParameter("mem_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					mem_phone = req.getParameter("mem_phone");
				}

				if (req.getParameter("mem_pw") == null || req.getParameter("mem_pw").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					mem_pw = req.getParameter("mem_pw");
				}
				if (req.getParameter("mem_pw1") == null || req.getParameter("mem_pw1").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					mem_pw1 = req.getParameter("mem_pw1");
				}
				if (req.getParameter("mem_mail") == null || req.getParameter("mem_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					mem_mail = req.getParameter("mem_mail");
				}
				if (!mem_pw.equals(mem_pw1)) {
					errorMsgs.add("密碼不相符");
				}
				MemberService memberSvc = new MemberService();
				List<MemberVO> all = memberSvc.getAll();
				for (MemberVO a : all) {
					if (a.getMem_mail().equals(mem_mail)) {
						errorMsgs.add("信箱已有註冊");
					}
				}

				MemberVO memberVO = new MemberVO();
				memberVO.setMem_name(mem_name);
				memberVO.setMem_phone(mem_phone);
				memberVO.setMem_pw(mem_pw);
				memberVO.setMem_mail(mem_mail);

				if (!errorMsgs.isEmpty()) {
					session.setAttribute("errorMsgs", errorMsgs);
					session.setAttribute("memberVO", memberVO);
					// String tab=URLEncoder.encode("#tab2","UTF-8");
					// System.out.println(tab);
					// String url = requestURL+ tab;
					// System.out.println(url);
					// String taburl=URLDecoder.decode(url,"UTF-8");
					// req.setAttribute("selectedTabInput", "#tab2");
					// RequestDispatcher
					// failureView=req.getRequestDispatcher(requestURL);
					// failureView.forward(req, res);
					res.sendRedirect("/BA101G1" + requestURL + "#tab2");
					return;
				}

				memberVO = memberSvc.addMem(mem_name, mem_phone, mem_pw, mem_mail);

				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				// String tab=URLEncoder.encode("#tab2","UT F-8");
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String mem_id = new String(req.getParameter("mem_id"));

				MemberService memSvc = new MemberService();
				memSvc.deleteMem(mem_id);
				String url = "/backend/mem/ListAllMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/ListAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		if ("logout".equals(action)) {

			session.removeAttribute("memberVO");
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
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		}

		if ("updateMemberState".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL=req.getParameter("requestURL");
			try {

				String mem_id = req.getParameter("mem_id");
				String mem_state = req.getParameter("mem_state");
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_id(mem_id);
				memberVO.setMem_state(mem_state);

				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.updateMemberState(mem_state, mem_id);
				// ==============寄MAIL

				if (req.getParameter("mem_state").equals("未認證")) {
					MailService mailSvc = new MailService();
					mailSvc.sendMail(req.getParameter("mem_mail"), "很抱歉您未通過認證", "aaaaaaaa");

				} else if (req.getParameter("mem_state").equals("已認證")) {
					MailService mailSvc = new MailService();
					mailSvc.sendMail(req.getParameter("mem_mail"), "恭喜您已通過認證", "bbbbbbbbb");

				} else {
					MailService mailSvc = new MailService();
					mailSvc.sendMail(req.getParameter("mem_mail"), "停權中", "ccccccccccccc");
				}
				// ==============
				req.setAttribute("memberVO", memberVO);
				String url = "/backend/member/select_mem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/select_mem.jsp");
				failureView.forward(req, res);
			}
		}
	}

}