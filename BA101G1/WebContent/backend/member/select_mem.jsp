<%@page import="com.mem.model.MemberService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>吃訂我EatMe</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
    	<!-- LOGIN STYLES -->
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
     
       
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="<%=request.getContextPath() %>/backend/index.jsp">
                        <img src="<%=request.getContextPath() %>/backend/assets/img/LOGO_2.png" style="width: 180px;"/>

                    </a>
                    
                </div>
                
                <span class="logout-spn" >
                  <a href="#" data-toggle="modal" data-target="#login-modal">登入</a>  
                </span>
                
                
            </div>
        </div>
        </div>
        <!-- /. NAV TOP  -->
         <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
	                <c:forEach var="perm" items="${permList}">
						<c:if test="${perm.pa_id eq '0'}">
		                    <li class="active-link">
		                        <a href="<%=request.getContextPath() %>/backend/member/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 </a>
		                    </li>
		                </c:if>
					</c:forEach>
					
					<c:forEach var="perm" items="${permList}">
						<c:if test="${perm.pa_id eq '1'}">
			                <li>
			                        <a href="<%=request.getContextPath() %>/backend/store/store_index.jsp"><i class="fa fa-bar-chart-o"></i>商家會員管理</a>
			                </li>   
	                    </c:if>
					</c:forEach>
					
					<c:forEach var="perm" items="${permList}">
						<c:if test="${perm.pa_id eq '8'}">
		                    <li>
		                        <a href="<%=request.getContextPath() %>/backend/man/ListAllMan.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
		                    </li> 
		               </c:if>
					</c:forEach>
                         
		           	<c:forEach var="perm" items="${permList}">
						<c:if test="${perm.pa_id eq '9'}"> 
						                             
		                    <li>
		                        <a href="<%=request.getContextPath() %>/backend/memr/select_page.jsp"><i class="fa fa-bar-chart-o"></i>會員檢舉  </a>
		                    </li>
		                    <li>
		                        <a href="<%=request.getContextPath() %>/backend/str/selectPage.jsp"><i class="fa fa-bar-chart-o "></i>商家檢舉 </a>
		                    </li>
		                    
		                 </c:if>
					</c:forEach>
					
                    <li>
                        <a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><i class="fa fa-table "></i>一般訂單查詢</a>
                    </li>  
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>管理儲值交易no</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>銷售/統計no</a>
                    </li>      
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>錢包管理no</a>
                    </li>                                                                      
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/push/selectPage.jsp"><i class="fa fa-edit "></i>推播</a>
                    </li>                  
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/news/news_index.jsp"><i class="fa fa-bar-chart-o"></i>刊登最新消息</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/ad/listAllAd.jsp"><i class="fa fa-bar-chart-o"></i>廣告管理</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/rev/Select_Rev.jsp"><i class="fa fa-bar-chart-o"></i>商家月結算</a>
                    </li>
            <c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '8'}">

                    <li>
                        <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>權限管理</a>
                    </li>
                </c:if>
			</c:forEach>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/store_commit/store_commit_index.jsp"><i class="fa fa-bar-chart-o"></i>商家評價管理</a>
                    </li>
                                        
                </ul>
              </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     	<h2>後端管理者平台</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <!-- ******************select_man.jsp原先內容********************* -->

					<body bgcolor='white'>
					<table border='1' cellpadding='5' cellspacing='0' width='400'>
					  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
					    <td><h3>Group1 Member: Home</h3><font color=red>( MVC )</font></td>
					  </tr>
					</table>
					
					<p>This is the Home page for Group1 Man: Home</p>
					
					<h3>查詢</h3>
					<c:if test="${not empty errorMsgs }">
						<font color='red'>修正以下錯誤
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
						</font>
						</c:if>
						
					<ul>
						<li><a href="<%=request.getContextPath()%>/backend/member/listAllMember.jsp">List</a> all Manager</li><br><br>
                        
                        <a href="<%=request.getContextPath() %>/backend/member/listAllMemberState.jsp" ></i>列出全部待審核會員 </a>						
						
						<li>
							<form action="<%=request.getContextPath()%>/backend/member/member.do" method="post">
								<b>輸入會員編號(MEM-000001):</b>
								<input type="text" name="mem_id">
								<input type="submit" value="送出">
								<input type="hidden" name="action" value="getOne_For_Display">
							</form>
						</li>
					
						<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>
					
						<li>
							<form action="<%=request.getContextPath()%>/backend/member/member.do" method="post">
								<b>選擇會員編號:</b>
								<select size="1" name="mem_id">
									<c:forEach var="MemberVO" items="${memSvc.all }">
										<option value="${MemberVO.mem_id }">${MemberVO.mem_id }</option>
									</c:forEach>
								</select>
								<input type="submit" value="送出">
								<input type="hidden" name="action" value="getOne_For_Display">
							</form>
						</li>
						
						<li>
							<form method="post" action="<%=request.getContextPath()%>/backend/member/member.do">
								<b>選擇員工姓名:</b>
								<select size="1" name="mem_id">
									<c:forEach var="MemberVO" items="${memSvc.all }">
										<option value="${MemberVO.mem_id }">${MemberVO.mem_name}</option>
									</c:forEach>
								</select>
								<input type="submit" value="送出">
								<input type="hidden" name="action" value="getOne_For_Display">
							</form>
						</li>
					</ul>	
						<h3>會員管理</h3>
							<ul>
								<li><a href="<%=request.getContextPath()%>/backend/member/addMember.jsp">ADD</a> a new Mem</li>
							</ul>
				<!-- ******************select_man.jsp原先內容********************* -->

                </div>

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  2014 yourdomain.com | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/custom.js"></script>
    
<!-- ***************************Login***************************** -->              
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
   	  <div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>Login to Your Account</h1><br>
			  <form>
				<input type="text" name="user" placeholder="Username">
				<input type="password" name="pass" placeholder="Password">
				<input type="submit" name="login" class="login loginmodal-submit" value="Login">
			  </form>
				
			  <div class="login-help">
				<a href="#">Register</a> - <a href="#">Forgot Password</a>
			  </div>
			</div>
		</div>
	 </div>
<!-- ***************************Login***************************** -->    
</body>
</html>

