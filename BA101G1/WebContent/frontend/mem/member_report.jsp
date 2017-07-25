<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.member_report.model.*"%>
<%@ page import="java.util.*"%>
<% 
MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
MemberReportService memberreportSvc=new MemberReportService();
String mem_id=memberVO.getMem_id();
List<MemberReportVO> memberreportVO=new LinkedList<MemberReportVO>();
memberreportVO=memberreportSvc.getMemberReportByMem_id(mem_id);
 pageContext.setAttribute("memberreportVO",memberreportVO);
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
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="contents" style="margin-top:30px;margin-bottom:1000px;">
			
				<div id="mem-button" style="margin-left:50px;float:left;">
						
						<h1>�ڪ��b��</h1><br>
						
						<a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">
							<div>�ק���</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">
							<div>�d�߭q��</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">
							<div>�d�����|</div>
						</a>
				</div>
				
				
				<div style="float:right;margin-top:20px;margin-right:50px;">
					<div> 
						  <h3>�|�����|����</h3>
	 				</div> 
					<table border='1' bordercolor='#CCCCFF' width='680'>
						<tr bgcolor='#FFBB66'>
							<th width="11%"><font size="2">�|�����|�渹</font></th>
							<th width="10%"><font size="2">�q��s��</font></th>
							<th width="10%"><font size="2">���׽s��</font></th>
							<th width="10%"><font size="2">���|���e</font></th>
							<th width="10%"><font size="2">���|�ɶ�</font></th>
							<th width="10%"><font size="2">���|�f�֪��A</font></th>
							<th width="10%"><font size="2">���|���G</font></th>
							<th width="10%"><font size="2">�Ϥ�</font></th>
						</tr>
					</table>
					<c:forEach var="member_reportVO" items="${memberreportVO}" >
					<table border='1' bordercolor='#CCCCFF' width='680'>
						<tr align='center' valign='middle'${(member_reportVO.mr_id==param.mr_id)?'bgcolor=#CCCCFF':'' }>
							<td width="11%"><font size="2">${member_reportVO.mr_id }</font></td>
							<td width="10%"><font size="2">${member_reportVO.order_id }</font></td>
							<td width="10%"><font size="2">${member_reportVO.sc_id }</font></td>
							<td width="10%"><font size="2">${member_reportVO.mr_content}</font></td>
							<td width="10%"><font size="2">${member_reportVO.mr_time }</font></td>
							<td width="10%"><font size="2">${member_reportVO.mr_state }</font></td>
							<td width="10%"><font size="2">${member_reportVO.mr_result }</font></td>
							<td width="10%">
							<input type="button" value="Show" class="abc" >
							</td>
						</tr>
						<tr style="display: none;">
							<td colspan="8" align="center"><img src="<%=request.getContextPath() %>/MRDBGifReader?whichImg=memr&id=${member_reportVO.mr_id }"></td>
						</tr>
					</table>
					</c:forEach>
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
<script type="text/javascript">
$(".abc").on('click',function(){
	console.log($(".abc").index(this))
	var father=$(".abc").eq($(".abc").index(this)).parent().parent().siblings();
	father.toggle();
})
 
</script>