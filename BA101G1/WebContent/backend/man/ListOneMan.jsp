<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.man.model.*"%>
<%
ManagerVO managerVO=(ManagerVO)request.getAttribute("managerVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���u���</title>
</head>
		<div class="container">
			<div class="form-group">
				<label for="aa" class="col-xs-12 col-sm-3 control-label">
					�޲z���s��
				</label>
				<div class="col-xs-6 col-sm-9">
					<input type="text" name="aa" placeholder="��r" class="form-control" value="<%=managerVO.getMan_id() %>">
				</div>
			</div><br>
			<div class="form-group">
				<label for="aa" class="col-xs-12 col-sm-3 control-label" value="<%=managerVO.getMan_name() %>">
					�޲z���W�r
				</label>
				<div class="col-xs-6 col-sm-3">
					<input type="text" name="aa" placeholder="��r" class="form-control">
				</div>
			</div><br>
			<div class="form-group">
				<label for="aa" class="col-xs-12 col-sm-3 control-label">
					�޲z���q��
				</label>
				<div class="col-xs-6 col-sm-3">
					<input type="text" name="aa" placeholder="��r" class="form-control" value="<%=managerVO.getMan_phone() %>">
				</div>
			</div><br>
			<div class="form-group">
				<label for="aa" class="col-xs-12 col-sm-3 control-label">
					�K�X
				</label>
				<div class="col-xs-6 col-sm-3">
					<input type="password" name="aa" placeholder="��r" class="form-control" value="<%=managerVO.getMan_pw() %>">
				</div>
			</div><br>
			<div class="form-group">
				<label for="aa" class="col-xs-12 col-sm-3 control-label">
					�H�c
				</label>
				<div class="col-xs-6 col-sm-3">
					<input type="text" name="aa" placeholder="��r" class="form-control" value="<%=managerVO.getMan_mail() %>">
				</div>
			</div><br>
		</div>
</table>
</body>
</html>