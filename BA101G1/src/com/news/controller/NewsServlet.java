package com.news.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.model.NewsDAO;
import com.news.model.NewsVO;


@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)){
			try{	
				String news_id = new String(req.getParameter("news_id"));
				System.out.println(news_id);
				NewsDAO dao =  new NewsDAO();
				NewsVO newsVO = dao.findByPrimaryKey(news_id);
			
				req.setAttribute("newsVO", newsVO);
				
				RequestDispatcher successView = req
					.getRequestDispatcher("/frontend/latestnews/detailOfNews.jsp");
				successView.forward(req, res);
				return;
			}	catch(Exception e){
				throw new ServletException(e);
			}
		}
		
	}
}
