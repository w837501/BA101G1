package com.member_report.controller;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.member_report.model.*;
@WebServlet("/BA101G1/member_report/member_report.do")
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
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�C�X��@�|�����|");    // ��Ʈw���X��set����,�s�Jrequest
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("mr_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|�����|�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/select_memr.jsp");
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
							.getRequestDispatcher("/backend/memr/select_memr.jsp");
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
							.getRequestDispatcher("/backend/memr/select_memr.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("mrVO", mrVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/memr/select_memr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/select_memr.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�ק��@�|�����|");    // ��Ʈw���X��set����,�s�Jrequest
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String mr_id = new String(req.getParameter("mr_id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("mrVO", mrVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/backend/memr/select_memr.jsp";
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
			req.setAttribute("whichPage", "�C�X�Ҧ��|�����|");    // ��Ʈw���X��set����,�s�Jrequest	
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String mr_id = new String(req.getParameter("mr_id").trim());
				String mem_id = req.getParameter("mem_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String mr_content = req.getParameter("mr_content").trim();
				
				MemberReportService mrSvc = new MemberReportService();
				MemberReportVO mrVO = mrSvc.getOneMemberReport(mr_id);
				byte[] mr_image = mrVO.getMr_image();


				java.sql.Timestamp mr_time = null;
				try {
					mr_time = java.sql.Timestamp.valueOf(req.getParameter("mr_time").trim());
				} catch (IllegalArgumentException e) {
					mr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���87!");
				}

				String mr_state = null;
				try {
					mr_state = "�w�f��";
				} catch (Exception e) {
					errorMsgs.add("�п�J�|�����|���A");
				}

				String mr_result = null;
				try {
					mr_result = req.getParameter("mr_result").trim();
					if(mr_state.isEmpty()){
						mr_state = "���f��";
					}
				} catch (Exception e) {
					errorMsgs.add("�|�����|���A�ж�Ʀr01.");
				}


				mrVO.setMr_id(mr_id);
				mrVO.setMem_id(mem_id);
				mrVO.setOrder_id(order_id);
				mrVO.setSc_id(sc_id);
				mrVO.setMan_id(man_id);
				mrVO.setMr_content(mr_content);
				mrVO.setMr_image(mr_image);
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
				
				/***************************2.�}�l�ק���*****************************************/
				mrVO = mrSvc.updateMemberReport(mr_id , mem_id, order_id, sc_id, man_id, mr_content,mr_image,mr_time,mr_state,mr_result);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/				

//                String url = requestURL;
                String url="/backend/memr/select_memr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/memr/update_mr_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String mem_id = req.getParameter("mem_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String mr_content = req.getParameter("mr_content").trim();
//				byte[] mr_image = req.getParameter("mr_image").trim().getBytes();
/*******************************�Ϥ��g�JDB************************************************/
				Part addPic = req.getPart("mr_image");
				InputStream in = addPic.getInputStream();
				ByteArrayOutputStream baos =  new ByteArrayOutputStream();
				byte[] mr_image = new byte[8 * 1024];
				int i;
				while((i = in.read(mr_image)) != -1){
					baos.write(mr_image, 0, i);
				}
				baos.close();
				in.close();
				mr_image = baos.toByteArray();

/*******************************�Ϥ��g�JDB************************************************/
				java.sql.Timestamp mr_time = null;
				try {
					 mr_time = java.sql.Timestamp.valueOf(req.getParameter("mr_time").trim());
				} catch (IllegalArgumentException e) {
					mr_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
				
				
				String mr_state = null;
				try {
					mr_state =req.getParameter("mr_state").trim();
				} catch (Exception e) {
					errorMsgs.add("��238��.");
				}
				
				String mr_result = null;
				try {
					mr_result = req.getParameter("mr_result").trim();
				} catch (Exception e) {
				
					errorMsgs.add("��250��.");
				}
				
				MemberReportVO mrVO = new MemberReportVO();
				mrVO.setMem_id(mem_id);
				mrVO.setOrder_id(order_id);
				mrVO.setSc_id(sc_id);
				mrVO.setMan_id(man_id);
				mrVO.setMan_id(mr_content);
				mrVO.setMr_image(mr_image);
				mrVO.setMr_time(mr_time);
				mrVO.setMr_state(mr_state);
				mrVO.setMr_result(mr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mrVO", mrVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/memr/addMR.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				MemberReportService mrSvc = new MemberReportService();
				mrVO = mrSvc.addMemberReport(mem_id, order_id, sc_id, mr_content, mr_image);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/backend/memr/listAllMR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/backend/memr/addMR.jsp");
//				failureView.forward(req, res);
//			}
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "�C�X�Ҧ��|�����|");    // ��Ʈw���X��set����,�s�Jrequest
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
//				String url = requestURL;
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "�C�X�Ҧ��|�����|");    
				String url = "/backend/memr/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		if ("listAll3".equals(action)) {
//			req.setAttribute("whichPage", "tab1");    
			MemberReportService mrSvc = new MemberReportService();
			List<MemberReportVO> mrList = null;
			String whichTab = req.getParameter("whichTab");
			if(whichTab.equals("tab1")){
				mrList = mrSvc.findByMR_state("���f��");
			}
			if(whichTab.equals("tab2")){
				mrList = mrSvc.findByMR_state("�f�֤�");
			}
			if(whichTab.equals("tab3")){
				mrList = mrSvc.findByMR_state("�w�f��");
			}
			req.setAttribute("list3", mrList);
			System.out.println("whichTab : "+whichTab+" list " + mrList);
			String url = "/backend/memr/select_memr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("readPic".equals(action)) {
//			req.setAttribute("whichPage", "tab1");    
			/******************************read img*********************************************/
			res.setContentType("image/gif");  
			ServletOutputStream out = res.getOutputStream();
			String mr_id = req.getParameter("mr_id");
			req.setCharacterEncoding("UTF-8");
//			String mr_id2 = new String(mr_id.getBytes("ISO-8859-1"),"UTF-8");
			try {
				Connection con = null;
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(
					"SELECT mr_image FROM member_report WHERE mr_id ='" + mr_id + "'" );
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("mr_image"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println(e);
			}
/******************************read img*********************************************/
			String url = "/backend/memr/select_memr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}
}

