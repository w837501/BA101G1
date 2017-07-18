package com.store_report.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.store_report.model.StoreReportService;
import com.store_report.model.StoreReportVO;
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class StoreReportServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session=req.getSession();
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
			
				String str = req.getParameter("sr_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���|�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;
				}

				String sr_id = null;
				try {
					sr_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;
				}

				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
				if (srVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("srVO", srVO); 
				String url = "/backend/str/listOneSR.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/selectPage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); 

			try {
				String sr_id = new String(req.getParameter("sr_id"));

				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);

				req.setAttribute("srVO", srVO); 
				String url = "/backend/str/update_sr_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add( e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); 

			try {
				String sr_id = new String(req.getParameter("sr_id").trim());
				String store_id = req.getParameter("mem_id").trim();
				String sc_id = req.getParameter("sc_id").trim();
				String order_id = req.getParameter("order_id").trim();
				String man_id = req.getParameter("man_id").trim();
				String sr_content = req.getParameter("sr_content").trim();
				byte[] sr_image = req.getParameter("sr_image").trim().getBytes();

				java.sql.Timestamp sr_time = null;
				try {
					sr_time = java.sql.Timestamp.valueOf(req.getParameter("sr_time").trim());
				} catch (IllegalArgumentException e) {
					sr_time = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("��J���~");
				}

				String sr_state = null;
				try {
					sr_state = req.getParameter("sr_state").trim();
				} catch (Exception e) {
					errorMsgs.add("�п�J���A");

				}

				String sr_result = null;
				try {
					sr_result = req.getParameter("sr_result").trim();
				} catch (Exception e) {
					errorMsgs.add("�п�J���G");
				}

				StoreReportVO srVO = new StoreReportVO();
				srVO.setSr_id(sr_id);
				srVO.setStore_id(store_id);
				srVO.setSc_id(sc_id);
				srVO.setOrder_id(order_id);
				srVO.setMan_id(man_id);
				srVO.setSr_content(sr_content);
				srVO.setSr_image(sr_image);
				srVO.setSr_time(sr_time);
				srVO.setSr_state(sr_state);
				srVO.setSr_result(sr_result);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srVO", srVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/update_sr_input.jsp");
					failureView.forward(req, res);
					return; 
				}

				StoreReportService srSvc = new StoreReportService();
				srVO = srSvc.updateStoreReport(sr_id, store_id, sc_id, order_id, man_id, sr_content, sr_image, sr_time,
						sr_state, sr_result);


				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add( e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/update_sr_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = req.getParameter("store_id");
				String sc_id = req.getParameter("sc_id");
				String order_id = req.getParameter("order_id");
			System.out.println(order_id);
				String sr_content = req.getParameter("sr_content");
				Part pic=req.getPart("sr_image");
				byte[] sr_image = getPictureByteArrayFromWeb(pic);


				StoreReportVO srVO = new StoreReportVO();
				srVO.setStore_id(store_id);
				srVO.setSc_id(sc_id);
				srVO.setOrder_id(order_id);
				srVO.setSr_content(sr_content);
				srVO.setSr_image(sr_image);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srVO", srVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/addSR.jsp");
					failureView.forward(req, res);
					return;
				}

				StoreReportService srSvc = new StoreReportService();
				srVO = srSvc.addStoreReport(store_id, sc_id, order_id,  sr_content, sr_image);

				String url = "/store/store_report.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/str/addSR.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); 

			try {
				String sr_id = new String(req.getParameter("sr_id"));

				StoreReportService srSvc = new StoreReportService();
				StoreReportVO srVO = srSvc.getOneStoreReport(sr_id);
				srSvc.deleteStoreReport(sr_id);
				// DeptService deptSvc = new DeptService();
				// if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") ||
				// requestURL.equals("/dept/listAllDept.jsp"))
				// req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno()));
				//
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}


		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("whichPage", "�C�X�Ҧ��Ӯa���|");    // ��Ʈw���X��set����,�s�Jrequest
				String url = "/backend/str/selectPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		if ("listAll3".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			String requestURL=req.getParameter("requestURL");
			String aa = req.getParameter("judge");
			if("tab2".equals(aa)){
				session.setAttribute("whichTab", "�f�֤�");    // ��Ʈw���X��set����,�s�Jrequest
			}
			else if("tab3".equals(aa)){
				session.setAttribute("whichTab", "�w�f��");    // ��Ʈw���X��set����,�s�Jrequest
			}else{
				session.setAttribute("whichTab", "���f��");    // ��Ʈw���X��set����,�s�Jrequest
				
			}
			res.sendRedirect("/BA101G1" + requestURL );
			return;
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
