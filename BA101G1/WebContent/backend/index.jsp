<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.man.model.*"%>
<%@ page import="com.permission.model.*" %>   
<%
//	ManagerVO managerVO = (ManagerVO)request.getAttribute("managerVO");
//	session.setAttribute("manVO" , managerVO);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>吃訂我EatMe</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    	<!-- LOGIN STYLES -->
    <link href="assets/css/login.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
     
           
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top" style="background-color: #ccc;">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="<%=request.getContextPath() %>/backend/index.jsp">
                        <img src="assets/img/LOGO_2.png" style="width: 180px;"/>

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
                        <a href="<%=request.getContextPath() %>/backend/mem/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 <span class="badge">Included</span></a>
                    </li>

                 </c:if>
			</c:forEach>
			<c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '9'}">
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/memr/select_memr.jsp"><i class="glyphicon glyphicon-thumbs-down"></i>會員檢舉  <span class="badge">Included</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/str/select_str.jsp"><i class="	glyphicon glyphicon-hand-down "></i>商家檢舉  <span class="badge">Included</span></a>
                    </li>
                </c:if>
			</c:forEach>

			<c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '10'}">

                   

                    <li>
                        <a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><i class="fa fa-table "></i>訂單管理  <span class="badge">Included</span></a>
                    </li>

 <!-- 收合式清單====檢舉管理============================== -->
                    <li class="panel panel-default panel-heading" role="tab" id="panel1">
     
                      <a href="#aaa" data-parent="#accordion2" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="aaa">
                        <i class="fa fa-edit "></i>檢舉管理  <span class="badge">Included</span>
                      </a>
                    
                      <div id="aaa" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="panel1">
                        <div class="list-group">
                          <a href="<%=request.getContextPath() %>/backend/memr/select_page.jsp" class="list-group-item">會員檢舉</a>
                          <a href="<%=request.getContextPath() %>/backend/str/selectPage.jsp" class="list-group-item">商家檢舉</a>                       
                        </div>
                      </div>                   
                    </li>
<!-- ================================== -->

                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>審核管理<span class="badge">要連結哪個?</span></a>
                    </li>
                </c:if>
			</c:forEach>
			
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/man/noPer.jsp"><i class="fa fa-edit "></i>假推播錯誤頁面 </a>
                    </li>
                    
            <c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '8'}">
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/man/ListAllMan.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>權限管理</a>
                    </li>
                </c:if>
			</c:forEach>






                    
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

                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                            <strong> 歪哥  之代辦事項</strong> You Have No pending Task For Today.
                        </div>
                    </div>
                    
<!-- ****************代辦事項************************ -->
                    <div class="col-md-4"> 

                         <div class="schedule">
                         	
								<div class="alert alert-success">
									<strong>件數</strong> 筆需要審核的商家
								</div>
								<div class="alert alert-info">
									<strong>件數</strong> 筆需要審核的會員
								</div>
								<div class="alert alert-warning">
									<strong>件數</strong> 筆需要審核的廣告
								</div>
								<div class="alert alert-danger">
									<strong>件數</strong> 筆需要審核的訂單
								</div>
                         </div>
                    </div>
                    <div class="col-md-8"> 
                    </div>
<!-- ****************代辦事項************************ -->
        </div>
        <!-- /. PAGE WRAPPER  -->

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
      
    
        
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
<!-- ***************************Login區塊************************************************************************ -->              
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
   	  <div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>這是登入畫面</h1><br>
				
			  <form method="post" action="<%=request.getContextPath() %>/backend/man/man.do">
				<input type="text" name="user" placeholder="請輸入帳號" id="accText">
				<input type="password" name="pass" placeholder="請輸入密碼" id="pwdText">
				<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				<input type="hidden" name="action" value="loginCHK">
			  </form>
			  <div class="login-help">
				  <button type="button" class="btn btn-lg btn-success">
						<a href="<%=request.getContextPath() %>/backend/man/register.jsp">Register</a>
				  </button>-
				  <button type="button" class="btn btn-lg btn-success">
						<a href="<%=request.getContextPath() %>/back end/man/register.jsp">Forgot Password</a>
				  </button>
			  </div>

			</div>
		</div>
	 </div>
<!-- ***************************Login區塊************************************************************************ -->    
</body>
</html>


