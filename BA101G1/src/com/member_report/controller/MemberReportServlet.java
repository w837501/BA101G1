package com.member_report.controller;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.util.Base64;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.member_report.model.*;
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemberReportServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("aaaaaaa"+action);
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("mr_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|�����|�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/selectPage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				String mr_id = null;
				try {
					mr_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�|�����|�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/selectPage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
				if (mrVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/selectPage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("mrVO", mrVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/memr/listOneMR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/selectPage.jsp");
				failureView.forward(req, res);
			}
		}
		if ("listAll3".equals(action)) {
			System.out.println("bbbbb"+req.getParameter("action"));
//			req.setAttribute("whichPage", "tab1");    // ��Ʈw���X��set����,�s�Jrequest
			
			String url = "/backend/memr/select_memr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String mr_id = new String(req.getParameter("mr_id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("mrVO", mrVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/memr/update_mr_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƨ��X�ɥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String mr_id = new String(req.getParameter("mr_id").trim());
				String mem_id = req.getParameter("mem_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String mr_content = req.getParameter("mr_content").trim();
				byte[] mr_image = req.getParameter("mr_image").trim().getBytes();
				
				java.sql.Timestamp mr_time = null;
				try {
					mr_time = java.sql.Timestamp.valueOf(req.getParameter("mr_time").trim());
				} catch (IllegalArgumentException e) {
					mr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���87!");
				}

				String mr_state = null;
				try {
					mr_state = req.getParameter("mr_state").trim();
				} catch (Exception e) {
					errorMsgs.add("�п�J�|�����|���A");
				}

				String mr_result = null;
				try {
					mr_result = req.getParameter("mr_result").trim();
				} catch (Exception e) {
					errorMsgs.add("�|�����|���A�ж�Ʀr01.");
				}


				MemberReportVO mrVO = new MemberReportVO();
				mrVO.setMr_id(mr_id);
				mrVO.setMem_id(mem_id);
				mrVO.setOrder_id(order_id);
				mrVO.setSc_id(sc_id);
				mrVO.setMan_id(man_id);
				mrVO.setMr_content(mr_content);
				mrVO.setMr_image(null);
				mrVO.setMr_time(mr_time);
				mrVO.setMr_state(mr_state);
				mrVO.setMr_result(mr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mrVO", mrVO); // �t����J�榡���~��mrVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/update_mr_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				MemberReportService mrSvc = new MemberReportService();
				mrVO = mrSvc.updateMemberReport(mr_id , mem_id, order_id, sc_id, man_id, mr_content,mr_image,mr_time,mr_state,mr_result);
				

                String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/update_mr_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			System.out.println("�w�w ");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

		try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/

				String mem_id = req.getParameter("mem_id");
				System.out.println(mem_id);
				String order_id = req.getParameter("order_id");
				System.out.println(order_id);
				String sc_id = req.getParameter("sc_id");
				System.out.println(sc_id);
				String mr_content = req.getParameter("mr_content");
				Part pic = req.getPart("mr_image");
				byte[] mr_image = getPictureByteArrayFromWeb(pic);
			if(order_id==null){
				order_id=null;
			}
			if(sc_id==null){
				sc_id=null;
			}
			if(sc_id==null){
				sc_id=null;
			}
System.out.println("1");
/*******************************************************************************/
				MemberReportVO memberreportVO = new MemberReportVO();
				memberreportVO.setMem_id(mem_id);
				memberreportVO.setOrder_id(order_id);
				memberreportVO.setSc_id(sc_id);
				memberreportVO.setMan_id(mr_content);
				memberreportVO.setMr_image(mr_image);
System.out.println("2");
			
				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberreportVO", memberreportVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/mem/member_addMR.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.println("3");
				System.out.println(mem_id);
				System.out.println(order_id);
				System.out.println(sc_id);
				System.out.println(mr_content);
				System.out.println(mr_image);
				MemberReportService mrSvc = new MemberReportService();
				memberreportVO = mrSvc.addMemberReport(mem_id, order_id, sc_id, mr_content, mr_image);
				System.out.println("4");
				req.setAttribute("memberreportVO", memberreportVO);
				String url = "/frontend/mem/member_report.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/mem/member_addMR.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j

			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String mr_id = new String(req.getParameter("mr_id"));
				
				/***************************2.�}�l�R�����***************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
				mrSvc.deleteMemberReport(mr_id);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
//				DeptService deptSvc = new DeptService();
//				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
//					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno())); // ��Ʈw���X��list����,�s�Jrequest
//				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
	public static byte[] getPictureByteArrayFromWeb(Part part) throws IOException {
		InputStream is = part.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = is.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		is.close();
		return baos.toByteArray();
	}
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // ���ե�
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // ���ե�
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}

