package com.ad.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ad.model.AdDAO;
import com.ad.model.AdVO;



//@WebServlet("/AdServlet")
public class AdServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)){
			System.out.println("·F§A¶ý");
			try{	
				String ad_id = new String(req.getParameter("ad_id"));
				System.out.println(ad_id);
				AdDAO dao =  new AdDAO();
				AdVO adVO = dao.findByPrimaryKey(ad_id);
			
				req.setAttribute("adVO", adVO);
				
				RequestDispatcher successView = req
					.getRequestDispatcher("/frontend/advertisement/detailOfAD.jsp");
				successView.forward(req, res);
				return;
			}	catch(Exception e){
				throw new ServletException(e);
			}
		}
		
	}
}
