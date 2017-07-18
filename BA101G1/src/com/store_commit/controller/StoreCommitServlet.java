package com.store_commit.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.store.model.StoreService;
import com.store.model.StoreVO;
import com.store_commit.model.StoreCommitService;
import com.store_commit.model.StoreCommitVO;

public class StoreCommitServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try{
//1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				String str = req.getParameter("sc_id");
				if(str == null || (str.trim()).length() == 0){
					errorMsgs.add("�п�J�Ӯa�s��(sc_id)");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store_commit/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				String sc_id = null;
				try{
					sc_id = new String(str);
				}catch(Exception e){
					errorMsgs.add("�Ӯa�s��(sc_id)�榡�����T");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store_commit/select_page.jsp");
					failureView.forward(req, res);
					return;				
				}
				
//2.�}�l�d�߸��
				StoreCommitService scService = new StoreCommitService();
				StoreCommitVO scVO = scService.getOneStoreCommit(sc_id);
				if(scVO == null){
					errorMsgs.add("�d�L���");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store_commit/select_page.jsp");
					failureView.forward(req, res);
					return;				
				}
//3.�d�ߧ���,�ǳ����				
				req.setAttribute("scVO", scVO);
				String url = "/store_commit/listOneStoreCommit.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//��L�i�઺���~�B�z				
			}catch(Exception e){
				errorMsgs.add("�L�k���o��� :" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store_commit/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		//========================================
		//========================================			
		
		if("getOne_For_Update".equals(action)){ 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
//1.�����ШD�Ѽ�				
				String store_id = new String(req.getParameter("store_id"));
//2.�}�l�d�߸��				
				StoreService storeSvc = new StoreService();
				StoreVO storeVO = storeSvc.getOneStore(store_id);
//3.�d�ߧ���,�ǳ����				
				req.setAttribute("storeVO", storeVO);
				String url = "/store_commit/updateStoreCommitInput.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//��L�i�઺���~�B�z				
			}catch(Exception e){
				errorMsgs.add("�L�k���o�n�ק諸��� :" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store_commit/listAllStoreCommit.jsp");
				failureView.forward(req, res);
			}
		}
		//========================================
		//========================================		
		
		if("update".equals(action)){ 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		try{
//1.�����ШD�Ѽ� - ��J�榡�����~�B�z	
			String sc_id = new String(req.getParameter("sc_id").trim());
			String store_id = new String(req.getParameter("store_id").trim());
			String mem_id = new String(req.getParameter("mem_id").trim());
			String sc_content = new String(req.getParameter("sc_content").trim());
			java.sql.Timestamp sc_time = java.sql.Timestamp.valueOf(req.getParameter("sc_time").trim());
			String sc_state =req.getParameter("sc_state").trim();
			

			StoreCommitVO scVO = new StoreCommitVO();
			
			scVO.setSc_id(sc_id);
			scVO.setStore_id(store_id);
			scVO.setMem_id(mem_id);
			scVO.setSc_content(sc_content);
			scVO.setSc_time(sc_time);
			scVO.setSc_state(sc_state);
			
			if(!errorMsgs.isEmpty()){
				req.setAttribute("scVO", scVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store_commit/updateStoreCommitInput.jsp");
				failureView.forward(req, res);
				return;
			}
			
			
//2.�}�l�ק���		
			StoreCommitService storeSvc = new StoreCommitService();
			scVO = storeSvc.updateStoreCommit(sc_id, store_id , mem_id , sc_content , sc_time , sc_state);
//3.�ק粒��,�ǳ����
			req.setAttribute("scVO", scVO);
			String url = "/store_commit/listOneStoreCommit.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
//��L�i�઺���~�B�z			
		} catch (Exception e) {
			errorMsgs.add("�ק��ƥ���:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/store_commit/updateStoreCommitInput.jsp");
			failureView.forward(req, res);
		}
	}
		
		
		if("insert".equals(action)){ 
			System.out.println("insert");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		try{
//1.�����ШD�Ѽ� - ��J�榡�����~�B�z	
//			String sc_id = new String(req.getParameter("sc_id").trim());
			String store_id =req.getParameter("store_id").trim();
			String mem_id = req.getParameter("mem_id").trim();
			String sc_content = req.getParameter("sc_content").trim();
			Integer sc_score=Integer.parseInt(req.getParameter("sc_score"));
			System.out.println(store_id);
			System.out.println(mem_id);
			System.out.println(sc_content);
			System.out.println(sc_score);
			System.out.println();
			StoreCommitVO scVO = new StoreCommitVO();
			scVO.setStore_id(store_id);
			scVO.setMem_id(mem_id);
			scVO.setSc_content(sc_content);
			scVO.setSc_score(sc_score);
			
			if(!errorMsgs.isEmpty()){
				System.out.println("000000");
				req.setAttribute("scVO", scVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store_commit/addStoreCommit.jsp");
				failureView.forward(req, res);
				return;
			}
			
			System.out.println("123123");
//2.�}�l�ק���		
			StoreCommitService storeSvc = new StoreCommitService();
System.out.println("a");
			scVO = storeSvc.addStoreCommit(store_id , mem_id , sc_content , sc_score);
			System.out.println("b");
			StoreVO storeVO=new StoreService().getOneStore1(store_id);
			System.out.println("c");
			int store_star=storeVO.getStore_star();
			int store_count=storeVO.getStore_count();
			store_star+=sc_score;
			store_count++;
			System.out.println(store_star);
			System.out.println(store_count);
			storeVO=new StoreService().updateStar(store_star, store_count, store_id);
//3.�ק粒��,�ǳ����
			System.out.println("99999");
			String url = "/index.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
//��L�i�઺���~�B�z			
		} catch (Exception e) {
			System.out.println("555555");
			errorMsgs.add("�ק��ƥ���:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/store_commit/addStoreCommit.jsp");
			failureView.forward(req, res);
		}
	}
		
		
		
		
		if ("delete".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String sc_id = new String(req.getParameter("sc_id"));
				/***************************2.�}�l�R�����***************************************/
				StoreCommitService scSvc = new StoreCommitService();
				scSvc.deleteStoreCommit(sc_id);
				System.out.println(sc_id + "wwwwwwwwwwwwwwwwww");
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/store_commit/listAllStoreCommit.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store_commit/listAllStoreCommit.jsp");
				failureView.forward(req, res);
			}
		}
		
		

	}
}