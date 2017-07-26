<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
	Store_OrderService orderSvc=new Store_OrderService();
	String mem_id=memberVO.getMem_id();
	List<Store_OrderVO> store_orderVO=new LinkedList<Store_OrderVO>();
	 store_orderVO=orderSvc.getOrderByMem_id(mem_id);
	 pageContext.setAttribute("store_orderVO",store_orderVO);
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
		});
</script>

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
	
    .pgbarColor .ui-progressbar-value {
    background-color: lightgreen !important;
    }
</style>
<body onload="connect();" onunload="disconnect();">
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>


		<div class="contents" style="margin-top:30px;margin-bottom:900px;">
				<div id="mem-button" style="margin-left:50px;float:left;">
						
						<h1>我的帳戶</h1><br>
						
						<a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">
							<div>修改資料</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">
							<div>查詢訂單</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">
							<div>查詢檢舉</div>
						</a>
				</div>
				
				<div style="float:right;margin-top:20px;margin-right:50px;">
					<div class="page-header"> 
						<h3>會員訂單紀錄</h3>
			 		</div> 
					<div id="textBox" style="visibility: hidden;"></div>		
					<div id="progressbar" style="visibility: hidden;"></div>		
					<table border='1' bordercolor='#CCCCFF' width='680' bgcolor='#FFBB66'>
						<tr>
							<th width="11%"><font size="2">訂單編號</font></th>
							<th width="10%"><font size="2">訂餐時間</font></th>
							<th width="10%"><font size="2">取餐時間</font></th>
							<th width="10%"><font size="2">店家名稱</font></th>
							<th width="10%"><font size="2">總金額</font></th>
							<th width="10%"><font size="2">取餐方式</font></th>
							<th width="10%"><font size="2">訂單狀態</font></th>
							<th width="10%"><font size="2">取消訂單</font></th>
							<th width="10%"><font size="2">檢舉商家</font></th>
							<th width="10%"><font size="2">明細</font></th>
						</tr>
					</table>

					
				<c:forEach var="store_orderVO1" items="${store_orderVO}" >
				<table border='1' bordercolor='#CCCCFF' width='680'>
					<tr align='center' valign='middle' ${(store_orderVO1.order_id==param.order_id) ? 'bgcolor=#CCCCFF':''}>
						<td width="11%"><font size="2">
							<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO1.order_id}" name="ahrefName">${store_orderVO1.order_id}</a>
						</td>
						<td width="10%"><font size="2"><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO1.order_time }"/></font></td>
						<td width="10%"><font size="2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO1.order_taketime }"/></font></td>
				 		<td width="10%"><font size="2">${store_orderVO1.store_name }</font></td>
						<td width="10%"><font size="2">${store_orderVO1.totalprice }</font></td>
						<td width="10%"><font size="2">${store_orderVO1.order_way }</font></td>
						<td width="10%"><font size="2">
						<!-- ***************************************************************** -->
						<div name="statusOutput">${store_orderVO1.order_state}</div>
	
						</font></td>
						<!-- ***************************************************************** -->
						<td width="10%"><font size="2">
							<c:if test="${store_orderVO1.order_state eq '未確認'}">
								<form method="post" action="<%=request.getContextPath()%>/frontend/selectOrder/order.do">

									<input type="submit" value="取消訂單">

									<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
									<input type="hidden" name="store_id" value="${store_orderVO1.store_id}">
									<input type="hidden" name="action" value="Cancel">
								</form>
							</c:if>
				<%-- 			<c:if test="${store_orderVO1.order_state != '未確認'}">無法取消</c:if> --%>
						</font>
						</td>
						<td width="10%"><font size="2">
							<c:if test="${store_orderVO1.order_state eq '已取消' || store_orderVO1.order_state eq '已取餐'}">
								<form method="post" action="<%=request.getContextPath()%>/frontend/mem/member_addMR.jsp">
									<input type="submit" value="檢舉">
									<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
								</form>
							</c:if>
				<%-- 			<c:if test="${store_orderVO1.order_state != '已取消' &&store_orderVO1.order_state != '已取餐'}">無法檢舉</c:if> --%>
						</font>
						</td>
						<td width="10%">
							<input type="button" value="顯示" class="abc" >
						</td>
					</tr>
					
					<jsp:useBean id="orderlistSvc" scope="page" class="com.orderlist.model.OrderlistService"></jsp:useBean>
					<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
						<tr style="display: none;">
							<td colspan="4"></td>
							<td colspan="2" bgcolor="#FFBB66">商品名稱</td>		
							<td colspan="2" bgcolor="#FFBB66">數量</td>
							<td colspan="2" bgcolor="#FFBB66">總金額</td>
						</tr>
					<c:forEach var="orderlistVO" items="${orderlistSvc.getOrderlist(store_orderVO1.order_id)}" >
						<tr style="display: none;">
							<td colspan="4"></td>
							<td colspan="2">${productSvc.getOnePro(orderlistVO.pro_id).pro_name}</td>		
							<td colspan="2">${orderlistVO.order_amount}</td>
							<td colspan="2">${orderlistVO.price}</td>
						</tr>
					</c:forEach>
					<tr>
					<td colspan="8" class="progressbar pgbarColor" id="${store_orderVO1.order_id}"></td>
					</tr>
				</table>
				</c:forEach>
				</div>
			
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>
	

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
<script>
	var finalVal = 0;

	$( function() {
	    $( ".progressbar" ).progressbar({
	      value: finalVal
	    });
	  } );
    
    
    var MyPoint = "/MyEchoServer";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var statusOutput = document.getElementsByName("statusOutput");//HTML中要更換的文字
	var webSocket;
	var str2 , upABC;
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL); // 1.執行完，觸發MyEchoServer.java的onOpen()
		
		webSocket.onopen = function(event) { // 3.執行完，觸發updateStatus("WebSocket 成功連線");
			
		};

		webSocket.onmessage = function(event) { // 6.執行完，觸發messagesArea.value，用message重複加上;
			var order_id = document.getElementsByName("ahrefName");	//HTML中<a href>中的文字order_id
			console.log(order_id);
			var jsonObj = JSON.parse(event.data);
			var val = jsonObj.status;
			var key = jsonObj.orderId;
			var pgbarId = document.getElementById(key);
			alert('onmessage pgbarId' +pgbarId);
			for(var i=0;order_id.length;i++ ){
				if(order_id[i].innerHTML==key){
// 					updateStatus( upABC,ra1,str);因為長度剛好跟statusOutput[j]一致，一對一	
					statusOutput[i].innerHTML = val;
					console.log('val'+val+' finalVal '+finalVal);
					switch(val) {
					    case "未確認":
					    	finalVal = 0;
					        break;
					    case "已確認":
					    	finalVal = 50;
					        break;
					    case "待取餐":
					    	finalVal = 100;
					        break;
					    default:
					    	finalVal = 100;
					}
					
				    var progressbar = $( "#"+key ),
				      progressLabel = $( ".progress-label" );
				 
				    progressbar.progressbar({
				      value: false,
				      change: function() {
				        progressLabel.text( progressbar.progressbar( "value" ) + "%" );
				      },
				      complete: function() {
				        progressLabel.text( "Complete!" );
				      }
				    });
				    function progress() {
				      var val = progressbar.progressbar( "value" ) || finalVal-50;
				 
				      progressbar.progressbar( "value", val + 2 );
				 
				      if ( val < finalVal ) {
				        setTimeout( progress, 80 );
				      }
				    }
				 
				    setTimeout( progress, 2000 );
// 					var b;
// 					while(b!=a){
// 						b++;
// 					}
// 					$( function() {
// 						$( "#progressbar" ).progressbar({
// 							value: a
// 						});
// 					});
				}


					
					
					document.getElementById("textBox").innerHTML=order_id[i].innerHTML+" : "+val;
				}
			}
		};

		webSocket.onclose = function(event) {
			updateStatus("WebSocket 已離線");
		};
	
	function sendMessage(id) { // 4.執行完，觸發MyEchoServer.java的onMessage()
			str2 = id;
	        var jsonObj = {"orderId": id , "status" : "未確認"};
	        webSocket.send(JSON.stringify(jsonObj));// 4.執行完，觸發MyEchoServer.java的onMessage()
	}
	
	function disconnect () {
		webSocket.close();
	}

	
// 	function updateStatus(upABC,ra1,newStatus) {
// 		console.log(upABC+" : "+ra1+" : ");
// 		for(var j=0;j<statusOutput.length;j++){
// 			console.log(statusOutput[j].outerHTML);
// 			if(upABC == ra1){
// 				statusOutput[j].innerHTML = newStatus;	
// 			}
				
// 		}
		
// 	}
    
</script>