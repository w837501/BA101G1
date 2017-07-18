<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<% 
StoreVO storeVO=(StoreVO)request.getAttribute("storeVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�s�W���a AddStore</title>
<script language="JavaScript" src="js/pic_preview.js"></script>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>�s�W���a - AddStore.jsp</h3></td>
			<td><a href="<%=request.getContextPath() %>/store/store.jsp"><img src="<%=request.getContextPath() %>/images/logo.png"	width="100" height="100" border="1"> �^���� </a></td></tr></table>

<h4>���u���:<font color=red><b>*</b></font>���������</h4>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message.value}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>�Ӯa�W��:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_name" size="45" 
			 value="<%= (storeVO==null)? "�ּw��" :storeVO.getStore_name() %>"></td>
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
		<td><input type="TEXT" name="store_content" size="45" 
			  value="<%= (storeVO==null)? "�ڦn�Y�n�Y�n�Y��" :storeVO.getStore_content() %>"></td>
	</tr>
	<tr>
		<td>�Ӯa�q��:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_phone" size="45" 
			  value="<%= (storeVO==null)? "0912345678" :storeVO.getStore_phone() %>"></td>
	</tr>
	<tr>
		<td>�Ӯa�a�}:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_addr" size="45" 
			  value="<%= (storeVO==null)? "������" :storeVO.getStore_addr() %>"></td>
	</tr>
	<tr>
		<td>�Ӯa�Ӥ�:<font color=red><b>*</b></font></td>
		<td><input type="file" name="store_image" id="upfile1" >
		 <p>
    	<img id="image"  style="max-width: 150px; max-height: 150px;">
			</p>
  		</td>
	</tr>
	<tr>
		<td>�Ӯa�H�c:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_acc" size="45" 
			  value="<%= (storeVO==null)? "ab123456@abc.com" :storeVO.getStore_acc() %>"></td>
	</tr>
	<tr>
		<td>�Ӯa�K�X:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_pw" size="45" 
			  value="<%= (storeVO==null)? "123456789" :storeVO.getStore_pw() %>"></td>
	</tr>
	<tr>
		<td>�Ӯa�O�_�~�e:<font color=red><b>*</b></font></td>
		<td><select name="store_out">
					<option value='���~�e'>���~�e</option>
					<option value='�S���~�e'>�S���~�e</option></select> </td>
	</tr>
	<tr>
		<td>�Ӯa�a�� :<font color=red><b>*</b></font></td>
		<td><select size="1" name="store_zone">
						<option value="�򶩥�">�򶩥�
						<option value="�O�_��">�O�_��
						<option value="�s�_��">�s�_��
						<option value="��饫">��饫
						<option value="�s�˥�">�s�˥�
						<option value="�s�˿�">�s�˿�
						<option value="�]�߿�">�]�߿�
						<option value="�O����">�O����
						<option value="���ƿ�">���ƿ�
						<option value="�n�뿤">�n�뿤
						<option value="���L��">���L��
						<option value="�Ÿq��">�Ÿq��
						<option value="�Ÿq��">�Ÿq��
						<option value="�O�n��">�O�n��
						<option value="������">������
						<option value="�̪F��">�̪F��
						<option value="�O�F��">�O�F��
						<option value="�Ὤ��">�Ὤ��
						<option value="�y����">�y����
						
					</select></td>
	</tr>
	</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>
</html>