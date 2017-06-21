<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.push.model.*"%>
<%-- 此頁練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller PushServlet.java已存入request的pushVO物件--%>
<%PushVO pushVO = (PushVO) request.getAttribute("pushVO");%>


<html>
<head>
<title>單一推播資料 - listOnePush.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>單一推播資料 - ListOnePush.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>推播編號</th>
		<th>管理員編號</th>
		<th>推播內容</th>
		<th>推播時間</th>
		<th>最新消息編號</th>
		<th>廣告編號</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=pushVO.getPush_id()%></td>
		<td><%=pushVO.getMan_id()%></td>
		<td><%=pushVO.getPush_content()%></td>
		<td><%=pushVO.getPush_time()%></td>
		<td><%=pushVO.getNews_id()%></td>
		<td><%=pushVO.getAd_id()%></td>
	</tr>
</table>

</body>
</html>
