<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.store_report.model.*"%>
<%-- 此頁練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%StoreReportVO srVO = (StoreReportVO) request.getAttribute("srVO");%>

<%-- 取出 對應的DeptVO物件--%>
<%-- <% --%>
//   DeptService deptSvc = new DeptService();
//   DeptVO deptVO = deptSvc.getOneDept(empVO.getDeptno());
<%-- %> --%>
<html>
<head>
<title>商家檢舉資料 - listOneSR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>商家檢舉資料 - ListOneSR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/str/select_page.jsp"><img src="/BA101G1/backend/str/images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>商家檢舉單號</th>
		<th>商家編號</th>
		<th>評論編號</th>
		<th>訂單編號</th>
		<th>管理員編號</th>
		<th>檢舉內容</th>
		<th>檢舉圖片</th>
		<th>檢舉時間</th>
		<th>檢舉審核狀態</th>
		<th>檢舉結果</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=srVO.getSr_id()%></td>
		<td><%=srVO.getStore_id()%></td>
		<td><%=srVO.getSc_id()%></td>
		<td><%=srVO.getOrder_id()%></td>
		<td><%=srVO.getMan_id()%></td>
		<td><%=srVO.getSr_content()%></td>
		<td><%=srVO.getSr_image()%></td>
		<td><%=srVO.getSr_time()%></td>
		<td><%=srVO.getSr_state()%></td>
		<td><%=srVO.getSr_result()%></td>
	</tr>
</table>

</body>
</html>
