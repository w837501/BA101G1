package com.product.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;


@MultipartConfig(fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024
* 1024)
@WebServlet("/xxx.do")
public class ProductServlet extends HttpServlet{
	


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");

		if ("getproduct_a".equals(action) || "getproduct_b".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("pro_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�\�I����r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					
					String url = null;
					
					if ("getproduct_a".equals(action))
						url = "/product/productClass.jsp";        // ���\���product/productClass.jsp
					else if ("getproduct_b".equals(action))
						url = "/product/product.jsp";              // ���\���product/product.jsp

					
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				ProductService proSvc = new ProductService();
				List<ProductVO> productlist = proSvc.getName(str);
				
				if (productlist.isEmpty()) {
					errorMsgs.add("�d�L���");
				}

				if (!errorMsgs.isEmpty()) {
					
					String url = null;
					
					if ("getproduct_a".equals(action))
						url = "/product/productClass.jsp";        // ���\���product/productClass.jsp
					else if ("getproduct_b".equals(action))
						url = "/product/product.jsp";              // ���\���product/product.jsp

					
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 *************/
				req.setAttribute("productlist", productlist); // ��Ʈw���X��ProductVO����,�s�Jreq
				String url = "/product/product.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���product.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/product/product.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getProductClass".equals(action)) { // �Ӧ�select_page.jsp���ШD
			String str = req.getParameter("pc_id");
			ProductService proSvc = new ProductService();

			List<ProductVO> productlist = proSvc.getProductClass(str);
			req.setAttribute("productlist", productlist); // ��Ʈw���X��empVO����,�s�Jreq
session.removeAttribute("shoppingcart");
			String url = "/product/product.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���select_page.jsp
			System.out.println(successView);
			successView.forward(req, res);

		}
		if("insert".equals(action)){
			System.out.println("111111");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL=req.getParameter("requestURL");
			try {
				String store_id=req.getParameter("store_id");
				System.out.println(store_id);
				String pro_name=req.getParameter("pro_name");
				System.out.println("456");
				String pc_id=req.getParameter("pc_id");
				System.out.println("789");
				Number pro_price=Integer.parseInt(req.getParameter("pro_price"));
				System.out.println("1");
				String pro_state=req.getParameter("pro_state");
				System.out.println("12");
				String pro_content=req.getParameter("pro_content");
				System.out.println("123");
				Part pic=req.getPart("pro_image");
				byte[] pro_image=getPictureByteArrayFromWeb(pic);
				System.out.println(pro_image);
				System.out.println(store_id);
				System.out.println(pro_name);
				System.out.println(pc_id);
				System.out.println(pro_price);
				System.out.println(pro_state);
				System.out.println(pro_content);
				if(pro_name.trim().isEmpty()||pro_name==null){
					errorMsgs.add("�п�J�ӫ~�W��");
				}
				if(pc_id.trim().isEmpty()||pc_id==null){
					errorMsgs.add("�п�J�ӫ~���O");
				}
				
				if(pro_state.trim().isEmpty()||pro_state==null){
					errorMsgs.add("�п�J�ӫ~���A");
				}
				if(pro_content.trim().isEmpty()||pro_content==null){
					errorMsgs.add("�п�J�ӫ~����");
				}
				System.out.println(store_id);
				System.out.println(pro_name);
				System.out.println(pc_id);
				System.out.println(pro_price);
				System.out.println(pro_state);
				System.out.println(pro_content);
				System.out.println(pro_image);
				System.out.println();
				ProductVO productVO=new ProductVO();
				productVO.setStore_id(store_id);
				productVO.setPro_name(pro_name);
				productVO.setPc_id(pc_id);
				productVO.setPro_price(pro_price);
				productVO.setPro_state(pro_state);
				productVO.setPro_content(pro_content);
				productVO.setPro_image(pro_image);
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("productVO", productVO);
					RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
					failureView.forward(req, res);
					return;
				}
				
				ProductService productSvc=new ProductService();
				productSvc.addPro(store_id, pro_name, pro_price, pro_state, pro_image, pc_id, pro_content);
				
				String url="/product/product.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
				return;
			}
		}

		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String pro_id=new String(req.getParameter("pro_id"));
				ProductService productSvc=new ProductService();
				ProductVO productVO=productSvc.getOnePro(pro_id);
				System.out.println("store_id:"+pro_id);
				req.setAttribute("productVO", productVO);
				System.out.println(productVO);
				String url="/product/UpdateProduct.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/product/ListAllProduct.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		if("update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			System.out.println("1");
			try {
				String pro_id=req.getParameter("pro_id");
				String store_id=req.getParameter("store_id");
				String pro_name=req.getParameter("pro_name");
				String pc_id=req.getParameter("pc_id");
				Number pro_price=Integer.parseInt(req.getParameter("pro_price"));
				String pro_state=req.getParameter("pro_state");
				String pro_content=req.getParameter("pro_content");
				Part pic=req.getPart("pro_image");
				byte[] pro_image=getPictureByteArrayFromWeb(pic);
				if(pro_name.trim().isEmpty()||pro_name==null){
					errorMsgs.add("�п�J�ӫ~�W��");
				}
				if(pc_id.trim().isEmpty()||pc_id==null){
					errorMsgs.add("�п�J���O");
				}
				
				if(pro_state.trim().isEmpty()||pro_state==null){
					errorMsgs.add("�п�J�ӫ~���A");
				}
				if(pro_content.trim().isEmpty()||pro_content==null){
					errorMsgs.add("�п�J�ӫ~����");
				}
				System.out.println("2");
				ProductVO productVO=new ProductVO();
				productVO.setPro_id(pro_id);
				productVO.setStore_id(store_id);
				productVO.setPro_name(pro_name);
				productVO.setPc_id(pc_id);
				productVO.setPro_price(pro_price);
				productVO.setPro_state(pro_state);
				productVO.setPro_image(pro_image);
				ProductVO productVO2=new ProductVO();
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productVO", productVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/product/UpdateProduct.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}
				System.out.println("!!!!!!!!!!");
				ProductService proSvc=new ProductService();
				productVO2=proSvc.getOnePro(pro_id);
				byte[] defaultpic=productVO2.getPro_image();
				if (getFileNameFromPart(pic) != null)
					productVO=proSvc.updatePro(store_id, pro_id, pro_name, pro_price, pro_state, pro_image, pc_id, pro_content);
				else
					productVO=proSvc.updatePro(store_id, pro_id, pro_name, pro_price, pro_state, defaultpic, pc_id, pro_content);
				
				String url = "/product/ListAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

				
			}catch(Exception e){
				RequestDispatcher failureView = req.getRequestDispatcher("/product/UpdateProduct.jsp");
				failureView.forward(req, res);
				return; // �{�����_
			}
		}

