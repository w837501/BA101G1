//package com.store_class.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.*;
//
//import com.store_class.model.*;
//
//
//public class StoreClassServlet extends HttpServlet{
//	
//	public void doGet(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException {
//		doPost(req, res);
//	}
//
//	public void doPost(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException {
//		
//		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//		
//		if("getAll".equals(action)){
//			StoreClassDAO scDAO = new StoreClassDAO();
//			List<StoreClassVO> list = scDAO.getAll();
//			
//			HttpSession session = req.getSession();
//			session.setAttribute("list", list);
//			String url = "/store/listAllStoreClass_getFromSession.jsp";
//			
//		}
//		
//		
//		
//	
//	}
//}