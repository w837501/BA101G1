<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
  <title>吃訂我EatMe</title>
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
<%-- <a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> 
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> --%>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>


	<table class="table table-hover">
		<tr>
			<th>編號</th>
			<th>類別編號</th>
			<th>名稱</th>
			<th>簡介</th>
			<th>電話</th>
			<th>地址</th>
			<th>進駐日期</th>
<!-- 			<th>評價星星數</th>
			<th>商家評價次數</th> -->
			<th>狀態</th>
			<th>照片</th>
			<th>被檢舉次數</th>
<!-- 			<th>商家停權開始日期</th>
			<th>商家停權結束日期</th> -->
			<!-- <th>商家密碼</th> -->
			<th>帳號</th>
			<th>外送</th>
			<th>地區</th>
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