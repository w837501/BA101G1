package com.news.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.news.model.NewsDAO;
import com.news.model.NewsService;
import com.news.model.NewsVO;


@WebServlet("/news/news.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 50 * 1024 * 1024, maxRequestSize = 5 * 50 * 1024 * 1024)
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
					.getRequestDispatcher("/backend/news/listOneNews.jsp");
				successView.forward(req, res);
				return;
			}	catch(Exception e){
				throw new ServletException(e);
			}
		}
		
		if("getOne_For_Update".equals(action)){ 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
//1.接收請求參數				
				String news_id = req.getParameter("news_id");
				String mam_id = req.getParameter("mam_id");
				
//2.開始修改資料				
				NewsService newsSvc = new NewsService();
				NewsVO newsVO = newsSvc.getOneNews(news_id , mam_id);
//3.修改完成,準備轉交				
				req.setAttribute("newsVO", newsVO);
				String url = "/backend/news/updateNewsInput.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//其他可能的錯誤處理				
			}catch(Exception e){
				throw new ServletException(e);

			}
		}
		//========================================
		//========================================		
		
		if("update".equals(action)){ 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
		try{
//1.接收請求參數 - 輸入格式的錯誤處理	
			String man_id = req.getParameter("man_id").trim();
			String news_id = req.getParameter("news_id");
			System.out.println("news_id from servlet="+news_id);
			String news_name = req.getParameter("news_name").trim();
			String news_content = req.getParameter("news_content").trim();
			System.out.println("1");
			Part part = req.getPart("news_image");
			byte[] news_image=getPictureByteArrayFromWeb(part);
			System.out.println("2");
			
			System.out.println("3");
			System.out.println(man_id);
			System.out.println(news_id);
			System.out.println(news_name);
			System.out.println(news_content);
			System.out.println(news_image);
			
			NewsVO newsVO = new NewsVO();
			newsVO.setMan_id(man_id);
			newsVO.setNews_id(news_id);
			newsVO.setNews_name(news_name);
			newsVO.setNews_content(news_content);
			newsVO.setNews_image(news_image);
			
			
			if(!errorMsgs.isEmpty()){
				req.setAttribute("newsVO", newsVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/news/addNewsInput.jsp");
				failureView.forward(req, res);
				return;
			}
			
//2.開始新增資料		
			NewsService newsSvc = new NewsService();
			NewsVO newsVO1=newsSvc.getOneNews(news_id,man_id);
			byte[] defaultpic=newsVO1.getNews_image();
			if(getFileNameFromPart(part) != null)
				newsVO = newsSvc.updateNews(man_id , news_id , news_name , news_content , news_image);
			else
				newsVO = newsSvc.updateNews(man_id , news_id , news_name , news_content , defaultpic);

//3.新增完成,準備轉交
			String url = "/backend/news/listAllNews.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);   
			successView.forward(req, res);			
			
//其他可能的錯誤處理			
		} catch (Exception e) {
			errorMsgs.add("修改資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/backend/news/updateNewsInput.jsp");
			failureView.forward(req, res);
		}
	}
		//========================================
		//========================================
		
		
		
		if("insert".equals(action)){ 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		try{
//1.接收請求參數 - 輸入格式的錯誤處理	
			String man_id = req.getParameter("man_id").trim();
			String news_name = req.getParameter("news_name").trim();
			String news_content = req.getParameter("news_content").trim();
			
			Part part = req.getPart("news_image");
			InputStream in = part.getInputStream();
			byte[] news_image = new byte[in.available()];
			in.read(news_image);
			in.close();
			
//			java.sql.Time currentTime = new java.sql.Time(System.currentTimeMillis());
//			java.sql.Timestamp news_time = java.sql.Timestamp.valueOf(req.getParameter("news_time").trim() +" "+ currentTime.toString());			
			
			
			NewsVO newsVO = new NewsVO();
			newsVO.setMan_id(man_id);
			newsVO.setNews_name(news_name);
			newsVO.setNews_content(news_content);
			newsVO.setNews_image(news_image);
			//newsVO.setNews_time(news_time);
			
			
			
			if(!errorMsgs.isEmpty()){
				req.setAttribute("newsVO", newsVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/news/updateNewsInput.jsp");
				failureView.forward(req, res);
				return;
			}
			
//2.開始修改資料		
			NewsService newsSvc = new NewsService();
			newsVO = newsSvc.addNews(man_id  , news_name , news_content , news_image  );
//3.修改完成,準備轉交
			String url = "/backend/news/listAllNews.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);   
			successView.forward(req, res);			
			
//其他可能的錯誤處理			
		} catch (Exception e) {
			errorMsgs.add("修改資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/backend/news/addNewsInput.jsp");
			failureView.forward(req, res);
		}
	}
		
		
		//========================================
		//========================================
		
		if("delete".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			

			String requestURL = req.getParameter("requestURL");  
			try {
//1.接收請求參數
				String man_id = req.getParameter("man_id");
				String news_id = req.getParameter("news_id");
				
//2.開始刪除資料
				NewsService newsSvc = new NewsService();
				NewsVO NewsVO = newsSvc.getOneNews(news_id , man_id); 
				newsSvc.deleteNews(news_id);
				
//3.刪除完成,準備轉交
				
				String url = requestURL; 
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
//其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
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
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
