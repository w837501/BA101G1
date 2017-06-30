package com.store.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;

public class StoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// ¨Ó¦Ûindex.jspªº½Ð¨D ¨Ó¦Ûstore.jspªº½Ð¨D
		if ("get_store".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.±µ¦¬½Ð¨D°Ñ¼Æ - ¿é¤J®æ¦¡ªº¿ù»~³B²z
				 **********************/
				String str = req.getParameter("store_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("½Ð¿é¤J°Ó®aÃöÁä¦r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/store/store.jsp");
					failureView.forward(req, res);
					return;// µ{¦¡¤¤Â_
				}

				/*************************** 2.¶}©l¬d¸ß¸ê®Æ *****************************************/
				StoreService storeSvc = new StoreService();
				List<StoreVO> storelist = storeSvc.getName(str);
				if (storelist.isEmpty()) {
					errorMsgs.add("¬dµL¸ê®Æ");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/store/store.jsp");
					failureView.forward(req, res);
					return;// µ{¦¡¤¤Â_
				}
				/***************************
				 * 3.¬d¸ß§¹¦¨,·Ç³ÆÂà¥æ(Send the Success view)
				 *************/
				req.setAttribute("storelist", storelist); // ¸ê®Æ®w¨ú¥XªºStoreVOª«¥ó,¦s¤Jreq
				String url = "/store/store.jsp";

				/*
				 * if ("get_store_a".equals(action)) url =
				 * "/store/listSearchStore.jsp"; //
				 * ¦¨¥\Âà¥æ/store/listSearchStore.jsp else if
				 * ("get_store_b".equals(action)) url = "/store.jsp"; // ¦¨¥\Âà¥æ
				 * /store.jsp
				 */

				RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æstore.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/*************************** ¨ä¥L¥i¯àªº¿ù»~³B²z *************************************/
			} catch (Exception e) {
				errorMsgs.add("µLªk¨ú±o¸ê®Æ:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/store/store.jsp");
				failureView.forward(req, res);
			}
		}

		if ("get_zone".equals(action)) { // ¨Ó¦Ûstore.jspªº½Ð¨D

			String str = req.getParameter("store_zone");
			StoreService storeSvc = new StoreService();

			List<StoreVO> storelist = storeSvc.getZone(str);
			req.setAttribute("storelist", storelist); // ¸ê®Æ®w¨ú¥XªºstoreVOª«¥ó,¦s¤Jreq
			req.setAttribute("store_zone", str);
			
			String url = "/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æstore.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}

		if ("getStoreClass".equals(action)) { // ¨Ó¦ÛstoreClass.jspªº½Ð¨D
			String str = req.getParameter("sc_id");
			StoreService storeSvc = new StoreService();

			List<StoreVO> storelist = storeSvc.getStoreClass(str);
			req.setAttribute("storelist", storelist); // ¸ê®Æ®w¨ú¥XªºstoreVOª«¥ó,¦s¤Jreq

			String url = "/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æstore.jsp
			System.out.println(successView);
			successView.forward(req, res);
<<<<<<< HEAD
		} 
		if ("getOne_For_Update".equals(action)) { // ¨Ó¦ÛlistAllEmp.jsp ©Î  /dept/listEmps_ByDeptno.jsp ªº½Ð¨D
			  
			  			List<String> errorMsgs = new LinkedList<String>();
			  			// Store this set in the request scope, in case we need to
			  			// send the ErrorPage view.
			  			req.setAttribute("errorMsgs", errorMsgs);
			  			
			  			String requestURL = req.getParameter("requestURL"); // °e¥X­×§ïªº¨Ó·½ºô­¶¸ô®|: ¥i¯à¬°¡i/emp/listAllEmp.jsp¡j ©Î  ¡i/dept/listEmps_ByDeptno.jsp¡j ©Î ¡i /dept/listAllDept.jsp¡j		
			  			
			  			try {
			  				/***************************1.±µ¦¬½Ð¨D°Ñ¼Æ****************************************/
			  				String store_id = new String(req.getParameter("store_id"));
			  				
			  				/***************************2.¶}©l¬d¸ß¸ê®Æ****************************************/
			  				StoreService storeSvc = new StoreService();
			  				StoreVO storeVO = storeSvc.getOneStore(store_id);
			  								
			  				/***************************3.¬d¸ß§¹¦¨,·Ç³ÆÂà¥æ(Send the Success view)************/
			  				req.setAttribute("storeVO", storeVO); // ¸ê®Æ®w¨ú¥XªºempVOª«¥ó,¦s¤Jreq
			  				System.out.println("storeVO=" +storeVO);
			  				String url = "/backend/store/update_store_input.jsp";
			  				RequestDispatcher successView = req.getRequestDispatcher(url);
			  				
			  				// ¦¨¥\Âà¥æupdate_emp_input.jsp
			  				
			  				successView.forward(req, res);
			  
			  				/***************************¨ä¥L¥i¯àªº¿ù»~³B²z************************************/
			  			} catch (Exception e) {
			  				errorMsgs.add("­×§ï¸ê®Æ¨ú¥X®É¥¢±Ñ:"+ e.getMessage());
			  				RequestDispatcher failureView = req
			  						.getRequestDispatcher(requestURL);
			  				failureView.forward(req, res);
			  			}
			  		}
			  		
			  		if ("update".equals(action)) { // ¨Ó¦Ûupdate_emp_input.jspªº½Ð¨D
			  			
			  			List<String> errorMsgs = new LinkedList<String>();
			  			// Store this set in the request scope, in case we need to
			  			// send the ErrorPage view.
			  			req.setAttribute("errorMsgs", errorMsgs);
			  			
			  			String requestURL = req.getParameter("requestURL"); // °e¥X­×§ïªº¨Ó·½ºô­¶¸ô®|: ¥i¯à¬°¡i/emp/listAllEmp.jsp¡j ©Î  ¡i/dept/listEmps_ByDeptno.jsp¡j ©Î ¡i /dept/listAllDept.jsp¡j ©Î ¡i /emp/listEmps_ByCompositeQuery.jsp¡j
			  		
			  			try {
			  				/***************************1.±µ¦¬½Ð¨D°Ñ¼Æ - ¿é¤J®æ¦¡ªº¿ù»~³B²z**********************/
			  				String store_id = new String(req.getParameter("store_id").trim());
			  				String store_name = req.getParameter("store_name").trim();
			  				String store_addr = req.getParameter("store_addr").trim();				
			  System.out.println(store_id);
			  System.out.println(store_name);
			  System.out.println(store_addr);
			  				String store_phone = null;
			  				try {
			  					store_phone = new String(req.getParameter("store_phone").trim());
			  				} catch (NumberFormatException e) {
			  					errorMsgs.add("¹q¸Ü½Ð¶ñ¼Æ¦r.");
			  				}
			  				
			  				System.out.println(store_phone);
			  				String store_state = req.getParameter("store_state");
			  				
			  				StoreVO storeVO = new StoreVO();
			  				storeVO.setStore_id(store_id);
			  				storeVO.setStore_name(store_name);
			  				storeVO.setStore_addr(store_addr);
			  				storeVO.setStore_phone(store_phone);
			  				storeVO.setStore_state(store_state);
			  				
			  				// Send the use back to the form, if there were errors
			  				if (!errorMsgs.isEmpty()) {
			  					req.setAttribute("storeVO", storeVO); // §t¦³¿é¤J®æ¦¡¿ù»~ªºempVOª«¥ó,¤]¦s¤Jreq
			  					RequestDispatcher failureView = req
			  							.getRequestDispatcher("/backend/store/update_store_input.jsp");
			  					failureView.forward(req, res);
			  					return; //µ{¦¡¤¤Â_
			  				}
			  				
			  				/***************************2.¶}©l­×§ï¸ê®Æ*****************************************/
			  				StoreService storeSvc = new StoreService();
			  				storeVO = storeSvc.updateStore2(store_phone,store_addr,store_name,  store_state,store_id);
			  				System.out.println("XXXXXXXXXXXX");
			  				/***************************3.­×§ï§¹¦¨,·Ç³ÆÂà¥æ(Send the Success view)*************/								
			  				
			                  
			  				String url ="/backend/store/ListAllStore.jsp";
			  				RequestDispatcher successView = req.getRequestDispatcher(url);   // ­×§ï¦¨¥\«á,Âà¥æ¦^°e¥X­×§ïªº¨Ó·½ºô­¶
			  				successView.forward(req, res);
			  
			  				/***************************¨ä¥L¥i¯àªº¿ù»~³B²z*************************************/
			  			} catch (Exception e) {
			  				errorMsgs.add("­×§ï¸ê®Æ¥¢±Ñ:"+ e.getMessage());
			  				RequestDispatcher failureView = req
			  						.getRequestDispatcher("/backend/store/update_store_input.jsp");
			  				failureView.forward(req, res);
			  			}
			  		}
		
=======
		}

		if ("getOne_For_Update".equals(action)) { // ¨Ó¦ÛlistAllEmp.jsp ©Î
													// /dept/listEmps_ByDeptno.jsp
													// ªº½Ð¨D

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // °e¥X­×§ïªº¨Ó·½ºô­¶¸ô®|:
																// ¥i¯à¬°¡i/emp/listAllEmp.jsp¡j
																// ©Î
																// ¡i/dept/listEmps_ByDeptno.jsp¡j
																// ©Î ¡i
																// /dept/listAllDept.jsp¡j

			try {
				/*************************** 1.±µ¦¬½Ð¨D°Ñ¼Æ ****************************************/
				String store_id = new String(req.getParameter("store_id"));

				/*************************** 2.¶}©l¬d¸ß¸ê®Æ ****************************************/
				StoreService storeSvc = new StoreService();
				StoreVO storeVO = storeSvc.getOneStore(store_id);

				/***************************
				 * 3.¬d¸ß§¹¦¨,·Ç³ÆÂà¥æ(Send the Success view)
				 ************/
				req.setAttribute("storeVO", storeVO); // ¸ê®Æ®w¨ú¥XªºempVOª«¥ó,¦s¤Jreq
				System.out.println("storeVO=" + storeVO);
				String url = "/backend/store/update_store_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);

				// ¦¨¥\Âà¥æupdate_emp_input.jsp

				successView.forward(req, res);

				/*************************** ¨ä¥L¥i¯àªº¿ù»~³B²z ************************************/
			} catch (Exception e) {
				errorMsgs.add("­×§ï¸ê®Æ¨ú¥X®É¥¢±Ñ:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // ¨Ó¦Ûupdate_emp_input.jspªº½Ð¨D

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");

			try {
				/***************************
				 * 1.±µ¦¬½Ð¨D°Ñ¼Æ - ¿é¤J®æ¦¡ªº¿ù»~³B²z
				 **********************/
				String store_id = new String(req.getParameter("store_id").trim());
				String store_name = req.getParameter("store_name").trim();
				String store_addr = req.getParameter("store_addr").trim();
				System.out.println(store_id);
				System.out.println(store_name);
				System.out.println(store_addr);
				String store_phone = null;
				try {
					store_phone = new String(req.getParameter("store_phone").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("¹q¸Ü½Ð¶ñ¼Æ¦r.");
				}

				System.out.println(store_phone);
				String store_state = req.getParameter("store_state");

				StoreVO storeVO = new StoreVO();
				storeVO.setStore_id(store_id);
				storeVO.setStore_name(store_name);
				storeVO.setStore_addr(store_addr);
				storeVO.setStore_phone(store_phone);
				storeVO.setStore_state(store_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("storeVO", storeVO); // §t¦³¿é¤J®æ¦¡¿ù»~ªºempVOª«¥ó,¤]¦s¤Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/store/update_store_input.jsp");
					failureView.forward(req, res);
					return; // µ{¦¡¤¤Â_
				}

				/*************************** 2.¶}©l­×§ï¸ê®Æ *****************************************/
				StoreService storeSvc = new StoreService();
				storeVO = storeSvc.updateStore2(store_phone, store_addr, store_name, store_state, store_id);
				System.out.println("XXXXXXXXXXXX");
				/**************************** 3.­×§ï§¹¦¨,·Ç³ÆÂà¥æ(Send the Success view)*************/

				String url = "/backend/store/ListAllStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ­×§ï¦¨¥\«á,Âà¥æ¦^°e¥X­×§ïªº¨Ó·½ºô­¶
				successView.forward(req, res);

				/*************************** ¨ä¥L¥i¯àªº¿ù»~³B²z *************************************/
			} catch (Exception e) {
				errorMsgs.add("­×§ï¸ê®Æ¥¢±Ñ:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/store/update_store_input.jsp");
				failureView.forward(req, res);
			}
		}

>>>>>>> branch 'ç¬¨' of https://github.com/w837501/BA101G1.git
		if ("getProduct_By_Store".equals(action)) { // ¨Ó¦ÛstoreClass.jspªº½Ð¨D
			String str = req.getParameter("store_id");
			
			StoreService storeSvc = new StoreService();
			ProductService productSvc = new ProductService();
			
			StoreVO storeVO = storeSvc.getOneStore(str);
			List<ProductVO> productlist = productSvc.getProductByStore(str);
			
			req.setAttribute("storeVO", storeVO);
			req.setAttribute("productlist", productlist); // ¸ê®Æ®w¨ú¥XªºstoreVOª«¥ó,¦s¤Jreq

			String url = "/store/listProductByStore.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æstore.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}
		
<<<<<<< HEAD
=======
		if ("getStoreHot".equals(action)) { // ¨Ó¦ÛstoreClass.jspªº½Ð¨D
			String str = req.getParameter("store_star");
			int store_star = Integer.parseInt(str);
			StoreService storeSvc = new StoreService();
			
			List<StoreVO> storelist = storeSvc.getHot(store_star);
			req.setAttribute("storelist", storelist);
			
			String url = "/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æstore.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}
>>>>>>> branch 'ç¬¨' of https://github.com/w837501/BA101G1.git
	}
}
