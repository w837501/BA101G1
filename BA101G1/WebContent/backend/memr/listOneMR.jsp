<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.member_report.model.*"%>
<%-- 此頁練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%MemberReportVO mrVO = (MemberReportVO) request.getAttribute("mrVO");%>


<html>
<head>
<title>單一會員檢舉資料 - listOneMR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>單一會員檢舉資料 - ListOneMR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/memr/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員檢舉單號</th>
		<th>會員編號</th>
		<th>訂單編號</th>
		<th>評論編號</th>
		<th>管理員編號</th>
		<th>檢舉內容</th>
		<th>檢舉圖片</th>
		<th>檢舉時間</th>
		<th>審核狀態</th>
		<th>檢舉結果</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=mrVO.getMr_id()%></td>
		<td><%=mrVO.getMem_id()%></td>
		<td><%=mrVO.getOrder_id()%></td>
		<td><%=mrVO.getSc_id()%></td>
		<td><%=mrVO.getMan_id()%></td>
		<td><%=mrVO.getMr_content()%></td>
		<td><%=mrVO.getMr_image()%></td>
		<td><%=mrVO.getMr_time()%></td>
		<td><%=mrVO.getMr_state()%></td>
		<td><%=mrVO.getMr_result()%></td>
	</tr>
</table>

</body>
</html>
