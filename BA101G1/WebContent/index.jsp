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
<title>吃訂我線上訂餐系統</title>

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
						<h1>選擇地區</h1>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
							<select size="1" name="store_zone">
								<option value="基隆市">基隆市
								<option value="臺北市">臺北市
								<option value="新北市">新北市
								<option value="桃園市">桃園市
								<option value="新竹市">新竹市
								<option value="新竹縣">新竹縣
								<option value="苗栗縣">苗栗縣
								<option value="臺中市">臺中市
								<option value="彰化縣">彰化縣
								<option value="南投縣">南投縣
								<option value="雲林縣">雲林縣
								<option value="嘉義市">嘉義市
								<option value="嘉義縣">嘉義縣
								<option value="臺南市">臺南市
								<option value="高雄市">高雄市
								<option value="屏東縣">屏東縣
								<option value="臺東縣">臺東縣
								<option value="花蓮縣">花蓮縣
								<option value="宜蘭縣">宜蘭縣
							</select>
							<input type="submit" value="送出"> <input type="hidden" name="action" value="get_zone">
						</FORM>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
							<b>搜尋商家:</b>
							<input type="text" name="store_name">
							<input type="submit" value="送出">
							<input type="hidden" name="action" value="get_store_a">
						</FORM>

						<%-- 錯誤表列 --%>
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

				<!--圖片區-->
				<div id="abgneBlock">
					<ul class="list">
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_01.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_02.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_03.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_04.jpg"></a></li>
						<li><a target="_blank" href="#"><img src="<%=request.getContextPath()%>/images/banner_05.jpg"></a></li>
					</ul>
				</div>

				<!--廣告區-->
				<h2>廣告</h2>
				<ul id="promotions">
					<li>
						<div class="poster">
							<a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000006"> <img
								src="<%=request.getContextPath()%>/images/AD_01.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000006">Shop</a>
						<h2>伯朗分享日</h2>
						<p>飲品買一送一 【活動日期】：2016/2/1、2/8、2/15、2/22、2/29
							【活動門市】：全門市(部份門市活動日不同，詳參注意事項2、3之說明) 【活動內容】：凡購買飲品任一杯，再贈送您飲品一杯
							，與您好友分享咖啡香(結帳金額以高價品計)</p>
					</li>
					<li>
						<div class="poster">
							<a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000007"> <img
								src="<%=request.getContextPath()%>/images/AD_02.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000007">Shop</a>
						<h2>週末派對餐</h2>
						<p>
							21世紀風味館則是今年的每週五、六、日，出示21世紀風味館官網優惠訊息(或截圖)，即可享有週末派對餐（21香草烤雞＋鮮蔬沙拉＋大薯霸x2＋蜂蜜綠茶(L)x2）440元，21香草烤雞單點優惠價
							315元。活動僅到今年的12月18日。</p>
					</li>
					<li>
						<div class="poster">
							<a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000004"> <img
								src="<%=request.getContextPath()%>/images/AD_03.jpg" alt="Img"
								height="282" width="204"></a> <span class="clearance"></span>
						</div> <a href="<%=request.getContextPath() %>/store/store.do?action=getProduct_By_Store&store_id=STO-000004">Shop</a>
						<h2>夏夜雙享受</h2>
						<p>本活動期間為即日起至2015年9月30日之每日夜間21:00~凌晨00:00
							活動期間內至麥當勞消費，大包薯條第二包$10
							此促銷優惠限於單點大包薯條時使用，點購套餐加價升級大薯時不適用，亦不得與店內其他優惠合併使用</p>
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
		// 先取得必要的元素並用 jQuery 包裝
		// 再來取得 $block 的高度及設定動畫時間
		var $block = $('#abgneBlock'),
			$slides = $('ul.list', $block),
			_width = $block.width(),
			$li = $('li', $slides),
			_animateSpeed = 600, 
			// 加入計時器, 輪播時間及控制開關
			timer, _showSpeed = 3000, _stop = false;
		// 產生 li 選項
		var _str = '';
		for(var i=0, j=$li.length;i<j;i++){
			// 每一個 li 都有自己的 className = playerControl_號碼
			_str += '<li class="playerControl_' + (i+1) + '"></li>';
		}
		// 產生 ul 並把 li 選項加到其中
		var $playerControl = $('<ul class="playerControl"></ul>').html(_str).appendTo($slides.parent()).css('left', function(){
			// 把 .playerControl 移到置中的位置
			return (_width - $(this).width()) / 2;
		});
		
		// 幫 li 加上 click 事件
		var $playerControlLi = $playerControl.find('li').click(function(){
			var $this = $(this);
			$this.addClass('current').siblings('.current').removeClass('current');
			clearTimeout(timer);
			// 移動位置到相對應的號碼
			$slides.stop().animate({
				left: _width * $this.index() * -1
			}, _animateSpeed, function(){
				// 當廣告移動到正確位置後, 依判斷來啟動計時器
				if(!_stop) timer = setTimeout(move, _showSpeed);
			});
			return false;
		}).eq(0).click().end();
		// 如果滑鼠移入 $block 時
		$block.hover(function(){
			// 關閉開關及計時器
			_stop = true;
			clearTimeout(timer);
		}, function(){
			// 如果滑鼠移出 $block 時
			// 開啟開關及計時器
			_stop = false;
			timer = setTimeout(move, _showSpeed);
		});
		
		// 計時器使用
		function move(){
			var _index = $('.current').index();
			$playerControlLi.eq((_index + 1) % $playerControlLi.length).click();
		}
	});
</script>
</html>
