<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.permission_ability.model.*"%>

<html>
<head>
<title>�v���\���Ʒs�W - addPA.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="js/timepicker.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



		<hr style="border-color: red;">
		
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/perA/pa.do">
				<div class="container col-sm-12" style="margin-top:50px;">
					<div class="col-sm-4"></div>
					<label for="aa" class="col-sm-1 control-label">
						 �v���\��-�s��
					</label>
					<div class="col-sm-2">
						<input type="text" name="pa_id" placeholder="�п�J�Ʀr" class="form-control" value="11">
					</div>
				</div><br>
				<div class="col-sm-12 form-group text-center">
					<div class="col-sm-4"></div>
					<label for="aa" class="col-sm-1 control-label">
						�v���\��-�W��
					</label>
					<div class="col-sm-2">
						<input type="text" name="pa_name" placeholder="�п�J��r" class="form-control" value="�s�W�v���\��1">
					</div>
				</div><br>
	 			<div class="col-sm-12 text-center">
					<a href="#" onclick="parentNode.submit();" class="btn btn-info"><i class="glyphicon glyphicon-ok"></i> �e�X</a>
					<a href="#" onclick="cleanInput()" class="btn btn-info"><i class="glyphicon glyphicon-remove"></i> �M��</a>
				</div>
		</form>
</body>
</html>
<script type="text/javascript">
function cleanInput(){
	document.getElementsByName("pa_id")[0].value="";
	document.getElementsByName("pa_name")[0].value="";
}
</script>

