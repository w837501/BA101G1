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
    	<!-- LOGIN STYLES -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/login.js"></script>
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
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
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<div role="tabpanel">
							    <!-- 標籤面板：標籤區 -->
							    <ul class="nav nav-tabs" role="tablist" style="margin-top : 10px;">
							        <li role="presentation" class="active">
							        	<form action="<%=request.getContextPath() %>/member_report/member_report.do" method="post">
											<a href="#tab1" onclick="parentNode.submit();" aria-controls="tab1" role="tab" data-toggle="tab" class="btn btn-large btn-primary">未審核</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab1">
										</form> 
							        </li>
									
							        <li role="presentation">
							        	<form action="<%=request.getContextPath() %>/member_report/member_report.do" method="post">
											<a href="#tab3" onclick="parentNode.submit();" aria-controls="tab3" role="tab" data-toggle="tab" class="btn btn-large btn-primary">已審核</a>
											<input type="hidden" name="action" value="listAll3">
											<input type="hidden" name="whichTab" value="tab3">
										</form> 
							        </li>
							    </ul>
							
							    <!-- 標籤面板：內容區 -->
							    <div class="tab-content">
							        <div role="tabpanel" class="tab-pane active" id="tab1">
										<table border='1' bordercolor='#CCCCFF' width='1250' style="margin-top : 10px;">
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
														  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do">
														<td>
															<div class="well">${(mrVO.mr_result eq null) ? '請勾選' : (mrVO.mr_result)}</div>
													        <div data-toggle="buttons">
													          <label class="btn btn-default btn-circle btn-lg good"><input type="radio" name="mr_result" value="成立" ${(mrVO.mr_result == '成立')? 'checked' : '' } onchange="handleChange1()"><i class="glyphicon glyphicon-ok"></i></label>
													          <label class="btn btn-default btn-circle btn-lg bad" ><input type="radio" name="mr_result" value="不成立" ${(mrVO.mr_result == '不成立')? 'checked' : ''} onchange="handleChange1()"><i class="glyphicon glyphicon-remove" ></i></label>
													        </div>
														</td>
															
															
															<td>
															     <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
															     <input type="hidden" name="mem_id" value="${mrVO.mem_id}">
															     <input type="hidden" name="order_id" value="${mrVO.order_id}">
															     <input type="hidden" name="sc_id" value="${mrVO.sc_id}">
															     <input type="hidden" name="man_id" value="${mrVO.man_id}">
															     <input type="hidden" name="mr_content" value="${mrVO.mr_content}">
															     <input type="hidden" name="mr_time" value="${mrVO.mr_time}">
															     <input type="hidden" name="mr_state" value="${mrVO.mr_state}">
															     <input type="hidden" name="action"	value="update">
															     <input type="submit" value="確認修改" disabled="${(mrVO.mr_state eq '已審核') ? 'disabled' : ''}"> 
															  </FORM>
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
<!-- ****************內頁************************ -->
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
    
    	<script src="https://code.jquery.com/jquery.js"></script>
    
</body>
</html>
<style type="text/css">
      body{margin:0px;}
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

</style>
<script>
$(".good").on('click',function(){   //選取id為demo的元素，並且綁定onclick事件。
	   $(this).css("background-color","yellowgreen");  //將id為demo的元素，其背景顏色設為紅色。
	   $(".bad").css("background-color","white");  //將id為demo的元素，其背景顏色設為紅色。
});
$(".bad").on('click',function(){   //選取id為demo的元素，並且綁定onclick事件。
	   $(this).css("background-color","yellowgreen");  //將id為demo的元素，其背景顏色設為紅色。
	   $(".good").css("background-color","white");  //將id為demo的元素，其背景顏色設為紅色。
});
</script>

