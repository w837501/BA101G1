package com.permission.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.permission.model.PermissionService;
import com.permission.model.PermissionVO;
public class PServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("man_id");
				String man_id = null;
				man_id = new String(str);
				// Send the use back to the form, if there were errors
				/***************************2.�}�l�d�߸��*****************************************/
				PermissionService pSvc = new PermissionService();
				PermissionVO paVO = pSvc.getOneRecord(man_id);
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("paVO", paVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
		}
		


        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String man_id = req.getParameter("man_id").trim();
				String pa_id = req.getParameter("pa_id").trim();
				
				PermissionVO paVO = new PermissionVO();
				paVO.setMan_id(man_id);
				paVO.setPa_id(pa_id);
				
				/***************************2.�}�l�s�W���***************************************/
				PermissionService pSvc = new PermissionService();
				paVO = pSvc.addPermission(man_id, pa_id);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/backend/memr/listAllMR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

				/***************************1.�����ШD�Ѽ�***************************************/
				String man_id = new String(req.getParameter("man_id"));
				
				/***************************2.�}�l�R�����***************************************/
				PermissionService pSvc = new PermissionService();
				PermissionVO pVO = pSvc.getOneRecord(man_id);
				pSvc.deletePermission(man_id);
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
		}
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "�C�X�Ҧ��|�����|");    // ��Ʈw���X��set����,�s�Jrequest
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}

	}
}

