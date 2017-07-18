<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	String tab2 = request.getParameter("tab2");
	String url = request.getServletPath();
	session.getAttribute("errorMsgs");
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if (window.location.hash != "") {
							$('a[href="' + window.location.hash + '"]').click()
						}

						var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
						$("#mem_mail").keydown(
								function() {
									console.log("123");
									console.log($(this).val());
									if (emailRule.test($(this).val())) {
										$('.error1_mail').text(' ');
										$("#error_img_mail").removeAttr("src");
										$('#correct_img_mail').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
										$('.correct_mail').text('�H�c�榡���T');
										$('.correct_mail').css("color", "blue");
										abc();
									} else {
										$('.correct_mail').text('');
										$('#correct_img_mail').removeAttr("src");
										$('.error1_mail').text('�H�c�榡�����T');
										$('.error1_mail').css("color", "red");
										$('#error_img_mail').attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
										
									}
								});
						$("#mem_mail").blur(
								function() {
									console.log($(this).val());
									if (emailRule.test($(this).val())) {
										$('.error1_mail').text(' ');
										$("#error_img_mail").removeAttr("src");
										$('#correct_img_mail').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
										$('.correct_mail').text('�H�c�榡���T');
										$('.correct_mail').css("color", "blue");
										abc();
									} else {
										$('.correct_mail').text('');
										$('#correct_img_mail').removeAttr("src");
										$('.error1_mail').text('�H�c�榡�����T');
										$('.error1_mail').css("color", "red");
										$('#error_img_mail').attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
										
									}
								});
						var pwRule = /^(?!.*[^a-zA-Z0-9])(?=.*\d)(?=.*[a-zA-Z]).{6,10}$/;
						$("#mem_pw").keydown(
								function() {
									console.log($(this).val());
									if (pwRule.test($(this).val())) {
											$('.error1_pw').text(' ');
											$("#error_img_pw").removeAttr("src");
											$('#correct_img_pw').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
											$('.correct_pw').text('�K�X�榡���T');
											$('.correct_pw').css("color", "blue");
											abc();
										} else {
											$('.correct_pw').text('');
											$('#correct_img_pw').removeAttr("src");
											$('.error1_pw').text('�K�X�榡�����T');
											$('.error1_pw').css("color", "red");
											$("#error_img_pw").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
											
										}
								});
						$("#mem_pw").blur(
								function() {
									console.log($(this).val());
									if (pwRule.test($(this).val())) {
											$('.error1_pw').text(' ');
											$("#error_img_pw").removeAttr("src");
											$('#correct_img_pw').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
											$('.correct_pw').text('�K�X�榡���T');
											$('.correct_pw').css("color", "blue");
											abc();
										} else {
											$('.correct_pw').text('');
											$('#correct_img_pw').removeAttr("src");
											$('.error1_pw').text('�K�X�榡�����T');
											$('.error1_pw').css("color", "red");
											$("#error_img_pw").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
											
										}
								});
						$("#mem_pw1").blur(
								function(){
									console.log($(this).val());
									if($(this).val()==$("#mem_pw").val()&&pwRule.test($(this).val())){
											$('.error1_pw1').text(' ');
											$("#error_img_pw1").removeAttr("src");
											$('#correct_img_pw1').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
											$('.correct_pw1').text('�K�X���T');
											$('.correct_pw1').css("color", "blue");
											abc();
										}else{
											$('.correct_pw1').text('');
											$('#correct_img_pw1').removeAttr("src");
											$('.error1_pw1').text('�K�X�����T');
											$('.error1_pw1').css("color", "red");
											$("#error_img_pw1").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
										}
								});
						var nameRule = /^[\u4e00-\u9fa5_a-zA-Z]{2,10}$/;
						$("#mem_name").keydown(
								function() {
									console.log($(this).val());
									if (nameRule.test($(this).val())) {
										$('.error1_name').text(' ');
										$("#error_img_name").removeAttr("src");
										$('#correct_img_name').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
										$('.correct_name').text('�W�r���T');
										$('.correct_name').css("color", "blue");
										abc();
									} else {
										$('.correct_name').text('');
										$('#correct_img_name').removeAttr("src");
										$('.error1_name').text('�W�r�����T');
										$('.error1_name').css("color", "red");
										$("#error_img_name").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
									}
								});
						$("#mem_name").blur(
								function() {
									console.log($(this).val());
									if (nameRule.test($(this).val())) {
										$('.error1_name').text(' ');
										$("#error_img_name").removeAttr("src");
										$('#correct_img_name').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
										$('.correct_name').text('�W�r���T');
										$('.correct_name').css("color", "blue");
										abc();
									} else {
										$('.correct_name').text('');
										$('#correct_img_name').removeAttr("src");
										$('.error1_name').text('�W�r�����T');
										$('.error1_name').css("color", "red");
										$("#error_img_name").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
									}
								});
						var phoneRule = /^09[0-9]{8}$/;
						$("#mem_phone").keydown(
								function() {
									console.log($(this).val());
									if (phoneRule.test($(this).val())) {
											$('.error1_phone').text(' ');
											$("#error_img_phone").removeAttr("src");
											$('#correct_img_phone').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
											$('.correct_phone').text('������T');
											$('.correct_phone').css("color", "blue");
											abc();
										} else {
											$('.correct_phone').text('');
											$('#correct_img_phone').removeAttr("src");
											$('.error1_phone').text('��������T');
											$('.error1_phone').css("color", "red");
											$("#error_img_phone").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
										}
								});
						$("#mem_phone").blur(
								function() {
									console.log($(this).val());
									if (phoneRule.test($(this).val())) {
											$('.error1_phone').text(' ');
											$("#error_img_phone").removeAttr("src");
											$('#correct_img_phone').attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
											$('.correct_phone').text('������T');
											$('.correct_phone').css("color", "blue");
											abc();
										} else {
											$('.correct_phone').text('');
											$('#correct_img_phone').removeAttr("src");
											$('.error1_phone').text('��������T');
											$('.error1_phone').css("color", "red");
											$("#error_img_phone").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
										}
								});
						
						function abc(){
							if($('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_mail').text()==' '){
								console.log($('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_mail').text()==' ');
								$('#input').attr("disabled",false);
							}else{
								console.log($('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_mail').text()==' ');
								$('#input').attr("disabled",true);
							}
						}
					});
