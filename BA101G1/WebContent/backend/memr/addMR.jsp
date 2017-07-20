<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.member_report.model.*"%>
<%
MemberReportVO mrVO = (MemberReportVO) request.getAttribute("mrVO");
%>

<html>
<head>
<title>�|�����|��Ʒs�W - addMR.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="js/timepicker.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="js/timepicker.js"></script>
<script type="text/javascript">
  $(function() {
      $('#mydate').datetimepicker({
          "dateFormat": "yy-mm-dd",
          "timeFormat": "HH:mm:ss"
      });
      //$('#mydate').timepicker({"timeFormat": "HH:mm"}); //�u�� �ɡB���B�� �� timepicker
  });
</script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|�����|��Ʒs�W - addMR.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/backend/memr/select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>�|�����|���:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do" name="form1" enctype="multipart/form-data">
	<table border="0">
	
		<tr>
			<td>�|���s��:</td>
			<td><input type="TEXT" name="mem_id" size="45" 
				value="<%= (mrVO==null)? "MEM-000001" : mrVO.getMem_id()%>" /></td>
		</tr>
		<tr>
			<td>�q��s��:</td>
			<td><input type="TEXT" name="order_id" size="45"
				value="<%= (mrVO==null)? "20170627-000001" : mrVO.getOrder_id()%>" /></td>
		</tr>
		<tr>
			<td>���׽s��:</td>
			<td><input type="TEXT" name="sc_id" size="45"
				value="<%= (mrVO==null)? "" : mrVO.getSc_id()%>" /></td>
		</tr>
		<tr>
			<td>�޲z���s��:</td>
			<td><input type="TEXT" name="man_id" size="45"
				value="<%= (mrVO==null)? "MAN-000001" : mrVO.getMan_id()%>" /></td>
		</tr>
		<tr>
			<td>���|���e:</td>
			<td><input type="TEXT" name="mr_content" size="45"
				value="<%= (mrVO==null)? "���������ۤ�" : mrVO.getMr_content()%>" /></td>
		</tr>
		<tr>
			<td>���|�Ϥ�:</td>
			<td>			
			<div id="demo">
		        <input id="file_upload" type="file"  name="mr_image"/>
		            <img id="preview" style="width:200px;display: none;">
		        
		    </div>
			</td>
		</tr>
		
	
		
		<tr>
			<% java.sql.Timestamp date_SQL = new java.sql.Timestamp(System.currentTimeMillis());%>
			<td>���|�ɶ�:</td>
			
			<td bgcolor="#CCCCFF">
				<input type="text" id="mydate" name="mr_time" value="<%= (mrVO==null)? date_SQL : mrVO.getMr_time()%>">
				
			    
			</td>
		</tr>
		<tr>
			<td>�f�֪��A:</td>
			<td><input type="TEXT" name="mr_state" size="45"
				value="<%= (mrVO==null)? "0" : mrVO.getMr_state()%>" /></td>
		</tr>
		<tr>
			<td>���|���G:</td>
			<td><input type="TEXT" name="mr_result" size="45"
				value="<%= (mrVO==null)? "null" : mrVO.getMr_result()%>" /></td>
		</tr>
	
	</table>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
</FORM>


<form id="form1">
    <input type='file' onchange="readURL(this);" />
    <img id="blah" src="" style="width:200px;display: none;"/>
</form>
</body>

</html>

<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        document.getElementById("blah").style.display = "block";
        reader.onload = function (e) {
            $('#blah').attr('src', this.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<script>
$(function(){
    $("#file_upload").change(function() {
    	document.getElementById("preview").style.display = "block";
        var $file = $(this); // �ثe������
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL;
        var $img = $("#preview");

        if(fileObj && fileObj.files && fileObj.files[0]){
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src',dataURL);
        }else{
            dataURL = $file.val();
            var imgObj = document.getElementById("preview");
            imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

        }
    });
});
</script>
