<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.member_report.model.*"%>
<%@ page import="java.util.*"%>
<% 
MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
MemberReportService memberreportSvc=new MemberReportService();
String mem_id=memberVO.getMem_id();
List<MemberReportVO> memberreportVO=new LinkedList<MemberReportVO>();
memberreportVO=memberreportSvc.getMemberReportByMem_id(mem_id);
 pageContext.setAttribute("memberreportVO",memberreportVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">修改資料</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">查詢訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">查詢檢舉</a>
					</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>會員檢舉紀錄</h1>
 				</div> 
				<table border='1' bordercolor='#CCCCFF' width='600'>
					<tr>
						<th>會員檢舉單號</th>
						<th>訂單編號</th>
						<th>評論編號</th>
						<th>檢舉內容</th>
						<th>檢舉圖片</th>
						<th>檢舉時間</th>
						<th>檢舉審核狀態</th>
						<th>檢舉結果</th>
					</tr>
				 <c:forEach var="member_reportVO" items="${memberreportVO}" >
					<tr align='center' valign='middle'${(member_reportVO.mr_id==param.mr_id)?'bgcolor=#CCCCFF':'' }>
						<td>${member_reportVO.mr_id }</td>
						<td>${member_reportVO.order_id }</td>
						<td>${member_reportVO.sc_id }</td>
						<td>${member_reportVO.mr_content}</td>
						<td>${member_reportVO.mr_image }</td>
						<td>${member_reportVO.mr_time }</td>
						<td>${member_reportVO.mr_state }</td>
						<td>${member_reportVO.mr_result }</td>
					</tr>
					</c:forEach>
				
				</table>
					

				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