</script>
<style>
.aa {
	margin-top: 150px;
}

#contents p a {
	color: #D6656A;
}

</style>

<body>
	<div id="page">
		<div id="contents">
			<div class="col-xs-12 col-sm-4 ">
				<center>
					<a href="<%=request.getContextPath()%>/index.jsp"> <img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO" width="150px" height="150px"></a><br><br><br>
					<p>
						<b> <a href="<%=request.getContextPath()%>/index.jsp">�Y�w�ڽu�W�q�\</a> > LogIn</b>
					</p>
				</center>
			</div>
		
		
			<div class="col-xs-12 col-sm-8">
		<div class="col-xs-12 col-sm-5 aa">
			<div role="tabpanel" style="margin-left:-60px;">

				<ul class="nav nav-tabs" role="tablist" id="tabs">
					<li role="presentation" class="active"><a href="#tab1"
						aria-controls="tab1" role="tab" data-toggle="tab">�|���n�J</a></li>
					<li role="presentation"><a href="#tab2" aria-controls="tab2"
						role="tab" data-toggle="tab">���U</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<div class="well" align="center"  style="width:600px;">
							<c:if test="${not empty errorMsgs_Login}">
								<font color='red'>
										<c:forEach var="message" items="${errorMsgs_Login}">
											${message}
										</c:forEach>
								</font>
							</c:if>
							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/MemberLoginHandler"
								name="form2">

								<label for="�b��">�b��</label> <input type="text" name="mem_mail"
									id="�b��" placeholder="�п�JE-MAIL" value="wang@abc.com"> <br> <br> <label
									for="�K�X">�K�X</label> <input type="password" name="mem_pw"
									id="�K�X" placeholder="�п�J�K�X" value="group1"> <br> <br> <a
									herf="">�ѰO�K�X?</a> <br> <br> <input type=submit
									value=" �n�J "><input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>">
							</form>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="tab2">
						<div class="well" align="center" style="width:600px;">
							<c:if test="${not empty errorMsgs}">
								<font color='red'>
										<c:forEach var="message" items="${errorMsgs}">
											${message}
										</c:forEach>
								</font>
							</c:if>
							<%
								session.removeAttribute("errorMsgs");
							%>
							<form METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem.do">
							<div class="form-horizontal">
							<div class="form-group">
								<label for="mem_mail" class="col-xs-12 col-sm-3 control-label">�|���H�c</label>
								<div class="col-xs-12 col-sm-6"> 
								<input type="text" name="mem_mail" id="mem_mail" 
									placeholder="�п�JE-MAIL"
									value="<%=(memberVO == null) ? "sadqwe" : memberVO.getMem_mail()%>" >
								</div>
								<div class="col-xs-12 col-sm-3">
								<span class='error1_mail' style="margin-left:-90px;"></span> 
								<img src="" id="error_img_mail">
								<span class='correct_mail' style="margin-left:-90px;"></span> 
								<img src="" id="correct_img_mail"> 
								</div>
							</div>
							<div class="form-group">
								<br><label for="mem_pw" class="col-xs-12 col-sm-3 control-label">�|���K�X</label> 
								<div class="col-xs-12 col-sm-6">
								<input type="password" name="mem_pw" id="mem_pw"
									placeholder="�п�J�K�X6~10�X"
									value="<%=(memberVO == null) ? "222212" : memberVO.getMem_pw()%>">
								</div>
								<div class="col-xs-12 col-sm-3">
									<span class='error1_pw' style="margin-left:-90px;"></span>
									<img src="" id="error_img_pw">
									<span class='correct_pw' style="margin-left:-90px;"></span> 
									<img src="" id="correct_img_pw"> 
								</div>
							</div>
							<div class="form-group">
								<br><label for="mem_pw1" class="col-xs-12 col-sm-3 control-label">�T�{�K�X</label> 
								<div class="col-xs-12 col-sm-6">
								<input type="password" name="mem_pw1" id="mem_pw1"
									placeholder="�п�J�K�X6~10�X"
									value="<%=(memberVO == null) ? "222212" : memberVO.getMem_pw()%>">
								</div>
								<div class="col-xs-12 col-sm-3">
									<span class='error1_pw1' style="margin-left:-100px;"></span>
									<img src="" id="error_img_pw1">
									<span class='correct_pw1' style="margin-left:-100px;"></span> 
									<img src="" id="correct_img_pw1"> 
								</div>
							</div>
								 
								<div class="form-group">
									<label for="mem_name" class="col-xs-12 col-sm-3 control-label"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp�m�W</label> 
									<div class="col-xs-12 col-sm-6">
									<input type="text" name="mem_name" id="mem_name" 
										placeholder="�п�J�m�W2~10�Ӧr"
										value="<%=(memberVO == null) ? "a" : memberVO.getMem_name()%>">
									</div>
									<div class="col-xs-12 col-sm-3">
									<span class='error1_name'style="margin-left:-100px;" ></span> 
									<img src="" id="error_img_name"> 
									<span class='correct_name' style="margin-left:-100px;"></span> 
									<img src="" id="correct_img_name"> 
									</div>
								</div>
								<div class="form-group">
									<label for="mem_phone" class="col-xs-12 col-sm-3 control-label"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp���</label>
									<div class="col-xs-12 col-sm-6">
										<input type="text" name="mem_phone" id="mem_phone"
										placeholder="�п�J������X" 
										value="<%=(memberVO == null) ? "123" : memberVO.getMem_phone()%>">
									</div>
									<div class="col-xs-12 col-sm-3">
										<span class='error1_phone' style="margin-left:-100px;"></span> 
										<img src="" id="error_img_phone"> 
										<span class='correct_phone' style="margin-left:-100px;"></span> 
										<img src="" id="correct_img_phone"> 
									</div>
								</div>
									<div class="form-group">
									<input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <br> <br>
								    <input type="hidden" name="action" value="insert"> 
								    <input type="submit" value="�e�X�s�W" id="input" disabled="disabled"> 
								    </div>
								    </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
