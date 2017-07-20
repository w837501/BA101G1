<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script language="JavaScript" src="js/pic_preview.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if (window.location.hash != "") {
							$('a[href="' + window.location.hash + '"]').click()
						}

						var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
						$("#store_acc1").keydown(
								function() {
									console.log("123");
									console.log($(this).val());
									if (emailRule.test($(this).val())) {
										$('.error1_acc').text(' ');
										$("#error_img_acc").removeAttr("src");
										$('#correct_img_acc').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
										$('.correct_acc').text('�H�c�榡���T');
										$('.correct_acc').css("color", "blue");
										abc();
									} else {
										$('.correct_acc').text('');
										$('#correct_img_acc').removeAttr("src");
										$('.error1_acc').text('�H�c�榡�����T');
										$('.error1_acc').css("color", "red");
										$("#error_img_acc").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										
									}
								});
						$("#store_acc1").blur(
								function() {
									console.log($(this).val());
									if (emailRule.test($(this).val())) {
										$('.error1_acc').text(' ');
										$("#error_img_acc").removeAttr("src");
										$('#correct_img_acc').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
										$('.correct_acc').text('�H�c�榡���T');
										$('.correct_acc').css("color", "blue");
										abc();
									} else {
										$('.correct_acc').text('');
										$('#correct_img_acc').removeAttr("src");
										$('.error1_acc').text('�H�c�榡�����T');
										$('.error1_acc').css("color", "red");
										$("#error_img_acc").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										
									}
								});
						var pwRule = /^(?!.*[^a-zA-Z0-9])(?=.*\d)(?=.*[a-zA-Z]).{6,10}$/;
						$("#store_pw2").keydown(
								function() {
									console.log($(this).val());
									if (pwRule.test($(this).val())) {
											$('.error1_pw').text(' ');
											$("#error_img_pw").removeAttr("src");
											$('#correct_img_pw').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_pw').text('�K�X�榡���T');
											$('.correct_pw').css("color", "blue");
											abc();
										} else {
											$('.correct_pw').text('');
											$('#correct_img_pw').removeAttr("src");
											$('.error1_pw').text('�K�X�榡�����T');
											$('.error1_pw').css("color", "red");
											$("#error_img_pw").attr("src","<%=request.getContextPath()%>/store/image/error.png");
											
										}
								});
						$("#store_pw2").blur(
								function() {
									console.log($(this).val());
									if (pwRule.test($(this).val())) {
											$('.error1_pw').text(' ');
											$("#error_img_pw").removeAttr("src");
											$('#correct_img_pw').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_pw').text('�K�X�榡���T');
											$('.correct_pw').css("color", "blue");
											abc();
										} else {
											$('.correct_pw').text('');
											$('#correct_img_pw').removeAttr("src");
											$('.error1_pw').text('�K�X�榡�����T');
											$('.error1_pw').css("color", "red");
											$("#error_img_pw").attr("src","<%=request.getContextPath()%>/store/image/error.png");
											
										}
								});
						$("#store_pw1").blur(
								function(){
									console.log($(this).val());
									if($(this).val()==$("#store_pw2").val()&&pwRule.test($(this).val())){
											$('.error1_pw1').text(' ');
											$("#error_img_pw1").removeAttr("src");
											$('#correct_img_pw1').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_pw1').text('�K�X���T');
											$('.correct_pw1').css("color", "blue");
											abc();
										}else{
											$('.correct_pw1').text('');
											$('#correct_img_pw1').removeAttr("src");
											$('.error1_pw1').text('�K�X�����T');
											$('.error1_pw1').css("color", "red");
											$("#error_img_pw1").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										}
								});
						var nameRule = /^[\u4e00-\u9fa5_a-zA-Z]{2,10}$/;
						$("#store_name").keydown(
								function() {
									console.log($(this).val());
									if (nameRule.test($(this).val())) {
										$('.error1_name').text(' ');
										$("#error_img_name").removeAttr("src");
										$('#correct_img_name').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
										$('.correct_name').text('�W�r���T');
										$('.correct_name').css("color", "blue");
										abc();
									} else {
										$('.correct_name').text('');
										$('#correct_img_name').removeAttr("src");
										$('.error1_name').text('�W�r�����T');
										$('.error1_name').css("color", "red");
										$("#error_img_name").attr("src","<%=request.getContextPath()%>/store/image/error.png");
									}
								});
						$("#store_name").blur(
								function() {
									console.log($(this).val());
									if (nameRule.test($(this).val())) {
										$('.error1_name').text(' ');
										$("#error_img_name").removeAttr("src");
										$('#correct_img_name').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
										$('.correct_name').text('�W�r���T');
										$('.correct_name').css("color", "blue");
										abc();
									} else {
										$('.correct_name').text('');
										$('#correct_img_name').removeAttr("src");
										$('.error1_name').text('�W�r�����T');
										$('.error1_name').css("color", "red");
										$("#error_img_name").attr("src","<%=request.getContextPath()%>/store/image/error.png");
									}
								});
						var phoneRule = /^09[0-9]{8}$/;
						$("#store_phone").keydown(
								function() {
									console.log($(this).val());
									if (phoneRule.test($(this).val())) {
											$('.error1_phone').text(' ');
											$("#error_img_phone").removeAttr("src");
											$('#correct_img_phone').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_phone').text('������T');
											$('.correct_phone').css("color", "blue");
											abc();
										} else {
											$('.correct_phone').text('');
											$('#correct_img_phone').removeAttr("src");
											$('.error1_phone').text('��������T');
											$('.error1_phone').css("color", "red");
											$("#error_img_phone").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										}
								});
						$("#store_phone").blur(
								function() {
									console.log($(this).val());
									if (phoneRule.test($(this).val())) {
											$('.error1_phone').text(' ');
											$("#error_img_phone").removeAttr("src");
											$('#correct_img_phone').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_phone').text('������T');
											$('.correct_phone').css("color", "blue");
											abc();
										} else {
											$('.correct_phone').text('');
											$('#correct_img_phone').removeAttr("src");
											$('.error1_phone').text('��������T');
											$('.error1_phone').css("color", "red");
											$("#error_img_phone").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										}
								});
						$("#store_content").blur(
								function() {
									console.log($(this).val());
									if ($(this).val()!="") {
											$('.error1_content').text(' ');
											$("#error_img_content").removeAttr("src");
											$('#correct_img_content').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_content').css("color", "blue");
											console.log($('.error1_content').text()==' ');
											abc();
										} else {
											$('.correct_content').text('');
											$('#correct_img_content').removeAttr("src");
											$('.error1_content').text('���i�ť�');
											$('.error1_content').css("color", "red");
											$("#error_img_content").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										}
								});
						$("#store_addr").blur(
								function() {
									console.log($(this).val());
									if ($(this).val()!="") {
											$('.error1_addr').text(' ');
											$("#error_img_addr").removeAttr("src");
											$('#correct_img_addr').attr("src","<%=request.getContextPath()%>/store/image/images.jpg");
											$('.correct_addr').css("color", "blue");
											console.log($('.error1_addr').text()==' ');
											abc();
										} else {
											$('.correct_addr').text('');
											$('#correct_img_addr').removeAttr("src");
											$('.error1_addr').text('���i�ť�');
											$('.error1_addr').css("color", "red");
											$("#error_img_addr").attr("src","<%=request.getContextPath()%>/store/image/error.png");
										}
								});
						function abc(){
							if($('.error1_content').text()==' '&&$('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_acc').text()==' '&&$('.error1_addr').text()==' '){
								console.log($('.error1_content').text()==' '&&$('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_acc').text()==' ');
								$('#input').attr("disabled",false);
							}else{
								console.log($('.error1_content').text()==' '&&$('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_acc').text()==' ');
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
					<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO" width="150px" height="150px"></a> <br> <br> <br>
					<p font-size="100px">
						<b> <a href="<%=request.getContextPath()%>/index.jsp">�Y�w�ڽu�W�q�\</a> > LogIn
						</b>
					</p>
				</center>
			</div>
		
			<div class="col-xs-12 col-sm-8">
			<div class="col-xs-12 col-sm-5 aa">
				<div role="tabpanel" style="margin-left:-60px;">
	
					<ul class="nav nav-tabs" role="tablist" id="tabs">
						<li role="presentation" class="active"><a href="#tab1"
							aria-controls="tab1" role="tab" data-toggle="tab">�Ӯa�|���n�J</a></li>
						<li role="presentation"><a href="#tab2" aria-controls="tab2"
							role="tab" data-toggle="tab">�Ӯa���U</a></li>
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
									ACTION="<%=request.getContextPath()%>/StoreLoginHandler"
									name="form2">
	
									<label for="store_acc">�b��</label> <input type="text" name="store_acc"
										id="store_acc" placeholder="�п�JE-MAIL" value="ABCABC50@abc.com"> <br> <br> <label
										for="store_pw">�K�X</label> <input type="password" name="store_pw"
										id="store_pw" placeholder="�п�J�K�X" value="505050"> <br> <br> <a
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
								<form METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" enctype="multipart/form-data">
								<div class="form-horizontal">
								<div class="form-group">
									<label for="store_acc" class="col-xs-12 col-sm-3 control-label">�|���b��(�H�c)</label>
									<div class="col-xs-12 col-sm-5"> <input type="text"
										name="store_acc" id="store_acc1" placeholder="�п�JE-MAIL"
										value="<%=(storeVO == null) ? "sadqwe" : storeVO.getStore_acc()%>" >
									</div>
									<div class="col-xs-12 col-sm-2">
									<span class='error1_acc' style="margin-left:-60px;"></span> 
									<img src="" id="error_img_acc"> 
									</div>
									<div class="col-xs-12 col-sm-2">
									<span class='correct_acc' style="margin-left:-80px;"></span> 
									<img src="" id="correct_img_acc"> 
									</div>
								</div>
								
								<div class="form-group">
									<br> <label for="store_pw" class="col-xs-12 col-sm-3 control-label">�Ӯa�K�X</label> 
									<div class="col-xs-12 col-sm-5">
									<input type="password" name="store_pw" id="store_pw2"
										placeholder="�п�J�K�X6~10�X"
										value="<%=(storeVO == null) ? "1222212" : storeVO.getStore_pw()%>">
									</div>
									<div class="col-xs-12 col-sm-2">
										<span class='error1_pw' style="margin-left:-60px;"></span>
										<img src="" id="error_img_pw">
									</div>
									<div class="col-xs-12 col-sm-2">
										<span class='correct_pw' style="margin-left:-80px;"></span> 
										<img src="" id="correct_img_pw"> 
									</div>
									</div>
									<div class="form-group">
										<label	for="store_pw1" class="col-xs-12 col-sm-3 control-label">�T�{�K�X</label> 
										<div class="col-xs-12 col-sm-5">
										<input type="password"
										name="store_pw1" id="store_pw1" placeholder="�A��J�@���K�X"
										value="<%=(storeVO == null) ? "1222212" : storeVO.getStore_pw()%>">
										</div>
										<div class="col-xs-12 col-sm-2">
											<span class='error1_pw1'style="margin-left:-60px;"></span>
											<img src="" id="error_img_pw1"> 
										</div>
										<div class="col-xs-12 col-sm-2">
											<span class='correct_pw1' style="margin-left:-80px;"></span> 
											<img src="" id="correct_img_pw1"> 
										</div>
									</div>
								<div class="form-group">
									<label for="store_name" class="col-xs-12 col-sm-3 control-label">�Ӯa�W��</label>
									<div class="col-xs-12 col-sm-5"> <input type="text"
										name="store_name" id="store_name" placeholder="�п�J�Ӯa�W��"
										value="<%=(storeVO == null) ? "�֣���" : storeVO.getStore_name()%>" >
									</div>
									<div class="col-xs-12 col-sm-2">
									<span class='error1_name' style="margin-left:-60px;"></span> 
									<img src="" id="error_img_name"> 
									</div>
									<div class="col-xs-12 col-sm-2">
									<span class='correct_name' style="margin-left:-80px;"></span> 
									<img src="" id="correct_img_name"> 
									</div>
								</div>
								<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
								<div class="form-group">
									<label for="sc_id" class="col-xs-12 col-sm-3 control-label">�Ӯa���O</label>
									<div class="col-xs-12 col-sm-5">
									<select size="1" name="sc_id">
										<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
										<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
										</c:forEach>
									</select>
									</div>
									<div class="col-xs-12 col-sm-2">
									<span class='error1_sc' style="margin-left:-60px;"></span> 
									<img src="" id="error_img_sc"> 
									</div>
									<div class="col-xs-12 col-sm-2">
									<span class='correct_sc' style="margin-left:-80px;"></span> 
									<img src="" id="correct_img_sc"> 
									</div>
								</div>
									<div class="form-group">
										<label	for="store_content" class="col-xs-12 col-sm-3 control-label">�Ӯa²��</label> 
										<div class="col-xs-12 col-sm-5">
										<input type="text"
										name="store_content" id="store_content" placeholder="�п�J�Ӯa²��"
										value="<%=(storeVO == null) ? "�n�Y�n�Y�n�n�Y" : storeVO.getStore_content()%>">
										</div>
										<div class="col-xs-12 col-sm-2">
											<span class='error1_content'style="margin-left:-60px;"></span>
											<img src="" id="error_img_content"> 
										</div>
										<div class="col-xs-12 col-sm-2">
											<span class='correct_content' style="margin-left:-80px;"></span> 
											<img src="" id="correct_img_content"> 
										</div>
									</div>
									<div class="form-group">
										<label for="store_phone" class="col-xs-12 col-sm-3 control-label">�Ӯa�q��</label> 
										<div class="col-xs-12 col-sm-5">
										<input type="text" name="store_phone" id="store_phone" placeholder="�п�J�q��10�Ӧr"
										value="<%=(storeVO == null) ? "0912345678" : storeVO.getStore_phone()%>">
										</div>
										<div class="col-xs-12 col-sm-2">
										<span class='error1_phone'style="margin-left:-60px;" ></span> 
										<img src="" id="error_img_phone"> 
										</div>
										<div class="col-xs-12 col-sm-2">
										<span class='correct_phone' style="margin-left:-80px;"></span> 
										<img src="" id="correct_img_phone">
										</div>
									</div>
									<div class="form-group">
										<label for="store_addr" class="col-xs-12 col-sm-3 control-label">�Ӯa�a�}</label>
										<div class="col-xs-12 col-sm-5">
											<input type="text" name="store_addr" id="store_addr"
													placeholder="�п�J�a�}" value="<%=(storeVO == null) ? "�ڮa�j��" : storeVO.getStore_addr()%>">
										</div>
										<div class="col-xs-12 col-sm-2">
											<span class='error1_addr' style="margin-left:-60px;"></span> 
											<img src="" id="error_img_addr"> 
											</div>
											<div class="col-xs-12 col-sm-2">
											<span class='correct_addr' style="margin-left:-80px;"></span> 
											<img src="" id="correct_img_addr">
										</div>
									</div>
									<div class="form-group">
										<label for="store_image" class="col-xs-12 col-sm-3 control-label">�Ӯa�Ӥ�</label>
										<div class="col-xs-12 col-sm-5">
										<input type="file" name="store_image" id="upfile1" >
										<p>
										<img id="image"  style="max-width: 150px; max-height: 150px;">
										</p>
										</div>
										<div class="col-xs-12 col-sm-3">
											
										</div>
									</div>
									<div class="form-group">
										<label for="store_out" class="col-xs-12 col-sm-3 control-label">�Ӯa�O�_�~�e</label>
										<div class="col-xs-12 col-sm-5">
											<select name="store_out">
												<option value='���~�e'>���~�e</option>
												<option value='�S���~�e'>�S���~�e</option></select>
				 						 </div>
										<div class="col-xs-12 col-sm-2">
											<span class='error1_out' style="margin-left:-60px;"></span> 
											<img src="" id="error_img_out">
											</div>
											<div class="col-xs-12 col-sm-2"> 
											<span class='correct_out' style="margin-left:-80px;"></span> 
											<img src="" id="correct_img_out">
										</div>
									</div>
									<div class="form-group">
										<label for="store_zone" class="col-xs-12 col-sm-3 control-label">�Ӯa�a��</label>
										<div class="col-xs-12 col-sm-5">
											<select size="1" name="store_zone">
													<option value="�򶩥�">�򶩥�
													<option value="�O�_��">�O�_��
													<option value="�s�_��">�s�_��
													<option value="��饫">��饫
													<option value="�s�˥�">�s�˥�
													<option value="�s�˿�">�s�˿�
													<option value="�]�߿�">�]�߿�
													<option value="�O����">�O����
													<option value="���ƿ�">���ƿ�
													<option value="�n�뿤">�n�뿤
													<option value="���L��">���L��
													<option value="�Ÿq��">�Ÿq��
													<option value="�Ÿq��">�Ÿq��
													<option value="�O�n��">�O�n��
													<option value="������">������
													<option value="�̪F��">�̪F��
													<option value="�O�F��">�O�F��
													<option value="�Ὤ��">�Ὤ��
													<option value="�y����">�y����
												</select>
				 						 </div>
										<div class="col-xs-12 col-sm-2">
											<span class='error1_zone' style="margin-left:-60px;"></span> 
											<img src="" id="error_img_zone"> 
											</div>
											<div class="col-xs-12 col-sm-2">
											<span class='correct_zone' style="margin-left:-80px;"></span> 
											<img src="" id="correct_img_zone">
										</div>
									</div>
										<div class="form-group">
										<input type="hidden" name="requestURL"
										value="<%=request.getServletPath()%>" > <br> <br>
									    <input type="hidden" name="action" value="insert">
										<input type="submit" value="�e�X�s�W" id="input" >
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
