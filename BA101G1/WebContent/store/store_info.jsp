<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<% 
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>

<style>
	#mem-button{
		display:table-cell;
		vertical-align: middle;
	}
	#mem-button div{
		border-width:2px;
		border-style:solid;
		border-color:#fff;
		width:150px;
		height:40px;
		margin:0 auto;
		color:#fff;
		font-size:15px;
		line-height: 40px;
		text-align: center;
		background: #D6656A;
		border-radius: 5px;
		margin-bottom: 30px;
	}

	a{
		text-decoration:none;
	}
	
</style>

<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_store.jsp"></jsp:include>
		</div>

		<div class="contents" style="margin-top:30px;margin-bottom:900px;">
			
			<div id="mem-button" style="margin-left:50px;float:left;">
						
				<h1>�ڪ��b��</h1><br>
							
				<a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">
					<div>�ק���</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">
					<div>�d�ߩҦ��ӫ~</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">
					<div>�d�ߩҦ��q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">
					<div>�d�ߥ��T�{�q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">
					<div>�d�߶i�椤�q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">
					<div>�d�ߤw�����q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">
					<div>�d�����|</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">
					<div>�ӫ~�s�W</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_insert_ad.jsp " class="list-group-item">
					<div>�s�i�s�W</div>
				</a>
			
			</div>
			
			<div style="width:650px;float:right;margin-top:20px;margin-right:50px;">
				<div> 
					<h3><%=storeVO.getStore_name() %>���</h3>
					<hr color="#FFFFFF">
		 		</div> 
	 			
	 			<div>
	 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
					<table border='0'>
						<tr>
							<td><img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;"></td>
							
						</tr>
						<tr>
							<td>�Ӯa�s��</td>
							<td><%=storeVO.getStore_id() %></td>
						</tr>
						<tr>
							<td>�Ӯa�W��</td>
							<td><%=storeVO.getStore_name() %></td>
						</tr>
						
						<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
						
						<tr>
							<td>�Ӯa���O</td>
							<td>
								<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
									<c:if test="${StoreClassVO.sc_id eq storeVO.sc_id }">
										<option value="${StoreClassVO.sc_id}" >${StoreClassVO.sc_name}
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>�Ӯa�b��</td>
							<td><%=storeVO.getStore_acc() %></td>
						</tr>
						<tr>
							<td>�Ӯa�q��</td>
							<td><%=storeVO.getStore_phone() %></td>
						</tr>
						<tr>
							<td>�Ӯa�a�}</td>
							<td><%=storeVO.getStore_addr() %> </td>
						</tr>
						<tr>
							<td>�Ӯa²��</td>
							<td><%=storeVO.getStore_content() %></td>
						</tr>
						<tr>
							<td>�Ӯa�O�_�~�e</td>
							<td><%=storeVO.getStore_out() %></td>
						</tr>
						<tr>
							<td>�Ӯa�a��</td>
							<td><%=storeVO.getStore_zone() %></td>
						</tr>
						<tr>
							<td>�Ӯa���A</td>
							<td><%=storeVO.getStore_state() %></td>
						</tr>
					</table>
					</FORM>
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
