<%@page import="com.man.model.ManagerService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>吃訂我EatMe</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
    	<!-- LOGIN STYLES -->
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
    <script src="<%=request.getContextPath() %>/backend/assets/js/login.js"></script>
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
                        <a href="<%=request.getContextPath() %>/backend/mem/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 <span class="badge">Included</span></a>
                    </li>
                 </c:if>
			</c:forEach>

			<c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '7'}">
                    <li>
                        <a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><i class="fa fa-table "></i>訂單管理  <span class="badge">Included</span></a>
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
			
			<c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '3'}">
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/push/selectPage.jsp"><i class="fa fa-edit "></i>推播管理 </a>
                    </li>
                </c:if>
			</c:forEach>

			<c:forEach var="perm" items="${permList}">
				<c:if test="${perm.pa_id eq '5'}">
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/rev/Select_Rev.jsp"><i class="fa fa-bar-chart-o"></i>商家月結算</a>
                    </li>
                </c:if>
			</c:forEach>
                    
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
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <!-- ******************select_man.jsp原先內容********************* -->
					<body bgcolor='white'>
					
					<table border='1' cellpadding='5' cellspacing='0' width='400'>
					  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
					    <td><h3>IBM Push: Home</h3><font color=red>( MVC )</font></td>
					  </tr>
					</table>
					
					<p>This is the Home page for IBM Push: Home</p>
					
					<h3>資料查詢:</h3>
					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
					  <font color='red'>請修正以下錯誤:
					  <ul>
					  <c:forEach var="message" items="${errorMsgs}">
					    <li>${message}</li>
					  </c:forEach>
					  </ul>
					  </font>
					</c:if>
					
					<ul>
					  <li><a href='<%=request.getContextPath()%>/backend/push/ListAllPush.jsp'>List</a> all Pushes. </li> <br><br>
					  
					  <li>
					    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do" >
					        <b>輸入推播編號 (如PUS-000001):</b>
					        <input type="text" name="push_id">
					        <input type="submit" value="送出">
					        <input type="hidden" name="action" value="getOne_For_Display">
					    </FORM>
					  </li>
					
					  <jsp:useBean id="pushSvc" scope="page" class="com.push.model.PushService" />
					   
					  <li>
					     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do" >
					       <b>選擇推播編號:</b>
					       <select size="1" name="push_id">
					         <c:forEach var="pushVO" items="${pushSvc.all}" > 
					          <option value="${pushVO.push_id}">${pushVO.push_id}
					         </c:forEach>   
					       </select>
					       <input type="submit" value="送出">
					       <input type="hidden" name="action" value="getOne_For_Display">
					    </FORM>
					  </li>
					  
					  <li>
					     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do" >
					       <b>選擇管理員編號:</b>
					       <select size="1" name="push_id">
					         <c:forEach var="pushVO" items="${pushSvc.all}" > 
					          <option value="${pushVO.man_id}">${pushVO.man_id}
					         </c:forEach>   
					       </select>
					       <input type="submit" value="送出">
					       <input type="hidden" name="action" value="getOne_For_Display">
					       
					       <p>尚未增加 選擇管理員編號 此功能</p>
					     </FORM>
					  </li>
					  
					</ul>
					
					
					<h3>推播管理</h3>
					
					<ul>
					  <li><a href='<%=request.getContextPath()%>/backend/push/addPush.jsp'>Add</a> a new Push.</li>
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

