package com.product.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;

<<<<<<< HEAD
public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
=======
public class ProductServlet extends HttpServlet{
	
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
>>>>>>> branch 'èƒ–å­' of https://github.com/w837501/BA101G1.git
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");

		if ("getproduct_a".equals(action) || "getproduct_b".equals(action)) { // ¨Ó¦Ûselect_page.jspªº½Ğ¨D

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.±µ¦¬½Ğ¨D°Ñ¼Æ - ¿é¤J®æ¦¡ªº¿ù»~³B²z **********************/
				String str = req.getParameter("pro_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("½Ğ¿é¤J°Ó«~ÃöÁä¦r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					
					String url = null;
					
					if ("getproduct_a".equals(action))
						url = "/product/productClass.jsp";        // ¦¨¥\Âà¥æproduct/productClass.jsp
					else if ("getproduct_b".equals(action))
						url = "/product/product.jsp";              // ¦¨¥\Âà¥æproduct/product.jsp

					
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// µ{¦¡¤¤Â_
				}

				/*************************** 2.¶}©l¬d¸ß¸ê®Æ *****************************************/
				ProductService proSvc = new ProductService();
				List<ProductVO> productlist = proSvc.getName(str);
				
				if (productlist.isEmpty()) {
					errorMsgs.add("¬dµL¸ê®Æ");
				}

				if (!errorMsgs.isEmpty()) {
					
					String url = null;
					
					if ("getproduct_a".equals(action))
						url = "/product/productClass.jsp";        // ¦¨¥\Âà¥æproduct/productClass.jsp
					else if ("getproduct_b".equals(action))
						url = "/product/product.jsp";              // ¦¨¥\Âà¥æproduct/product.jsp

					
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// µ{¦¡¤¤Â_
				}

				/***************************
				 * 3.¬d¸ß§¹¦¨,·Ç³ÆÂà¥æ(Send the Success view)
				 *************/
				req.setAttribute("productlist", productlist); // ¸ê®Æ®w¨ú¥XªºProductVOª«¥ó,¦s¤Jreq
				String url = "/product/product.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æproduct.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/*************************** ¨ä¥L¥i¯àªº¿ù»~³B²z *************************************/
			} catch (Exception e) {
				errorMsgs.add("µLªk¨ú±o¸ê®Æ:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/product/product.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getProductClass".equals(action)) { // ¨Ó¦Ûselect_page.jspªº½Ğ¨D
			String str = req.getParameter("pc_id");
			ProductService proSvc = new ProductService();

			List<ProductVO> productlist = proSvc.getProductClass(str);
			req.setAttribute("productlist", productlist); // ¸ê®Æ®w¨ú¥XªºempVOª«¥ó,¦s¤Jreq

			String url = "/product/product.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æselect_page.jsp
			System.out.println(successView);
			successView.forward(req, res);

		}
<<<<<<< HEAD

=======
		
		if ("getOne_In_ShoppingCart".equals(action)) { // ¨Ó¦Ûselect_page.jspªº½Ğ¨D
			
			ProductVO aproduct = getProduct(req);
			
			boolean match = false;
			//·s¼W²Ä¤@­Ó°Ó«~
			if(buylist==null){
				buylist = new Vector<ProductVO>();
				buylist.add(aproduct);
			}else{
				for(int i = 0 ; i < buylist.size();i++){
					ProductVO productVO = buylist.get(i);
					System.out.println(productVO);
					//­Y·s¼W¨ì¤@¼Ëªº°Ó«~
					if(productVO.getPro_name().equals(aproduct.getPro_name())){
						productVO.setQuantity(productVO.getQuantity()
								+aproduct.getQuantity());
						//buylist.setElementAt(productVO, i);
						match = true;
					}
					
				}
				//­Y·s¼W¨ì¤£¤@¼Ëªº°Ó«~
				if(!match){
					buylist.addElement(aproduct);
				}
				
			}
//			String str = req.getParameter("store_id");
//			String str2 = req.getParameter("pro_id");
//			StoreService storeSvc = new StoreService();
//			StoreVO storeVO = storeSvc.getOneStore(str);
//			ProductService productSvc = new ProductService();
//			ProductVO productVO = productSvc.getOnePro(str2);
//			System.out.println("store_id="+str);
//			System.out.println("productVO="+productVO.getPro_id());
//			req.setAttribute("productVO", productVO); // ¸ê®Æ®w¨ú¥XªºstoreVOª«¥ó,¦s¤Jreq
//			req.setAttribute("storeVO", storeVO);
			
			session.setAttribute("shoppingcart", buylist);
			String url ="/frontend/store/listProductByStore.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ¦¨¥\Âà¥æstore.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}
		
		if(action.equals("Checkout")){
			int total = 0;
			for(int i = 0; i< buylist.size();i++){
				ProductVO productVO = buylist.get(i);
				int price  = (int) productVO.getPro_price();
				int quantity = productVO.getQuantity();
				total += (price*quantity);
			}
			
			String amount = String.valueOf(total);
			req.setAttribute("amount", amount);
			String url = "frontend/shoppingcart/Checkout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}
		
		if(action.equals("goto_Shoppingcart")){
			String url = "frontend/shoppingcart/shoppingcart.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}
		
>>>>>>> branch 'èƒ–å­' of https://github.com/w837501/BA101G1.git
	}
<<<<<<< HEAD
=======

	private ProductVO getProduct(HttpServletRequest req) {

		String pro_id = req.getParameter("pro_id");
		String pro_name = req.getParameter("pro_name");
		String pro_price = req.getParameter("pro_price");
		String pro_content = req.getParameter("pro_content");
		String store_id = req.getParameter("store_id");

		ProductVO productVO = new ProductVO();

		productVO.setPro_id(pro_id);
		productVO.setPro_name(pro_name);
		productVO.setPro_price((new Integer(pro_price)).intValue());
		productVO.setPro_content(pro_content);
		productVO.setStore_id(store_id);
		return productVO;
	}
>>>>>>> branch 'èƒ–å­' of https://github.com/w837501/BA101G1.git

}
