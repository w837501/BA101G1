package com.tools;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.tools.ClassBean;
import com.tools.UserBean;

/**
 * Servlet implementation class JsonResponse
 */
public class JsonResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonResponse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if("getJson".equals(request.getParameter("action"))){
			List<UserBean> list = new ArrayList<UserBean>();
			UserBean user1 = new UserBean();
			user1.setName("���p��");
			user1.setAge("20");
			user1.setHeight("183");
			list.add(user1);
			
			UserBean user2 = new UserBean();
			user2.setName("���p��");
			user2.setAge("18");
			user2.setHeight("162");
			list.add(user2);
            
			JSONArray array = new JSONArray();
			for(UserBean usb:list){
				JSONObject obj = new JSONObject();
				try{
					obj.put("name", usb.getName());
					obj.put("age", usb.getAge());
					obj.put("height", usb.getHeight());
				}catch(Exception e){}
				array.add(obj);
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}
		//�B�z�T���ʺA����ư϶�
		if("getSelect".equals(request.getParameter("action"))){
			JSONArray array = new JSONArray();
			//�d�ߦ~�šB�Z�Ź����P�Ǹ�ư϶�
			if(!"".equals(request.getParameter("grade")) && !"".equals(request.getParameter("classId"))){
				/*���@�϶�����service�h��Ʈw�̦~�šB�Z�Ŭd�ߨ��o*/
				List<UserBean> list = new ArrayList<UserBean>();
				UserBean user1 = new UserBean();
				user1.setName("���p��");
				user1.setAge("20");
				user1.setHeight("183");
				list.add(user1);
				
				UserBean user2 = new UserBean();
				user2.setName("���p��");
				user2.setAge("18");
				user2.setHeight("162");
				list.add(user2);
	            /*---------------------------------------------*/
				for(UserBean usb:list){
					JSONObject obj = new JSONObject();
					try{
						obj.put("name", usb.getName());
						obj.put("age", usb.getAge());
						obj.put("height", usb.getHeight());
					}catch(Exception e){}
					array.add(obj);
				}
			}else{
				/*���@�϶�����service�h��Ʈw�̦~�šB�Z�Ŭd�ߨ��o*/
				List<ClassBean> classList = new ArrayList<ClassBean>();
				ClassBean cls1 = new ClassBean();
				cls1.setClassId("A0001");
				cls1.setClassName("�V�鸪�Z");
				cls1.setGrade("grade_1");
				classList.add(cls1);
				
				ClassBean cls2 = new ClassBean();
				cls2.setClassId("A0002");
				cls2.setClassName("�����Z");
				cls2.setGrade("grade_1");
				classList.add(cls2);
	            /*---------------------------------------------*/
				for(ClassBean csb:classList){
					JSONObject obj = new JSONObject();
					try{
						obj.put("classId",csb.getClassId());
						obj.put("grade", csb.getGrade());
						obj.put("className", csb.getClassName());
					}catch(Exception e){}
					array.add(obj);
				}
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}
		if("testTextArea".equals(request.getParameter("action"))){
			String textAreaStr = request.getParameter("content");
			request.setAttribute("textAreaStr", textAreaStr);
			RequestDispatcher rd = request.getRequestDispatcher("/TestTextArea.jsp");
			rd.forward(request, response);
		}
	}

}
