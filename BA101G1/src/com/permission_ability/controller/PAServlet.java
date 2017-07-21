package com.permission_ability.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.member_report.model.MemberReportService;
import com.member_report.model.MemberReportVO;
import com.news.model.NewsService;
import com.news.model.NewsVO;
import com.permission2.model.PermissionDAO;
import com.permission2.model.PermissionService;
import com.permission2.model.PermissionVO;
import com.permission_ability.model.PermissionAbilityService;
import com.permission_ability.model.Permission_AbilityVO;
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
				PermissionAbilityService paSvc = new PermissionAbilityService();
				Permission_AbilityVO paVO = paSvc.findByPrimaryKey(pa_id);
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("paVO", paVO); // ��Ʈw���X��empVO����,�s�Jreq
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
		
		if("insert".equals(action)){ 
			
			try{
				String pa_id = req.getParameter("pa_id").trim();
				String pa_name = req.getParameter("pa_name").trim();
				
				Permission_AbilityVO paVO = new Permission_AbilityVO();
				paVO.setPa_id(pa_id);
				paVO.setPa_name(pa_name);
				
				PermissionAbilityService paSvc = new PermissionAbilityService();
				paVO = paSvc.addPA(pa_id  , pa_name);
				String url = "/backend/perA/addPA.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);   
				successView.forward(req, res);		
				
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/perA/addPA.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("addPA".equals(action)){ 
			
			try{
				req.setAttribute("whichPage" , "�s�W��@�v���\��");
				String url = "/backend/per/ListAllPer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);   
				successView.forward(req, res);		
				
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/per/ListAllPer.jsp");
				failureView.forward(req, res);
			}
		}
		if("listPA".equals(action)){ 
			
			try{
				req.setAttribute("whichPage" , "�C�X�v���\��");
				String url = "/backend/per/ListAllPer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);   
				successView.forward(req, res);		
				
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/per/ListAllPer.jsp");
				failureView.forward(req, res);
			}
		}
		
	}
}

