package com.mem.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemberService;
import com.mem.model.MemberVO;

public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("mem_id");
				if (str == null || str.trim().isEmpty()) {
					errorMsgs.add("請輸入會員編號");
				}
				String mem_id = null;
				try {
					mem_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("格式錯誤");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMem(mem_id);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("memberVO", memberVO);
				String url = "/backend/mem/ListOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
				failureView.forward(req, res);
			}

		}
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_id=new String(req.getParameter("mem_id"));
				MemberService memberSvc=new MemberService();
				MemberVO memberVO=memberSvc.getOneMem(mem_id);
				System.out.println("mem_id1:"+mem_id);
				req.setAttribute("memberVO", memberVO);
				
				String url="/backend/mem/Update_mem.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		if("update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_id=req.getParameter("mem_id");
				
				String mem_name=req.getParameter("mem_name");
				String mem_phone=req.getParameter("mem_phone");
				String mem_pw=req.getParameter("mem_pw");
				String mem_mail=req.getParameter("mem_mail");
				
				if (req.getParameter("mem_name") == null || req.getParameter("mem_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					mem_name = req.getParameter("mem_name");
				}
				if (req.getParameter("mem_phone") == null || req.getParameter("mem_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					mem_phone = req.getParameter("mem_phone");
				}
				if (req.getParameter("mem_pw") == null || req.getParameter("mem_pw").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					mem_pw = req.getParameter("mem_pw");
				}
				if (req.getParameter("mem_mail") == null || req.getParameter("mem_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					mem_mail = req.getParameter("mem_mail");
				}
				
				MemberVO memberVO=new MemberVO();
				memberVO.setMem_id(mem_id);
				memberVO.setMem_name(mem_name);
				memberVO.setMem_phone(mem_phone);
				memberVO.setMem_pw(mem_pw);
				memberVO.setMem_mail(mem_mail);
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView=req.getRequestDispatcher("/backend/mem/Update_mem.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemberService memberSvc=new MemberService();
				System.out.println("mem_id00"+mem_id);
				memberVO=memberSvc.updateMem(mem_id, mem_name, mem_phone, mem_pw, mem_mail);
				
				req.setAttribute("memberVO", memberVO);
				String url="/backend/mem/ListOneMem.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("修改失敗:"+e.getMessage());
				RequestDispatcher failureView=req.getRequestDispatcher("/backend/mem/Update_mem.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("insert".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_name=req.getParameter("mem_name");
				String mem_phone=req.getParameter("mem_phone");
				String mem_pw=req.getParameter("mem_pw");
				String mem_mail=req.getParameter("mem_mail");
				
				if(req.getParameter("mem_name")==null || req.getParameter("mem_name").trim().isEmpty()){
					errorMsgs.add("請輸入名字");
				}else{
					mem_name=req.getParameter("mem_name");
				}
				if(req.getParameter("mem_phone")==null || req.getParameter("mem_phone").trim().isEmpty()){
					errorMsgs.add("請輸入電話");
				}else{
					mem_phone=req.getParameter("mem_phone");
				}
				
				if(req.getParameter("mem_pw")==null || req.getParameter("mem_pw").trim().isEmpty()){
					errorMsgs.add("請輸入密碼");
				}else{
					mem_pw=req.getParameter("mem_pw");
				}
				if(req.getParameter("mem_mail")==null || req.getParameter("mem_mail").trim().isEmpty()){
					errorMsgs.add("請輸入信箱");
				}else{
					mem_mail=req.getParameter("mem_mail");
				}
				
				MemberVO memberVO=new MemberVO();
				memberVO.setMem_name(mem_name);
				memberVO.setMem_phone(mem_phone);
				memberVO.setMem_pw(mem_pw);
				memberVO.setMem_mail(mem_mail);
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView=req.getRequestDispatcher("/backend/mem/AddMem.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemberService memberSvc=new MemberService();
				memberVO=memberSvc.addMem(mem_name, mem_phone, mem_pw, mem_mail);
				
				String url="/backend/mem/ListAllMem.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/AddMem.jsp");
				failureView.forward(req, res);
			}
		}
			
	}
}