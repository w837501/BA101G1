<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="managerSvc" scope="page" class="com.man.model.ManagerService" />
<html>
<head>
<title>listNewsByMan_Id.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	
		<table border='1'>
		<tr>
			<th>�޲z���W��</th>
			<th>�����s��</th>
			<th>�������D</th>
			<th>��������</th>
			<th>�����Ϥ�</th>
			<th>�����ɶ�</th>
			<th>�����������e</th>
			<th>�ק�</th>
			<th>�R��</th>
			
		</tr>

		<c:forEach var="newsVO" items="${listNewsByMan_Id}">
			<tr align='center' valign='middle'>
				<td>${managerSvc.getOneMan(newsVO.man_id).man_name}</td>
				<td>${newsVO.news_id}</td>
				<td>${newsVO.news_name}</td>
				<td>${newsVO.news_content}</td>
				<td><img src='<%=request.getContextPath()%>/news?news_id=${newsVO.news_id}'   height="70"></td>
                <td>${newsVO.news_time}</td>
                <td>${newsVO.news_push_content}</td>

                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/news/news.do">
                                                        <input type="submit" value="�ק�">
                                                        <input type="hidden" name="news_id" value="${newsVO.news_id}">
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                                        <input type="hidden" name="action" value="getOne_For_Update">
                                                    </FORM>
                                                </td>
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/news/news.do">
                                                        <input type="submit" value="�R��">
                                                        <input type="hidden" name="news_id" value="${newsVO.news_id}">
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                                        <input type="hidden" name="action" value="delete">
                                                    </FORM>
			</td>
			</tr>
		</c:forEach>
	</table>
   
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>	

</body>
</html>