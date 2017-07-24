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
<script language="JavaScript" src="js/pic_preview.js"></script>
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
					<h1>�Ӯa��ƭק�</h1>
	 			</div> 
				<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/store/store.do" name="form1" enctype="multipart/form-data">
				
					<table border="0">
						<tr>
							<td>�Ӯa�s��:<font color=red><b>*</b></font></td>
							<td><%=storeVO.getStore_id() %></td>
						</tr>
						<tr>
							<td>�Ӯa�W��:</td>
							<td><input type="text" name="store_name" size="45" value="<%=storeVO.getStore_name()%>" />
						</tr>
						
						<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
						
						<tr>
							<td>�Ӯa���O:</td>
							<td><select size="1" name="sc_id">
								<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
									<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
								</c:forEach>
							</select></td>
						</tr>
						
						<tr>
							<td>�Ӯa²��:</td>
							<td><input type="text" name="store_content" size="45" value="<%=storeVO.getStore_content()%>" />
						</tr>
						<tr>
							<td>�Ӯa�q��:</td>
							<td><input type="text" name="store_phone" size="45" value="<%=storeVO.getStore_phone()%>" />
						</tr>
						<tr>
							<td>�Ӯa�a�}:</td>
							<td><input type="text" name="store_addr" size="45" value="<%=storeVO.getStore_addr()%>" />
						</tr>
						<tr>
							<td>���a�Ϥ�:</td>
							<td>
						    	<img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
								<input type="file" name="store_image" id="upfile1">
							</td>
						</tr>
						<tr>
							<td>�Ӯa�b��:</td>
							<td><%=storeVO.getStore_acc() %></td>
						</tr>
						<tr>
							<td>�Ӯa�K�X:</td>
							<td><input type="password" name="store_pw" size="45" value="<%=storeVO.getStore_pw()%>" />
						</tr>
						<tr>
							<td>�Ӯa�O�_�~�e:</td>
							<td><select name="store_out">
								<option value='���~�e' ${(storeVO.store_out=='���~�e') ? 'selected':''}>���~�e</option>
								<option value='�S���~�e' ${(storeVO.store_out=='�S���~�e') ? 'selected':''}>�S���~�e</option></select>
							</td>
						</tr>
						<tr>
							<td>�Ӯa�a�� :</td>
							<td>
							<select size="1" name="store_zone">
								<option value="�򶩥�" ${(storeVO.store_zone=='�򶩥�') ? 'selected':''}>�򶩥�
								<option value="�O�_��" ${(storeVO.store_zone=='�O�_��') ? 'selected':''}>�O�_��
								<option value="�s�_��" ${(storeVO.store_zone=='�s�_��') ? 'selected':''}>�s�_��
								<option value="��饫" ${(storeVO.store_zone=='��饫') ? 'selected':''}>��饫
								<option value="�s�˥�" ${(storeVO.store_zone=='�s�˥�') ? 'selected':''}>�s�˥�
								<option value="�s�˿�" ${(storeVO.store_zone=='�s�˿�') ? 'selected':''}>�s�˿�
								<option value="�]�߿�" ${(storeVO.store_zone=='�]�߿�') ? 'selected':''}>�]�߿�
								<option value="�O����" ${(storeVO.store_zone=='�O����') ? 'selected':''}>�O����
								<option value="���ƿ�" ${(storeVO.store_zone=='���ƿ�') ? 'selected':''}>���ƿ�
								<option value="�n�뿤" ${(storeVO.store_zone=='�n�뿤') ? 'selected':''}>�n�뿤
								<option value="���L��" ${(storeVO.store_zone=='���L��') ? 'selected':''}>���L��
								<option value="�Ÿq��" ${(storeVO.store_zone=='�Ÿq��') ? 'selected':''}>�Ÿq��
								<option value="�Ÿq��" ${(storeVO.store_zone=='�Ÿq��') ? 'selected':''}>�Ÿq��
								<option value="�O�n��" ${(storeVO.store_zone=='�O�n��') ? 'selected':''}>�O�n��
								<option value="������" ${(storeVO.store_zone=='������') ? 'selected':''}>������
								<option value="�̪F��" ${(storeVO.store_zone=='�̪F��') ? 'selected':''}>�̪F��
								<option value="�O�F��" ${(storeVO.store_zone=='�O�F��') ? 'selected':''}>�O�F��
								<option value="�Ὤ��" ${(storeVO.store_zone=='�Ὤ��') ? 'selected':''}>�Ὤ��
								<option value="�y����" ${(storeVO.store_zone=='�y����') ? 'selected':''}>�y����
							</select>
							</td>
						</tr>
						</table>
						<br>
						<input type="hidden" name="action" value="update">
						<input type="hidden" name="store_id" value="<%=storeVO.getStore_id() %>">
						<input type="hidden" name="store_acc" value="<%=storeVO.getStore_acc() %>">
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
						<input type="submit" value="�e�X�ק�"></FORM>
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
