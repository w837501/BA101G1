<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.man.model.*"%>
<%@ page import="java.util.*"%>
<%
//	ManagerVO managerVO = (ManagerVO)request.getAttribute("managerVO");
//	session.setAttribute("manVO" , managerVO);
%>
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
                     	<h2>Backend_Index</h2>   
                    </div>
                </div>              
                    <div class="col-lg-12 ">

                    </div>
                    
<!-- ****************代辦事項div************************ -->
<!-- ****************廣告審核(使用listSize取值)************************ -->
<%@ page import="com.ad.model.*"%>
	<%  AdService adSvc = new AdService();
//		List<AdVO> list = adSvc.getAllUncheckedAd();
//		Integer listSize = list.size();
//		pageContext.setAttribute("listSize", listSize); %>
		
                    <div class="col-md-4"> 

                         <div class="schedule">
                         
								<div class="alert alert-danger">
									目前有
                                    ${listSize}									
									筆待審核的廣告  <a href="<%=request.getContextPath() %>/backend/ad/listAllUncheckedAd.jsp">點我開啟</a>
								
								</div>	                         
<!-- ****************廣告審核************************ -->
<%-- <!-- ****************會員審核(使用SQL select count(*)取值)************************ -->
<%@ page import="com.mem.model.*" %>
<% MemberService memberSvc = new MemberService(); 
   Integer count = memberSvc.getAllUncheckedCount();
   pageContext.setAttribute("count" , count);%>
								<div class="alert alert-info">
									目前有
									${count}
									 筆待審核的會員   <a href="<%=request.getContextPath() %>/backend/member/listAllMemberState.jsp">點我前往</a>
								</div>
<!-- ****************會員審核************************ --> --%>
<!-- ****************商家審核(使用SQL select count(*)取值)************************ -->
<%@ page import="com.store.model.*"%>
	<%  StoreService storeSvc = new StoreService();
//		Integer storecount = storeSvc.getAllUncheckedCount();
//		pageContext.setAttribute("storecount", storecount); %>
                         	
								<div class="alert alert-success">
								    目前有
								  ${storecount}
								    筆待審核的商家   <a href="<%=request.getContextPath() %>/backend/store/listAllStoreState.jsp">點我前往</a>
								</div>
                         </div>
                    </div>
                    <div class="col-md-8"> 
                    </div>
<!-- ****************商家審核************************ -->                    
<!-- ****************代辦事項div************************ -->

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


