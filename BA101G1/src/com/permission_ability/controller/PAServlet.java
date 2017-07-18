package com.permission_ability.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.member_report.model.MemberReportService;
import com.member_report.model.MemberReportVO;
import com.permission2.model.PermissionDAO;
import com.permission2.model.PermissionService;
import com.permission2.model.PermissionVO;
public class PAServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {


		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("pa_id");
				
				String pa_id = null;
				pa_id = new String(str);
				/***************************2.�}�l�d�߸��*****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(pa_id);
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("mrVO", mrVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
	}
}

