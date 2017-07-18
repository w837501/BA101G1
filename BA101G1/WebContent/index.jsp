<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<div id="page">
		<div id="header">
			
			<jsp:include page="/header_both.jsp" />
		</div>
	

		<div id="contentsHome">
			<div id="main">
				<div id="adbox">
					<img src="<%=request.getContextPath()%>/images/Cuisine.jpg" alt="Img">
					<div class="info">
						<h1>��ܦa��</h1>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
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
							<input type="submit" value="�e�X"> <input type="hidden" name="action" value="get_zone">
						</FORM>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
							<b>�j�M�Ӯa:</b>
							<input type="text" name="store_name">
							<input type="submit" value="�e�X">
							<input type="hidden" name="action" value="get_store_a">
						</FORM>

						<%-- ���~��C --%>
						<c:if test="${not empty errorMsgs}">
							<font color='red'>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li>${message}</li>
									</c:forEach>
								</ul>
							</font>
						</c:if>

					</div>
				</div>

				<!--�Ϥ���-->
				<div id="carousel">
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/mos.png" alt="Img"
								height="160" width="160"></a>
						</div>
					</li>
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/Hamburgers01.jpg"
								alt="Img" height="160" width="160"></a>
						</div>
					</li>
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/Hamburgers02.jpg"
								alt="Img" height="160" width="160"></a>
						</div>
					</li>
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/Hamburgers03.jpg"
								alt="Img" height="160" width="160"></a>
						</div>
					</li>
				</div>

				<!--�p���I-->
				<div id="ol">
					<ul class="carousel-indicators" type="circle">
						<li id="circle">��</li>
						<li id="circle">��</li>
						<li id="circle">��</li>
					</ul>
				</div>


				<!--�s�i��-->
				<h2>�s�i</h2>
				<ul id="promotions">
					<li>
						<div class="poster">
							<a href="fragrance.html"> <img
								src="<%=request.getContextPath()%>/images/AD_01.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="fragrance.html">Shop</a>
						<h2>�B�Ԥ��ɤ�</h2>
						<p>���~�R�@�e�@ �i���ʤ���j�G2016/2/1�B2/8�B2/15�B2/22�B2/29
							�i���ʪ����j�G������(�����������ʤ餣�P�A�԰Ѫ`�N�ƶ�2�B3������) �i���ʤ��e�j�G�Z�ʶR���~���@�M�A�A�ذe�z���~�@�M
							�A�P�z�n�ͤ��ɩ@�ح�(���b���B�H�����~�p)</p>
					</li>
					<li>
						<div class="poster">
							<a href="cosmetics.html"> <img
								src="<%=request.getContextPath()%>/images/AD_02.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="cosmetics.html">Shop</a>
						<h2>�g�������\</h2>
						<p>
							21�@�������]�h�O���~���C�g���B���B��A�X��21�@�������]�x���u�f�T��(�κI��)�A�Y�i�ɦ��g�������\�]21����N�����A���F�ԡϤj���Qx2�ϸ��e���(L)x2�^440���A21����N�����I�u�f��
							315���C���ʶȨ줵�~��12��18��C</p>
					</li>
					<li>
						<div class="poster">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/AD_03.jpg" alt="Img"
								height="282" width="204"></a> <span class="clearance"></span>
						</div> <a href="skincare.html">Shop</a>
						<h2>�L�]���ɨ�</h2>
						<p>�����ʴ������Y��_��2015�~9��30�餧�C��]��21:00~���00:00
							���ʴ������ܳ���Ү��O�A�j�]�����ĤG�]$10
							���P�P�u�f������I�j�]�����ɨϥΡA�I�ʮM�\�[���ɯŤj���ɤ��A�ΡA�礣�o�P������L�u�f�X�֨ϥ�</p>
					</li>
				</ul>

			</div>
		</div>

		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>

</body>
</html>
