<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
  <title>�Y�q��EatMe</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
        <!-- LOGIN STYLES -->
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>


<br>
   
   
<jsp:useBean id="scsSvc" scope="page" class="com.store_class.model.StoreClassService" />
<%-- <a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">�Ӯa</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a> 
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a> --%>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>


	<table class="table table-hover">
		<tr>
			<th>�s��</th>
			<th>���O�s��</th>
			<th>�W��</th>
			<th>²��</th>
			<th>�q��</th>
			<th>�a�}</th>
			<th>�i�n���</th>
<!-- 			<th>�����P�P��</th>
			<th>�Ӯa��������</th> -->
			<th>���A</th>
			<th>�Ӥ�</th>
			<th>�Q���|����</th>
<!-- 			<th>�Ӯa���v�}�l���</th>
			<th>�Ӯa���v�������</th> -->
			<!-- <th>�Ӯa�K�X</th> -->
			<th>�b��</th>
			<th>�~�e</th>
			<th>�a��</th>
		</tr>

		<c:forEach var="storeVO" items="${listStores_ByStoreClass}">
			<tr align='center' valign='middle' ${(storeVO.store_id==param.store_id) ? 'bgcolor=#CCCCFF':''}>
				<td>${storeVO.store_id}</td>
				<td>${scsSvc.getOneStoreClass(storeVO.sc_id).sc_name}</td>
				<td>${storeVO.store_name}</td>
				<td>${storeVO.store_content}</td>
				<td>${storeVO.store_phone}</td>
				<td>${storeVO.store_addr}</td>
				<td>${storeVO.store_date}</td>
<%-- 				<td>${storeVO.store_star}</td>
				<td>${storeVO.store_count}</td> --%>
                <td>${storeVO.store_state}</td>
				<td><img src='<%=request.getContextPath()%>/store?store_id=${storeVO.store_id}' height="70"></td>
				<td>${storeVO.store_report_count}</td>
<%-- 				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${storeVO.store_start_time}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${storeVO.store_end_time}" /></td> --%>
				<%-- <td>${storeVO.store_pw}</td> --%>
				<td>${storeVO.store_acc}</td>
				<td>${storeVO.store_out}</td>
                <td>${storeVO.store_zone}</td>
                
			</tr>
		</c:forEach>
	</table>
                                
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>


</body>
</html>