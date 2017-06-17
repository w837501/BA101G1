package com.man.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.man.model.ManagerService;
import com.man.model.ManagerVO;

public class ManServlet extends HttpServlet{

	
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//查詢
		if("getOne_For_Display".equals(action)){
			
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String str=req.getParameter("man_id");
				if(str==null||(str.trim().length()==0)){
					errorMsgs.add("請輸入員工編號");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView=req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				
				String man_id=null;
				try{
					man_id=new String(str);
				}catch (Exception e) {
					errorMsgs.add("輸入格式錯誤");
				}
				
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView=req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				
				ManagerService manSvc=new ManagerService();
				ManagerVO managerVO=manSvc.getOneEmp(man_id);
				if(managerVO==null){
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView=req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("managerVO", managerVO);
				String url="/backend/man/ListOneMan.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("無法取得資料"+e.getMessage());
				RequestDispatcher failureView=req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}
			
			//修改
			
			
			//刪除
		}
	}
}
