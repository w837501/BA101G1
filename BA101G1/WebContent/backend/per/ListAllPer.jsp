<%@ page import="com.man.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.permission.model.*" %>   
<%@ page import="com.permission_ability.model.*" %>   
<%
	PermissionService pSvc = new PermissionService();
	List<PermissionVO> list = pSvc.getAll();
	pageContext.setAttribute("list", list);
	
	ManagerService mSvc = new ManagerService();
	List<ManagerVO> listman = mSvc.getAll();
	pageContext.setAttribute("listman", listman);
%>
<jsp:useBean id="paSvc" scope="page" class="com.permission_ability.model.PermissionAbilityDAO" />
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
    <script type="text/javascript" src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.7.2.min.js"></script>
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
					<table class="table table-hover">
						<tr align='center' valign='middle' >
							<th>管理員編號 - name</th>
							<th>權限編號 - 名稱</th>
							<th></th>
						</tr>
						<c:forEach var="PermissionVO" items="${list}">
							<tr align='center' valign='middle' >
								<c:if test="${manVO.man_id eq PermissionVO.man_id}">
									<td>【${PermissionVO.man_id } - ${manVO.man_name}】</td>
									<td>
										<c:forEach var="Permission_AbilityVO" items="${paSvc.all}">
						                    <c:if test="${PermissionVO.pa_id==Permission_AbilityVO.pa_id}">
							                    	【${Permission_AbilityVO.pa_id } - ${Permission_AbilityVO.pa_name}】
						                    </c:if>
						                </c:forEach>
									</td>

									<td>
										<form method="post" action="<%=request.getContextPath()%>/backend/per/p.do">
											<input type="submit" value="刪除">
											<input type="hidden" name="man_id" value="${manVO.man_id }">
											<input type="hidden" name="pa_id" value="${PermissionVO.pa_id }">
											<input type="hidden" name="action" value="delete">
										</form>	
									</td>
								</c:if>
					
							</tr>
						</c:forEach>
					</table>
					
					<table class="table table-hover">
							<caption>權限 新增--刪除</caption>
							<thead>
								<tr>
									<th>管理員編號 - name</th>
									<th>權限編號 - 名稱</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<form method="post" action="<%=request.getContextPath()%>/backend/per/p.do">
										<td>
											<select size="1" name="man_id">
												<c:forEach var="managerVO" items="${listman}">
													<option value="${managerVO.man_id}" ${(manVO.man_id==managerVO.man_id)? 'selected':'' } >${managerVO.man_id}-${managerVO.man_name}
												</c:forEach>
											</select>

										</td>
										<td>
											<select size="1" name="pa_id">
<%-- 												<c:forEach var="PermissionVO" items="${list}"> --%>
													<c:forEach var="Permission_AbilityVO" items="${paSvc.all}">
<%-- 									                    <c:if test="${PermissionVO.pa_id eq Permission_AbilityVO.pa_id}"> --%>
									                    	<option value="${Permission_AbilityVO.pa_id}" ${(Permission_AbilityVO.pa_id eq PermissionVO.pa_id)? 'selected':'' } >
										                    	【${Permission_AbilityVO.pa_id } - ${Permission_AbilityVO.pa_name}】
<%-- 									                    </c:if> --%>
									                </c:forEach>
<%-- 								                </c:forEach> --%>
											</select>
										</td>
										<td>
												<input type="submit" value="新增">
												<input type="hidden" name="man_id" value="${manVO.man_id }">
												<input type="hidden" name="pa_id" value="${PermissionVO.pa_id }">
												<input type="hidden" name="action" value="insert">
										</td>
									</form>	
								</tr>
							</tbody>
							
							<tbody>
								<tr>
									<form method="post" action="<%=request.getContextPath()%>/backend/per/p.do">
										<td>
											<select size="1" name="man_id" id="grade">
												<c:forEach var="managerVO" items="${listman}">
													<option value="${managerVO.man_id}" ${(manVO.man_id==managerVO.man_id)? 'selected':'' } >${managerVO.man_id}-${managerVO.man_name}
												</c:forEach>
											</select>
										</td>
										<td>
											<select size="1" name="pa_id" id="class">
<%-- 												<c:forEach var="PermissionVO" items="${list}"> --%>
													<c:forEach var="Permission_AbilityVO" items="${paSvc.all}">
<%-- 									                    <c:if test="${PermissionVO.pa_id eq Permission_AbilityVO.pa_id}"> --%>
									                    	<option value="${Permission_AbilityVO.pa_id}" ${(Permission_AbilityVO.pa_id==PermissionVO.pa_id)? 'selected':'' } >
										                    	【${Permission_AbilityVO.pa_id } - ${Permission_AbilityVO.pa_name}】
<%-- 									                    </c:if> --%>
									                </c:forEach>
<%-- 								                </c:forEach> --%>
											</select>
											
											
		
											
										</td>
										<td>
											<input type="submit" value="刪除">
											<input type="hidden" name="action" value="delete">
										</td>
									</form>	
								</tr>
							</tbody>
						</table>
						
<!-- *********************include頁面******************* -->
<form action="<%=request.getContextPath() %>/backend/perA/pa.do" method="post">
	<a href="#" onclick="parentNode.submit();">新增權限</a>
	<input type="hidden" name="action" value="addPA">
</form> 
<form action="<%=request.getContextPath() %>/backend/perA/pa.do" method="post">
	<a href="#" onclick="parentNode.submit();">列出權限</a>
	<input type="hidden" name="action" value="listPA">
</form> 
<%if ("新增單一權限功能"==request.getAttribute("whichPage")){%>
       <jsp:include page="/backend/perA/addPA.jsp" />
<%} %>
<%if ("列出權限功能"==request.getAttribute("whichPage")){%>
       <jsp:include page="/backend/perA/ListAllPA.jsp" />
<%} %>

<!-- *********************include頁面******************* -->
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