		if ("getOne_In_ShoppingCart".equals(action)) { // �Ӧ�select_page.jsp���ШD
			
			String str = req.getParameter("store_id");
			String pro_name=req.getParameter("pro_name");
			StoreService storeSvc = new StoreService();
			StoreVO storeVO = storeSvc.getOneStore(str);
			ProductService productSvc = new ProductService();
			List<ProductVO> productlist = productSvc.getProductByStore(str);
			System.out.println("productlist="+productlist);
			req.setAttribute("productlist", productlist); // ��Ʈw���X��storeVO����,�s�Jreq
			req.setAttribute("storeVO", storeVO);
			
			
			
			ProductVO aproduct = getProduct(req);
			
			boolean match = false;
			//�s�W�Ĥ@�Ӱӫ~
			if(buylist==null){
				buylist = new Vector<ProductVO>();
				buylist.add(aproduct);
			}else{
				for(int i = 0 ; i < buylist.size();i++){
					ProductVO productVO = buylist.get(i);
					System.out.println(productVO);
					
					//�Y�s�W��@�˪��ӫ~
					if(productVO.getPro_name().equals(aproduct.getPro_name())){
						productVO.setQuantity((int)productVO.getQuantity()+(int)aproduct.getQuantity());
						buylist.setElementAt(productVO, i);
						System.out.println(productVO.getQuantity());
						System.out.println(buylist);
						match = true;
					}
					
				}
				//�Y�s�W�줣�@�˪��ӫ~
				if(!match){
					buylist.addElement(aproduct);
				}
				
			}
			
			session.setAttribute("shoppingcart", buylist);
			for(ProductVO abc:buylist){
				System.out.println(abc.getPro_name());
			}
			String url ="/store/listProductByStore.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			
			successView.forward(req, res);
		}
		
		if(action.equals("Checkout")){
			int total = 0;
			for(int i = 0; i< buylist.size();i++){
				ProductVO productVO = buylist.get(i);
				int price  = (int) productVO.getPro_price();
				int quantity = (int)productVO.getQuantity();
				total += (price*quantity);
			}
			
			String amount = String.valueOf(total);
			String url = "/frontend/shoppingcart/Checkout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}
		
		if(action.equals("goto_ShoppingCart")){
			int total = 0;
			for(int i = 0; i< buylist.size();i++){
				ProductVO productVO = buylist.get(i);
				int price  = (int) productVO.getPro_price();
				int quantity = (int)productVO.getQuantity();
				total += (price*quantity);
			}
			
			String amount = String.valueOf(total);
			session.setAttribute("amount", amount);
			session.setAttribute("shoppingcart", buylist);
			String url = "/frontend/shoppingcart/shoppingcart.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}
		System.out.println("action"+action);
		
		
		if (action.equals("DELETE")) {
			String del = req.getParameter("del");
			System.out.println("del"+del);
			int d = Integer.parseInt(del);
			System.out.println(d);
			buylist.removeElementAt(d);
			int total = 0;
			for(int i = 0; i< buylist.size();i++){
				ProductVO productVO = buylist.get(i);
				int price  = (int) productVO.getPro_price();
				int quantity = (int)productVO.getQuantity();
				total += (price*quantity);
			}
			String amount = String.valueOf(total);
			session.setAttribute("shoppingcart", buylist);
			session.setAttribute("amount", amount);
			
			String url = "/frontend/shoppingcart/shoppingcart.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

	}

	private ProductVO getProduct(HttpServletRequest req) {

		String pro_id = req.getParameter("pro_id");
		String pro_name = req.getParameter("pro_name");
		Number pro_price = Integer.parseInt(req.getParameter("pro_price"));
		String pro_content = req.getParameter("pro_content");
		String store_id = req.getParameter("store_id");
		Number quantity =Integer.parseInt(req.getParameter("quantity"));

		ProductVO productVO = new ProductVO();

		productVO.setPro_id(pro_id);
		productVO.setPro_name(pro_name);
		productVO.setPro_price(pro_price);
		productVO.setPro_content(pro_content);
		productVO.setStore_id(store_id);
		productVO.setQuantity(quantity);
		return productVO;
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
