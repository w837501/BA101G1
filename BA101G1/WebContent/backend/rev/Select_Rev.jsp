<%@page import="com.rev.model.*"%>
<% 
session.setAttribute("man_id", "MAN-000001");
%>
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
                  ${manVO.man_id} ${manVO.man_name}
                  <a href="<%=request.getContextPath() %>/backend/man/login_man.jsp">登出</a>
                </span>
                
                
            </div>
        </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 


                    <li class="active-link">
                        <a href="<%=request.getContextPath() %>/backend/mem/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 <span class="badge">Included</span></a>
                    </li>
                   

                    <li>
                        <a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><i class="fa fa-table "></i>訂單管理  <span class="badge">Included</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/memr/select_memr.jsp"><i class="glyphicon glyphicon-thumbs-down"></i>會員檢舉  <span class="badge">Included</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/str/select_str.jsp"><i class="	glyphicon glyphicon-hand-down "></i>商家檢舉  <span class="badge">Included</span></a>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>審核管理<span class="badge">要連結哪個?</span></a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath() %>/backend/push/selectPage.jsp"><i class="fa fa-edit "></i>推播管理 </a>
                    </li>

                     <li>
                        <a href="#"><i class="fa fa-edit "></i>個人資料</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/rev/Select_Rev.jsp"><i class="fa fa-bar-chart-o"></i>商家月結算</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/man/select_man.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>權限管理</a>
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
								<td><h3>Group1 Manager: Home</h3> <font color=red>( MVC )</font></td>
							</tr>
						</table>
					
						<p>This is the Home page for Group1 Rev: Home</p>
					
						<h3>查詢</h3>
					
						<c:if test="${not empty errorMsgs }">
							<font color='red'>修正以下錯誤
								<ul>
									<c:forEach var="message" items="${errorMsgs }">
										<li>${message}</li>
									</c:forEach>
								</ul>
							</font>
						</c:if>
						<ul>
							<li><a href="ListAllRev.jsp">List</a> all Revenue</li>
							<br>
							<br>
					
							<li>
								<form action="rev.do" method="post">
									<b>輸入商家編號(STO-000001):</b> <input type="text" name="store_id" value="STO-000001">
									<input type="submit" value="送出"> 
									<input type="hidden"name="action" value="getStore_For_Display">
								</form>
							</li>
								<jsp:useBean id="revSvc" scope="page" class="com.rev.model.RevenueService"></jsp:useBean>
							<li>
								<form method="post" action="rev.do">
									<b>選擇商家編號:</b> <select size="1" name="store_id">
										<c:forEach var="RevenueVO" items="${revSvc.singleStore_id }">
											<option value="${RevenueVO.store_id }">${RevenueVO.store_id}</option>
										</c:forEach>
									</select> 
										<input type="submit" value="送出"> 
										<input type="hidden" name="action" value="getStore_For_Display">
								</form>
							</li>
							<li>
								<form action="rev.do" method="post">
									<b>輸入月份:</b> <select name="revenue_month">
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='6'>6</option>
										<option value='7'>7</option>
										<option value='8'>8</option>
										<option value='9'>9</option>
										<option value='10'>10</option>
										<option value='11'>11</option>
										<option value='12'>12</option>
									</select> 
										<input type="submit" value="送出"> 
										<input type="hidden" name="action" value="getMonth_For_Display">
								</form>
							</li>
							<li>
								<form action="rev.do" method="post">
									<b>輸入月份及商家編號:</b> 
									<select size="1" name="store_id">
										<c:forEach var="RevenueVO" items="${revSvc.singleStore_id }">
											<option value="${RevenueVO.store_id }">${RevenueVO.store_id}</option>
										</c:forEach>
									</select> 
									<select name="revenue_month">
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='6'>6</option>
										<option value='7'>7</option>
										<option value='8'>8</option>
										<option value='9'>9</option>
										<option value='10'>10</option>
										<option value='11'>11</option>
										<option value='12'>12</option>
									</select> 
										<input type="submit" value="送出"> 
										<input type="hidden" name="action" value="getOne_For_Display">
								</form>
							</li>
							<li>
								<form action="<%=request.getContextPath() %>/backend/rev/rev.do" method="post">
									<b>從取訂單營業額，輸入月份:</b> <select name="month">
										<option value='1月'>1</option>
										<option value='2月'>2</option>
										<option value='3月'>3</option>
										<option value='4月'>4</option>
										<option value='5月'>5</option>
										<option value='6'>6</option>
										<option value='7月'>7</option>
										<option value='8月'>8</option>
										<option value='9月'>9</option>
										<option value='10月'>10</option>
										<option value='11月'>11</option>
										<option value='12月'>12</option>
									</select> 
										<input type="submit" value="送出"> 
										<input type="hidden" name="action" value="getMonthRevenue_For_Display">
								</form>
								</li>
							
						</ul>
						<h3>管理</h3>
							<ul>
								<li><a href="AddRev.jsp">ADD</a> a new Rev</li>
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
    

</body>
</html>


