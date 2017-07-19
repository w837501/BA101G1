<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
	Store_OrderService orderSvc=new Store_OrderService();
	String mem_id=memberVO.getMem_id();
	List<Store_OrderVO> store_orderVO=new LinkedList<Store_OrderVO>();
	 store_orderVO=orderSvc.getOrderByMem_id(mem_id);
	 pageContext.setAttribute("store_orderVO",store_orderVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script type="text/javascript">
$(document).ready(
		function() {
		});


</script>

</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div id="sidebar">
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
				<div id="main">


				<div class="page-header"> 
					  <h1>�|���q�����</h1>
 				</div> 
				
				 <table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>�q��s��</th>
		<th>�q�\�ɶ�</th>
		<th>���a�W��</th>
		<th>�`���B</th>
		<th>���\�覡</th>
		<th>�q�檬�A</th>
		<th>�����q��</th>
		<th>���|�Ӯa</th>
	</tr>
	<c:forEach var="store_orderVO1" items="${store_orderVO}" >
	<tr align='center' valign='middle' ${(store_orderVO1.order_id==param.order_id) ? 'bgcolor=#CCCCFF':''}>
		<td>
			<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO1.order_id}">${store_orderVO1.order_id}</a>
		</td>
		<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO1.order_time }"/></td>
 		<td>${store_orderVO1.store_name }</td>
		<td>${store_orderVO1.totalprice }</td>
		<td>${store_orderVO1.order_way }</td>
		<td>${store_orderVO1.order_state }</td>
		<td><c:if test="${store_orderVO1.order_state eq '���T�{'}">
			<form method="post" action="<%=request.getContextPath()%>/frontend/selectOrder/order.do">
							<input type="submit" value="�����q��">
							<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
							<input type="hidden" name="store_id" value="${store_orderVO1.store_id}">
							<input type="hidden" name="action" value="Cancel">
						</form>
			</c:if>
<%-- 			<c:if test="${store_orderVO1.order_state != '���T�{'}">�L�k����</c:if> --%>
		</td>
		<td><c:if test="${store_orderVO1.order_state eq '�w����'}">
			<form method="post" action="<%=request.getContextPath()%>/frontend/mem/member_addMR.jsp">
							<input type="submit" value="���|">
							<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
						</form>
		</c:if>
			<c:if test="${store_orderVO1.order_state eq '�w���\'}">
				<form method="post" action="<%=request.getContextPath()%>/frontend/mem/member_addMR.jsp">
								<input type="submit" value="���|">
								<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
				</form>
			</c:if>
			
<%-- 			<c:if test="${store_orderVO1.order_state != '�w����' &&store_orderVO1.order_state != '�w���\'}">�L�k���|</c:if> --%>
		</td>
	</tr>
	</c:forEach>

</table>
					


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
