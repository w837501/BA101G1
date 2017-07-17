<%@page import="com.mem.model.MemberService"%>
<%@ page import="com.man.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member_report.model.*"%>
<%
	MemberReportService mrSvc = new MemberReportService();
	List<MemberReportVO> list = (List<MemberReportVO>) request.getAttribute("list3");
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
                     	<h2>會員檢舉資料</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <!-- ******************select_man.jsp原先內容********************* -->

				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<div role="tabpanel">
							    <!-- 標籤面板：標籤區 -->
							    <ul class="nav nav-tabs" role="tablist">
							        <li role="presentation" class="active">
							        	<form action="member_report.do" method="post">
											<a href="#tab1" onclick="parentNode.submit();" aria-controls="tab1" role="tab" data-toggle="tab">未審核&nbsp;&nbsp;</a>
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab1">
										</form> 
							        </li>
							        <li role="presentation">
							        	<form action="member_report.do" method="post">
											<a href="#tab2" onclick="parentNode.submit();" aria-controls="tab2" role="tab" data-toggle="tab">審核中&nbsp;&nbsp;</a>
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab2">
										</form> 
							        </li>
							        <li role="presentation">
							        	<form action="member_report.do" method="post">
											<a href="#tab3" onclick="parentNode.submit();" aria-controls="tab3" role="tab" data-toggle="tab">已審核&nbsp;&nbsp;</a>
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab3">
										</form> 
							        </li>
							    </ul>
							
							    <!-- 標籤面板：內容區 -->
							    <div class="tab-content">
							        <div role="tabpanel" class="tab-pane active" id="tab1">
										<table border='1' bordercolor='#CCCCFF' width='1000'>
											<tr>
												<th>會員檢舉單號</th>
												<th>會員編號</th>
												<th>訂單編號</th>
												<th>評論編號</th>
												<th>管理員編號</th>
												<th>檢舉內容</th>
												<th>檢舉圖片</th>
												<th>檢舉時間</th>
												<th>審核狀態</th>
												<th>檢舉結果</th>
												<th>修改</th>
												<th>刪除</th>
											</tr>
											<c:forEach var="mrVO" items="${list}" >
													<tr align='center' valign='middle' ${(mrVO.mr_id==param.mr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
														<td>${mrVO.mr_id}</td>
														<td>${mrVO.mem_id}</td>
														<td>${mrVO.order_id}</td>
														<td>${mrVO.sc_id}</td>
														<td>${mrVO.man_id}</td>
														<td>${mrVO.mr_content}</td>

														<td>
<%-- 															   <img src="<%=request.getContextPath()%>/backend/memr/member_report.do?action=readPic&mr_id=${mrVO.mr_id}" width="250"/> --%>
															<img src="<%=request.getContextPath() %>/MRDBGifReader?whichImg=memr&id=${mrVO.mr_id}" width="100">
														</td>
														<td>${mrVO.mr_time}</td>
														<td>${mrVO.mr_state}</td>
														<td>${mrVO.mr_result}</td>			
											
														<td>
														  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do">
														     <input type="submit" value="修改"> 
														     <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
														     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
														</td>
														<td>
														  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do">
														    <input type="submit" value="刪除">
														    <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
														    <input type="hidden" name="action"value="delete"></FORM>
														</td>
													</tr>
											</c:forEach>
										</table>
									</div>
							        
							    </div>
							</div>
						</div>
					</div>
				</div>
				<!-- ******************select_man.jsp原先內容********************* -->
                </div>
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


