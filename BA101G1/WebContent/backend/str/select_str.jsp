<%@page import="com.man.model.ManagerService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store_report.model.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	StoreReportService srSvc = new StoreReportService();
	List<StoreReportVO> list = (List<StoreReportVO>) request.getAttribute("list4");
	pageContext.setAttribute("list",list);
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
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <!-- ******************select_man.jsp原先內容********************* -->

				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<div role="tabpanel">
							    <!-- 標籤面板：標籤區 -->
							    <ul class="nav nav-tabs" role="tablist">
							        <li role="presentation" class="active">
							        	<form action="<%=request.getContextPath()%>/backend/str/store_report.do" method="post">
											<a href="#tab1" onclick="parentNode.submit();" aria-controls="tab1" role="tab" data-toggle="tab">未審核&nbsp;&nbsp;</a>
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab1">
										</form> 
							        </li>

							        <li role="presentation">
							        	<form action="<%=request.getContextPath()%>/backend/str/store_report.do" method="post">
											<a href="#tab3" onclick="parentNode.submit();" aria-controls="tab3" role="tab" data-toggle="tab">已審核&nbsp;&nbsp;</a>
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab3">
										</form> 
							        </li>
							    </ul>
							    <!-- 標籤面板：內容區 -->
							    <div class="tab-content">
							        <div role="tabpanel" class="tab-pane active" id="tab1">
										<table class="table table-hover">
											<thead>
											<tr>
												<th>商家檢舉單號</th>
												<th>商家編號</th>
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
											</thead>
											<tbody>
											<c:forEach var="srVO" items="${list}" >
													<tr align='center' valign='middle' ${(srVO.sr_id==param.sr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
														<td>${srVO.sr_id}</td>
														<td>${srVO.store_id}</td>
														<td>${srVO.sc_id}</td>
														<td>${srVO.order_id}</td>
														<td>${srVO.man_id}</td>
														<td>${srVO.sr_content}</td>

														<td>
															<img src="<%=request.getContextPath() %>/MRDBGifReader?whichImg=str&id=${srVO.sr_id}" width="100">
														</td>
														<td>${srVO.sr_time}</td>
														<td>${srVO.sr_state}</td>
														 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/str/store_report.do">
														<td>
															<div data-toggle="buttons">
													          <label class="btn btn-default btn-circle btn-lg"><input type="radio" name="sr_result" value="成立" id="good" ${(srVO.sr_result == '成立')? 'checked' : '' }><i class="glyphicon glyphicon-ok"></i></label>
													          <label class="btn btn-default btn-circle btn-lg"><input type="radio" name="sr_result" value="不成立" id="bad" ${(srVO.sr_result == '不成立')? 'checked' : ''}><i class="glyphicon glyphicon-remove"></i></label>
													        </div>
														</td>			
											
														<td>
														  	 <input type="submit" value="確認修改"> 
														     <input type="hidden" name="sr_id" value="${srVO.sr_id}">
														     <input type="hidden" name="store_id" value="${srVO.store_id}">
														     <input type="hidden" name="sc_id" value="${srVO.order_id}">
														     <input type="hidden" name="order_id" value="${srVO.sc_id}">
														     <input type="hidden" name="man_id" value="${srVO.man_id}">
														     <input type="hidden" name="sr_content" value="${srVO.sr_content}">
														     <input type="hidden" name="sr_time" value="${srVO.sr_time}">
														     <input type="hidden" name="sr_state" value="${srVO.sr_state}">
														     <input type="hidden" name="action"	value="update">
														  </FORM>
														</td>
													</tr>
											</c:forEach>
											</tbody>
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
<style type="text/css">
      body{margin:40px;}
      .btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 12px;
        line-height: 1.428571429;
        border-radius: 15px;
      }
      .btn-circle.btn-lg {
        width: 50px;
        height: 50px;
        padding: 13px 13px;
        font-size: 18px;
        line-height: 1.33;
        border-radius: 25px;
      }
      .radio-toolbar label + input[type="radio"]:checked { 
    	background:gray !important;
	}

</style>

