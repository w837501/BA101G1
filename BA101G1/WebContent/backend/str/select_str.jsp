<%@page import="com.man.model.ManagerService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store_report.model.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	StoreReportService srSvc = new StoreReportService();
	List<StoreReportVO> list = srSvc.getAll();
	pageContext.setAttribute("list",list);
	session.getAttribute("whichTab");
%>

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
                        <a href="<%=request.getContextPath() %>/backend/memr/select_page.jsp"><i class="glyphicon glyphicon-thumbs-down"></i>會員檢舉  <span class="badge">Included</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/str/selectPage.jsp"><i class="	glyphicon glyphicon-hand-down "></i>商家檢舉  <span class="badge">Included</span></a>
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


					
					  
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12">
								<div role="tabpanel">
								    <!-- 標籤面板：標籤區 -->
								    <ul class="nav nav-tabs" role="tablist">
								        <li role="presentation" class="active">
									  		<form action="store_report.do" method="post">
												<a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab" onclick="parentNode.submit();">待審核&nbsp;&nbsp; </a>
												<input type="hidden" name="action" value="listAll3">
												<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
												<input type="hidden" name="judge" value="tab1">
											</form>
								        </li>
								        <li role="presentation">
									  		<form action="store_report.do" method="post">
												<a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab" onclick="parentNode.submit();">審核中&nbsp;&nbsp; </a>
												<input type="hidden" name="action" value="listAll3">
												<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
												<input type="hidden" name="judge" value="tab2">
											</form>
								        </li>
								        <li role="presentation">
									  		<form action="store_report.do" method="post">
												<a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab" onclick="parentNode.submit();">已審核&nbsp;&nbsp; </a>
												<input type="hidden" name="action" value="listAll3">
												<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
												<input type="hidden" name="judge" value="tab3">
											</form>
								        </li>
								    </ul>
								
								    <!-- 標籤面板：內容區 -->
								    <div class="tab-content">
								        <div role="tabpanel" class="tab-pane active" id="tab1" href="javascript:;">
											<table border='1' bordercolor='#CCCCFF' width='1000'>
												<tr>
													<th>商家檢舉單號</th>
													<th>商家編號</th>
													<th>評論編號</th>
													<th>訂單編號</th>
													<th>管理員編號</th>
													<th>檢舉內容</th>
													<th>檢舉圖片</th>
													<th>檢舉時間</th>
													<th>檢舉審核狀態</th>
													<th>檢舉結果</th>
													<th>修改</th>
													<th>刪除</th>
												</tr>
													<c:forEach var="srVO" items="${list}">
														<tr align='center' valign='middle' ${(srVO.sr_id==param.sr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
															<c:set var="a1" value="${srVO.sr_state}"></c:set>
															<c:if test="${(whichTab eq '未審核') && (srVO.sr_state eq '未審核')}">
																<td>${srVO.sr_id}</td>
																<td>${srVO.store_id}</td>
																<td>${srVO.sc_id}</td>
																<td>${srVO.order_id}</td>
																<td>${srVO.man_id}</td>
																<td>${srVO.sr_content}</td>			
																<td>
																	${srVO.sr_image}
																</td>			
																<td>${srVO.sr_time}</td>			
																<td>${srVO.sr_state}</td>			
																<td>${srVO.sr_result}</td>			
													
																<td>
																  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
																     <input type="submit" value="修改"> 
																     <input type="hidden" name="sr_id" value="${srVO.sr_id}">
																     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
																     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																</td>
																<td>
																  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
																    <input type="submit" value="刪除">
																    <input type="hidden" name="sr_id" value="${srVO.sr_id}">
																    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
																    <input type="hidden" name="action"value="delete"></FORM>
																</td>
															</c:if>
														</tr>
													</c:forEach>
											</table>
										</div>
		
								        <div role="tabpanel" class="tab-pane" id="tab2">
								        	<table border='1' bordercolor='#CCCCFF' width='1000'>
												<tr>
													<th>商家檢舉單號</th>
													<th>商家編號</th>
													<th>評論編號</th>
													<th>訂單編號</th>
													<th>管理員編號</th>
													<th>檢舉內容</th>
													<th>檢舉圖片</th>
													<th>檢舉時間</th>
													<th>檢舉審核狀態</th>
													<th>檢舉結果</th>
													<th>修改</th>
													<th>刪除</th>
												</tr>
												<c:forEach var="srVO" items="${list}">
													<c:if test="${(whichTab eq '審核中')&& (srVO.sr_state eq '審核中')}">
														<tr align='center' valign='middle' ${(srVO.sr_id==param.sr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
															<td>${srVO.sr_id}</td>
															<td>${srVO.store_id}</td>
															<td>${srVO.sc_id}</td>
															<td>${srVO.order_id}</td>
															<td>${srVO.man_id}</td>
															<td>${srVO.sr_content}</td>			
															<td>${srVO.sr_image}</td>			
															<td>${srVO.sr_time}</td>			
															<td>${srVO.sr_state}</td>			
															<td>${srVO.sr_result}</td>			
												
															<td>
															  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
															     <input type="submit" value="修改"> 
															     <input type="hidden" name="sr_id" value="${srVO.sr_id}">
															     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
															     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
															</td>
															<td>
															  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
															    <input type="submit" value="刪除">
															    <input type="hidden" name="sr_id" value="${srVO.sr_id}">
															    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
															    <input type="hidden" name="action"value="delete"></FORM>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</table>
										</div>
								        <div role="tabpanel" class="tab-pane" id="tab3">
								        	<table border='1' bordercolor='#CCCCFF' width='1000'>
												<tr>
													<th>商家檢舉單號</th>
													<th>商家編號</th>
													<th>評論編號</th>
													<th>訂單編號</th>
													<th>管理員編號</th>
													<th>檢舉內容</th>
													<th>檢舉圖片</th>
													<th>檢舉時間</th>
													<th>檢舉審核狀態</th>
													<th>檢舉結果</th>
													<th>修改</th>
													<th>刪除</th>
												</tr>
												<c:forEach var="srVO" items="${list}">
													<c:if test="${(whichTab eq '已審核')&& (srVO.sr_state eq '已審核')}">
														<tr align='center' valign='middle' ${(srVO.sr_id==param.sr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
															<td>${srVO.sr_id}</td>
															<td>${srVO.store_id}</td>
															<td>${srVO.sc_id}</td>
															<td>${srVO.order_id}</td>
															<td>${srVO.man_id}</td>
															<td>${srVO.sr_content}</td>			
															<td>${srVO.sr_image}</td>			
															<td>${srVO.sr_time}</td>			
															<td>${srVO.sr_state}</td>			
															<td>${srVO.sr_result}</td>			
												
															<td>
															  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
															     <input type="submit" value="修改"> 
															     <input type="hidden" name="sr_id" value="${srVO.sr_id}">
															     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
															     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
															</td>
															<td>
															  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
															    <input type="submit" value="刪除">
															    <input type="hidden" name="sr_id" value="${srVO.sr_id}">
															    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
															    <input type="hidden" name="action"value="delete"></FORM>
															</td>
														</tr>
													</c:if>
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


