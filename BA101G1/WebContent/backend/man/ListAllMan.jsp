<%@page import="com.man.model.ManagerService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.man.model.*" %>    
<%
	ManagerService manSvc=new ManagerService();
	List<ManagerVO> list=manSvc.getAll();
	pageContext.setAttribute("list", list);
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
    <script src="<%=request.getContextPath() %>/backend/assets/js/login.js"></script>
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <script type="text/javascript">
	$(document)
			.ready(
					function() {
						if (window.location.hash != "") {
							$('a[href="' + window.location.hash + '"]').click()
						}
					});
	</script>
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
                                <a href="<%=request.getContextPath() %>/backend/memr/select_memr.jsp"><i class="fa fa-bar-chart-o"></i>會員檢舉 </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/str/select_str.jsp"><i class="fa fa-bar-chart-o"></i>商家檢舉</a>
                            </li>
                            
                         </c:if>
                    </c:forEach>
                            
                   <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '3'}">                                  
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/news/news_index.jsp"><i class="fa fa-bar-chart-o"></i>刊登最新消息</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '4'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/ad/listAllAd.jsp"><i class="fa fa-bar-chart-o"></i>廣告管理</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>權限管理</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '10'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/store_commit/store_commit_index.jsp"><i class="fa fa-bar-chart-o"></i>商家評價管理</a>
                            </li>
                         </c:if>
                    </c:forEach>
                                   
                </ul>
              </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- <h2></h2>  內頁標題  -->
                    </div>
                </div>              
                    <div class="col-lg-12 ">

                    </div>
                    
<!-- ****************內頁************************ -->
<br>
				<table  class="table table-hover">
					<tr>
						<th>管理員編號</th>
						<th>管理員名字</th>
						<th>管理員電話</th>
						<th>密碼</th>
						<th>信箱</th>
					</tr>
					<c:forEach var="ManagerVO" items="${list}">
						<tr align='center' valign='middle'>
							<td>${ManagerVO.man_id }</td>
							<td>${ManagerVO.man_name }</td>
						    <td>${ManagerVO.man_phone }</td>
						    <td>${ManagerVO.man_pw }</td>
						    <td>${ManagerVO.man_mail }</td>
							</tr>
					</c:forEach>
				</table>
<!-- ****************內頁************************ -->

        </div>
        <!-- /. PAGE WRAPPER  -->

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
        </div>
     <!-- /. WRAPPER  -->

    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/custom.js"></script>
    
    
</body>
</html>


