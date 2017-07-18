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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>�Y�q�ڽu�W�q�\�t��</title>
<script language="JavaScript" src="js/pic_preview.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_store.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">�ק���</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">�d�ߩҦ��ӫ~</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">�d�ߩҦ��q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">�d�ߥ��T�{�q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">�d�߶i�椤�q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">�d�ߤw�����q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">�d�����|</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">�ӫ~�s�W</a>
					</div>
					
				</div>
				
				
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>�Ӯa��ƭק�</h1>
 				</div> 
				<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/store/store.do" name="form1" enctype="multipart/form-data">
<table border="0">
<tr>
		<td>�Ӯa�s��:<font color=red><b>*</b></font></td>
		<td><%=storeVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>�Ӯa�W��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_name" size="45" value="<%=storeVO.getStore_name()%>" />
	</tr>
	<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<td>�Ӯa���O:<font color=red><b>*</b></font></td>
		<td><select size="1" name="sc_id">
			<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
				<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
			</c:forEach>
		</select></td>
	</tr>
	
	<tr>
		<td>�Ӯa²��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_content" size="45" value="<%=storeVO.getStore_content()%>" />
	</tr>
	<tr>
		<td>�Ӯa�q��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_phone" size="45" value="<%=storeVO.getStore_phone()%>" />
	</tr>
	<tr>
		<td>�Ӯa�a�}:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_addr" size="45" value="<%=storeVO.getStore_addr()%>" />
	</tr>
	<tr>
		<td>���a�Ϥ�:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="store_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
	<tr>
		<td>�Ӯa�b��:<font color=red><b>*</b></font></td>
		<td><%=storeVO.getStore_acc() %></td>
	</tr>
	<tr>
		<td>�Ӯa�K�X:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_pw" size="45" value="<%=storeVO.getStore_pw()%>" />
	</tr>
	<tr>
		<td>�Ӯa�O�_�~�e:<font color=red><b>*</b></font></td>
		<td><select name="store_out">
			<option value='���~�e' ${(storeVO.store_out=='���~�e') ? 'selected':''}>���~�e</option>
			<option value='�S���~�e' ${(storeVO.store_out=='�S���~�e') ? 'selected':''}>�S���~�e</option></select> </td>
	</tr>
	<tr>
			<td>�Ӯa�a�� :<font color=red><b>*</b></font></td>
			<td><select size="1" name="store_zone">
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
							
					</select></td>
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
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
