<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>�Y�q�ڽu�W�q�\�t��</title>
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
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">�ק���</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">�d�߭q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">�d�����|</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7" >


				<div class="page-header"> 
					  <h1>�|����ƭק�</h1>
 				</div> 
				<form action="<%=request.getContextPath()%>/backend/mem/mem.do" method='post' name='form1'>
				<table border='0'>
					<tr>
						<td>�|���s��:<font color='red'><b>*</b></font></td>
						<td><%=memberVO.getMem_id() %></td>
					</tr>
					<tr>
						<td>�|���m�W:</td>
						<td><input type="TEXT" name="mem_name" size="45" value="<%=memberVO.getMem_name() %>"/></td>
					</tr>
					<tr>
						<td>�|���q��:</td>
						<td><input type="TEXT" name="mem_phone" size="45" value="<%=memberVO.getMem_phone() %>"/></td>
					</tr>
					<tr>
						<td>�|���K�X:</td>
						<td><input type="TEXT" name="mem_pw" size="45" value="<%=memberVO.getMem_pw() %>"/></td>
					</tr>
					<tr>
						<td>�|���H�c:</td>
						<td><input type="TEXT" name="mem_mail" size="45" value="<%=memberVO.getMem_mail() %>"/></td>
					</tr>
				</table>
				<br>
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
				<input type="submit"  value="�e�X�ק�">
				
				</form>
					


				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
