<%@ page  contentType="text/html; charset=BIG5"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="store_start_time" scope="page" class="java.util.Date" />
<jsp:useBean id="store_end_time" scope="page" class="java.util.Date" /> 
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_class.model.*"%>

<%
StoreVO storeVO = (StoreVO) request.getAttribute("storeVO"); 
%>

<jsp:useBean id="scsSvc" scope="page" class="com.store_class.model.StoreClassService" />

<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">�Ӯa</a>
<a href="<%=request.getContextPath()%>/backend/store/listAllStore.jsp">�C�X�����Ӯa</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a>

<html>
<head>
  <title>�Y�q��EatMe</title>
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

                        ${manVO.man_id} ${manVO.man_name}
                  <a href="<%=request.getContextPath() %>/backend/man/login_man.jsp">�n�X</a>
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
                                <a href="<%=request.getContextPath() %>/backend/member/select_mem.jsp" ><i class="fa fa-desktop "></i>�|���޲z </a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '1'}">
                            <li>
                                    <a href="<%=request.getContextPath() %>/backend/store/store_index.jsp"><i class="fa fa-bar-chart-o"></i>�Ӯa�|���޲z</a>
                            </li>   
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/man/ListAllMan.jsp"><i class="fa fa-bar-chart-o"></i>�޲z���޲z</a>
                            </li> 
                       </c:if>
                    </c:forEach>
                         
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '9'}"> 
                                                     
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/memr/select_memr.jsp"><i class="fa fa-bar-chart-o"></i>�|�����| </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/str/select_str.jsp"><i class="fa fa-bar-chart-o"></i>�Ӯa���|</a>
                            </li>
                            
                         </c:if>
                    </c:forEach>
                            
                   <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '3'}">                                  
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/news/news_index.jsp"><i class="fa fa-bar-chart-o"></i>�Z�n�̷s����</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '4'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/ad/listAllAd.jsp"><i class="fa fa-bar-chart-o"></i>�s�i�޲z</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>�v���޲z</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '10'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/store_commit/store_commit_index.jsp"><i class="fa fa-bar-chart-o"></i>�Ӯa�����޲z</a>
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
                        <!-- <h2></h2>  �������D  -->
                    </div>
                </div>              
                    <div class="col-lg-12 ">

                    </div>
                    
<!-- ****************����************************ -->




<table class="table table-hover">
	<tr>
		<th>�s��</th>
		<th>���O</th>
		<th>�W��</th>
		<th>²��</th>
		<th>�q��</th>
		<th>�a�}</th>
		<th>�i�n���</th>
		<th>�P�P��</th>
		<!-- <th>��������</th> -->
		<th>���A</th>
		<th>�Ӥ�</th>
		<th>�Q���|����</th>
<!-- 		<th>�Ӯa���v�}�l���</th>
		<th>�Ӯa���v�������</th> -->
<!-- 		<th>�Ӯa�K�X</th>
		<th>�Ӯa�b��</th> -->
		<th>�Ӯa�~�e</th>
		<th>�Ӯa�a��</th>
	</tr>
	<tr align='center' valign='middle'>
			<td>${storeVO.store_id}</td>
			<td>${scsSvc.getOneStoreClass(storeVO.sc_id).sc_name}</td>
			<td>${storeVO.store_name}</td>
			<td>${storeVO.store_content}</td>
			<td>${storeVO.store_phone}</td>
			<td>${storeVO.store_addr}</td>
			<td>${storeVO.store_date}</td>
			<td>${storeVO.store_star}</td>
			<%-- <td>${storeVO.store_count}</td> --%>
            <td>${storeVO.store_state}</td>
			<td><img src='<%=request.getContextPath()%>/store?store_id=${storeVO.store_id}' height="70"></td>
			<td>${storeVO.store_report_count}</td>
<%-- 			<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm" value="${storeVO.store_start_time}"/></td>
			<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm" value="${storeVO.store_end_time}"/></td> --%>
<%-- 			<td>${storeVO.store_pw}</td>
			<td>${storeVO.store_acc}</td> --%>
            <td>${storeVO.store_out}</td>
            <td>${storeVO.store_zone}</td>
	</tr>
</table>




        
<!-- ****************����************************ -->

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