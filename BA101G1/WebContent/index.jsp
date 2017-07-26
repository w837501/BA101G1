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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style type="text/css">
	#abgneBlock {
		width: 700px;
		height: 200px;
		position: relative;
		overflow: hidden;
		border: 1px solid #ccc;
	}
	#abgneBlock ul.list {
		padding: 0;
		margin: 0;
		list-style: none;
		position: absolute;
		width: 9999px;
		height: 100%;
	}
	#abgneBlock ul.list li {
		float: left;
		width: 700px;
		height: 100%;
	}
	#abgneBlock .list img{
		width: 100%;
		height: 100%;
		border: 0;
	}
	#abgneBlock ul.playerControl {
		margin: 0;
		padding: 0;
		list-style: none;
		position: absolute;
		bottom: 5px;
		right: 5px;
		height: 14px;
	}
	#abgneBlock ul.playerControl li {
		float: left;
		width: 10px;
		height: 10px;
		cursor: pointer;
		margin: 0px 2px;
		background: #DDDDDD;
		/*background: url(images/cir_ctrl.png) no-repeat -10px 0;*/
	}
	#abgneBlock ul.playerControl li.current { 
		background-position: 0 0;
	}
</style>
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
				<div id="abgneBlock">
					<ul class="list">
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_01.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_02.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_03.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_04.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_05.jpg"></a></li>
					</ul>
				</div>

				<!--�s�i��-->
				<h2>�s�i</h2>
				<ul id="promotions">
					<li>
						<div class="poster">
							<a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000006"> <img
								src="<%=request.getContextPath()%>/images/AD_01.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000006">Shop</a>
						<h2>�B�Ԥ��ɤ�</h2>
						<p>���~�R�@�e�@ �i���ʤ���j�G2016/2/1�B2/8�B2/15�B2/22�B2/29
							�i���ʪ����j�G������(�����������ʤ餣�P�A�԰Ѫ`�N�ƶ�2�B3������) �i���ʤ��e�j�G�Z�ʶR���~���@�M�A�A�ذe�z���~�@�M
							�A�P�z�n�ͤ��ɩ@�ح�(���b���B�H�����~�p)</p>
					</li>
					<li>
						<div class="poster">
							<a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000007"> <img
								src="<%=request.getContextPath()%>/images/AD_02.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000007">Shop</a>
						<h2>�g�������\</h2>
						<p>
							21�@�������]�h�O���~���C�g���B���B��A�X��21�@�������]�x���u�f�T��(�κI��)�A�Y�i�ɦ��g�������\�]21����N�����A���F�ԡϤj���Qx2�ϸ��e���(L)x2�^440���A21����N�����I�u�f��
							315���C���ʶȨ줵�~��12��18��C</p>
					</li>
					<li>
						<div class="poster">
							<a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000004"> <img
								src="<%=request.getContextPath()%>/images/AD_03.jpg" alt="Img"
								height="282" width="204"></a> <span class="clearance"></span>
						</div> <a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000004">Shop</a>
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
<script type="text/javascript">
	$(function(){
		// �����o���n�������å� jQuery �]��
		// �A�Ө��o $block �����פγ]�w�ʵe�ɶ�
		var $block = $('#abgneBlock'),
			$slides = $('ul.list', $block),
			_width = $block.width(),
			$li = $('li', $slides),
			_animateSpeed = 600, 
			// �[�J�p�ɾ�, �����ɶ��α���}��
			timer, _showSpeed = 3000, _stop = false;
		// ���� li �ﶵ
		var _str = '';
		for(var i=0, j=$li.length;i<j;i++){
			// �C�@�� li �����ۤv�� className = playerControl_���X
			_str += '<li class="playerControl_' + (i+1) + '"></li>';
		}
		// ���� ul �ç� li �ﶵ�[��䤤
		var $playerControl = $('<ul class="playerControl"></ul>').html(_str).appendTo($slides.parent()).css('left', function(){
			// �� .playerControl ����m������m
			return (_width - $(this).width()) / 2;
		});
		
		// �� li �[�W click �ƥ�
		var $playerControlLi = $playerControl.find('li').click(function(){
			var $this = $(this);
			$this.addClass('current').siblings('.current').removeClass('current');
			clearTimeout(timer);
			// ���ʦ�m��۹��������X
			$slides.stop().animate({
				left: _width * $this.index() * -1
			}, _animateSpeed, function(){
				// ��s�i���ʨ쥿�T��m��, �̧P�_�ӱҰʭp�ɾ�
				if(!_stop) timer = setTimeout(move, _showSpeed);
			});
			return false;
		}).eq(0).click().end();
		// �p�G�ƹ����J $block ��
		$block.hover(function(){
			// �����}���έp�ɾ�
			_stop = true;
			clearTimeout(timer);
		}, function(){
			// �p�G�ƹ����X $block ��
			// �}�Ҷ}���έp�ɾ�
			_stop = false;
			timer = setTimeout(move, _showSpeed);
		});
		
		// �p�ɾ��ϥ�
		function move(){
			var _index = $('.current').index();
			$playerControlLi.eq((_index + 1) % $playerControlLi.length).click();
		}
	});
</script>
</html>
