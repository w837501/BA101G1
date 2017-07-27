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
	// �i�ˬd�ϥΪ̿�J���b��(account) �K�X(password)�O�_���ġj
	// �i��ڤW���ܸ�Ʈw�j�M���j
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
			errorMsgs_Login.add("�d�L�b��");
			return null;
		} else {
			if (memberVO.getMem_mail().equals(mem_mail) && memberVO.getMem_pw().equals(mem_pw))
				return memberVO;
			else
				errorMsgs_Login.add("�K�X���~");
			return null;
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=Big5");
		PrintWriter out = res.getWriter();
		String requestURL = req.getParameter("requestURL");
		// �i���o�ϥΪ� �b��(account) �K�X(password)�j
		String mem_mail = req.getParameter("mem_mail");
		String mem_pw = req.getParameter("mem_pw");
		System.out.println("requestURL" + requestURL);
		req.setAttribute("errorMsgs_Login", errorMsgs_Login);
		// �i�ˬd�ӱb�� , �K�X�O�_���ġj
		if (allowUser(mem_mail, mem_pw) != null) { // �i�b�� , �K�X�L�Įɡj

			// �i�b�� , �K�X���Į�, �~���H�U�u�@�j
			System.out.println("���K�X");
			HttpSession session = req.getSession();
			session.setAttribute("memberVO", memberVO); // *�u�@1:
														// �~�bsession�����w�g�n�J�L������
			System.out.println("63"+memberVO);
			System.out.println(memberVO.getMem_id());
			System.out.println(memberVO.getMem_mail());
			System.out.println(memberVO.getMem_pw());
			try {
				String location = (String) session.getAttribute("location");
				System.out.println(location);
				if (location != null) {
					session.removeAttribute("location"); // *�u�@2: �ݬݦ��L�ӷ�����
															// (-->�p���ӷ�����:�h���ɦܨӷ�����)
					res.sendRedirect(req.getContextPath()+"index.jsp");
					return;
				}
			} catch (Exception ignored) {
			}

			res.sendRedirect(req.getContextPath() + "/index.jsp"); // *�u�@3:
																	// (-->�p�L�ӷ�����:�h���ɦ�login_success.jsp)

		} else {
			System.out.println("�L�K�X");
			RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
			failureView.forward(req, res);
			return;
		}
	}
}