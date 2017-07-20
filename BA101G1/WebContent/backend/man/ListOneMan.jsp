<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.man.model.*"%>
<%
ManagerVO managerVO=(ManagerVO)request.getAttribute("managerVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
</head>
		<hr style="border-color: red;">
		<div class="col-sm-4"></div>
		<form METHOD="post" ACTION="<%=request.getContextPath() %>/backend/man/man.do">
			<div class="container col-sm-8" >
				<div class="form-group">
					<label for="aa" class="col-xs-12 col-sm-2 control-label">
						管理員編號
					</label>
					<div class="col-xs-6 col-sm-3">
						<input type="text" name="man_id" placeholder="" class="form-control" value="<%=managerVO.getMan_id() %>">
					</div>
				</div><br>
				<div class="form-group">
					<label for="aa" class="col-xs-12 col-sm-2 control-label">
						管理員名字
					</label>
					<div class="col-xs-6 col-sm-3">
						<input type="text" name="man_name" placeholder="" class="form-control" value="<%=managerVO.getMan_name() %>">
					</div>
				</div><br>
				<div class="form-group">
					<label for="aa" class="col-xs-12 col-sm-2 control-label">
						管理員電話
					</label>
					<div class="col-xs-6 col-sm-3">
						<input type="text" name="man_phone" placeholder="" class="form-control" value="<%=managerVO.getMan_phone() %>">
					</div>
				</div><br>
				<div class="form-group">
					<label for="aa" class="col-xs-12 col-sm-2 control-label">
						密碼
					</label>
					<div class="col-xs-6 col-sm-3">
						<input type="password" name="man_pw" placeholder="" class="form-control" value="<%=managerVO.getMan_pw() %>">
					</div>
				</div><br>
				<div class="form-group">
					<label for="aa" class="col-xs-12 col-sm-2 control-label">
						信箱
					</label>
					<div class="col-xs-6 col-sm-3">
						<input type="text" name="man_mail" placeholder="" class="form-control" value="<%=managerVO.getMan_mail() %>">
					</div>
				</div><br>
			</div>
				<div class="text-center col-sm-12"><br>
					<a href="#" class="btn btn-info" onclick="parentNode.parentNode.submit();"><i class="glyphicon glyphicon-ok"></i> 送出</a>
					<a href="#" class="btn btn-info" onclick="rollback()"><i class="glyphicon glyphicon-remove"></i> 取消</a>
				</div>
				
				<input type="hidden" name="action" value="update">
		</form>
</body>
</html>
<script>
	function rollback(){
		document.getElementsByName("man_id")[0].value="<%=managerVO.getMan_id() %>";
		document.getElementsByName("man_name")[0].value="<%=managerVO.getMan_name() %>";
		document.getElementsByName("man_phone")[0].value="<%=managerVO.getMan_phone() %>";
		document.getElementsByName("man_pw")[0].value="<%=managerVO.getMan_pw() %>";
		document.getElementsByName("man_mail")[0].value="<%=managerVO.getMan_mail() %>";
	}
</script>