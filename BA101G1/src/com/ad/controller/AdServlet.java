package com.ad.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ad.model.AdDAO;
import com.ad.model.AdService;
import com.ad.model.AdVO;
import com.man.model.ManagerService;



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
			System.out.println("幹你媽");
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
		if("insert".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String store_id=req.getParameter("store_id");
				String ad_name=req.getParameter("ad_name");
				String ad_content=req.getParameter("ad_content");
				String ad_image=req.getParameter("ad_image");
				String ad_time=req.getParameter("ad_time");
				String ad_push_content=req.getParameter("ad_push_content");
				
				if(store_id==null||store_id.trim().isEmpty()){
					errorMsgs.add("請輸入商家編號");
				}else{
					store_id=req.getParameter("store_id");
				}
				
				if(ad_name==null||ad_name.trim().isEmpty()){
					errorMsgs.add("請輸入廣告名字");
				}else{
					ad_name=req.getParameter("ad_name");
				}
				
				if(ad_content==null||ad_content.trim().isEmpty()){
					ad_content=req.getParameter("ad_content");
				}else{
					ad_content=req.getParameter("ad_content");
				}
				AdVO adVO=new AdVO();
				adVO.setStore_id(store_id);
				adVO.setAd_name(ad_name);
				adVO.setAd_content(ad_content);
				adVO.setAd_time(null);
				adVO.setAd_push_content(ad_push_content);
				adVO.setAd_image(null);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adVO", adVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/advertisement/Add_Ad.jsp");
					failureView.forward(req, res);
					return;
				}
				AdService adSvc = new AdService();
				adVO = adSvc.addAd(store_id, ad_name, ad_content, null, null, ad_push_content);
				
				String url = "/frontend/advertisement/browseAD.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/advertisement/Add_Ad.jsp");
				failureView.forward(req, res);
			}

		}
	}
}
