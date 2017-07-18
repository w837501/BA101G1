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
	// �i�ˬd�ϥΪ̿�J���b��(account) �K�X(password)�O�_���ġj
	// �i��ڤW���ܸ�Ʈw�j�M���j
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
			errorMsgs_Login.add("�d�L�b��");
			return null;
		} else {
			if (storeVO.getStore_acc().equals(store_acc) && storeVO.getStore_pw().equals(store_pw)) {
				if (storeVO.getStore_state().equals("�f�֤�")) {
					errorMsgs_Login.add("�b���|���f��");
					return null;
				} else {
					return storeVO;
				}
			} else
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
		String store_acc = req.getParameter("store_acc");
		String store_pw = req.getParameter("store_pw");
		System.out.println("requestURL" + requestURL);
		req.setAttribute("errorMsgs_Login", errorMsgs_Login);
		// �i�ˬd�ӱb�� , �K�X�O�_���ġj
		if (allowUser(store_acc, store_pw) != null) { // �i�b�� , �K�X�L�Įɡj

			// �i�b�� , �K�X���Į�, �~���H�U�u�@�j
			System.out.println("���K�X");
			HttpSession session = req.getSession();
			session.setAttribute("storeVO", storeVO); // *�u�@1:
														// �~�bsession�����w�g�n�J�L������
			System.out.println("63" + storeVO);
			System.out.println(storeVO.getStore_id());
			System.out.println(storeVO.getStore_acc());
			System.out.println(storeVO.getStore_pw());
			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					System.out.println("123123");
					session.removeAttribute("location"); // *�u�@2: �ݬݦ��L�ӷ�����
															// (-->�p���ӷ�����:�h���ɦܨӷ�����)
					res.sendRedirect(location);
					return;
				}
			} catch (Exception ignored) {
			}
			System.out.println("456456");
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