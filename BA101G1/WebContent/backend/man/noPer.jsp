<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.man.model.*"%>
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
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
    	<!-- LOGIN STYLES -->
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
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
<%--                 		<%=managerVO.getMan_id() %> --%>
<%-- 						<%=managerVO.getMan_name() %> --%>
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
                        <a href="<%=request.getContextPath() %>/backend/man/ListAllMan.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
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
                     	<h2>你沒有此權限喔</h2>   
                    </div>
                    <img src="https://s2.imgs.cc/img/qLf59uG.jpeg"></a>
                </div>              
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
    <script src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/custom.js"></script>
    
    
</body>
</html>


