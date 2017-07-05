<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* "%>
<%@ page import="com.product.model.* "%>
<%@ page import="com.order.model.* "%>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
 
 <title>Mode II 範例程式 - Checkout.jsp</title>
 
 
</head>
<body bgcolor="#FFFFFF">
 <font size="+3"> 結帳 </font>
<hr><p>

<table border="1" width="720">
	<tr bgcolor="#999999">
		<th width="200">商品圖片</th>
		<th width="100">商品名稱</th>
		<th width="100">商品價格</th>
		<th width="100">數量</th>
		<th width="100">小計</th>
		<th width="120"></th>
	</tr>
	
	<%
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
		Store_OrderVO orderVO = (Store_OrderVO) request.getAttribute("orderVO");
	%>	
	<%ProductVO productVO=new ProductVO(); %>
	<%	for (int i = 0; i < buylist.size(); i++) {
			productVO = buylist.get(i);
			String name = productVO.getPro_name();
			int price = (Integer)productVO.getPro_price();
			int quantity =(Integer) productVO.getQuantity();
			String store_id = productVO.getStore_id();
	%>
	<tr>
		<td width="200"><div align="center"><b><img src="<%=request.getContextPath()%>/ProductClassReader?pro_id=<%= productVO.getPro_id()%>" width="150" height="120"></b></div></td>
		<td width="100"><div align="center"><b><%=name%><%=store_id %></b></div></td>
		<td width="100"><div align="center"><b><%=price%></b></div></td>
		<td width="100"><div align="center"><b><%=quantity%></b></div></td>
		<td width="100"><div align="center"><b><%=price*quantity %></b></div></td>
		<td width="100"><div align="center"><b></b></div></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td><div align="center"><font color="red"><b>總金額：</b></font></div></td>
		<td></td>
		<td> <font color="red"><b>$<%=amount%></b></font> </td>
	</tr>
</table>


<FORM METHOD = "post" ACTION = "<%=request.getContextPath()%>/frontend/selectOrder/order.do" name = "checkform" >
	<div>
		<h1 id="title">點餐設定</h1>
		<br>
		<div id="getWay">
		<p>取餐方式</p>

		
			<input type="radio" name="order_way" value="內用">內用　
			<input type="radio" name="order_way" value="外帶">外帶　
			<input type="radio" name="order_way" value="外送">外送　
		
		<br>
		<p>外送地址</p>
		
		<input type = "TEXT" name="receive_address" id="address" value ="<%= (orderVO==null)? " ": orderVO.getReceive_address()%>">

		<p>取餐時間</p>
		
	
			<input type="text" id="datepicker3" name="order_taketime1" value="<%= (orderVO==null)? " ": orderVO.getOrder_taketime()%>" >
			
            
            <label for="SearchTime"><span><em  class="moreSpace">時</em> 間</span>:&nbsp;</label>
            <select id="SearchTime" name="order_taketime2" style="width: 85px;"><option value="">請選擇</option>
				<option selected="selected" value="06:00">06:00</option>
				<option value="06:30">06:30</option>
				<option value="07:00">07:00</option>
				<option value="07:30">07:30</option>
				<option value="08:00">08:00</option>
				<option value="08:30">08:30</option>
				<option value="09:00">09:00</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
				<option value="19:00">19:00</option>
				<option value="19:30">19:30</option>
				<option value="20:00">20:00</option>
				<option value="20:30">20:30</option>
				<option value="21:00">21:00</option>
				<option value="21:30">21:30</option>
				<option value="22:00">22:00</option>
				<option value="22:30">22:30</option>
				<option value="23:00">23:00</option>
				<option value="23:30">23:30</option>
				</select> 
				             
		
		
		<p>付款方式</p>
		
			<input type="radio" name="pay" value="cash">現金　
			<input type="radio" name="pay" value="payPal">電子錢包
		
		<p>備註</p>
		
		<textarea name="order_note" id="note" cols="30" rows="3" value="123"></textarea>	

		</div>
		
		<div class="col-xs-12 col-sm-8  cc"></div>
		<div class="col-xs-12 col-sm-4  dd">
		<br>
		<br>
			<a href=""><i class="glyphicon glyphicon-ok"></i>取消</a>
<%-- 			<a href="<%=request.getContextPath()%>/order/order.do?action=setOrder_Into&store_id=<%=productVO.getStore_id() %>&quentity=<%=productVO.getQuantity() %>" class="btn btn-info" class="btn btn-info"><i id="finish" class="glyphicon glyphicon-ok"></i>完成點餐</a> --%>
		<input type="hidden"  value = "setOrder_Into" name="action">
		<input type="hidden"  value = "<%=amount%> " name="amount">
		<input type="hidden"  value = "<%=productVO.getStore_id()%>" name="store_id">
		
		<input type="submit" value="送出新增">
		</div>
		<br>
		<br>
	</div>
		<p><a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=<%=productVO.getStore_id() %>&quentity=<%=productVO.getQuantity()%>">是否繼續購物</a>
		</FORM>
		
<script>
		
		$("#datepicker3").datepicker({
			showOn : "button",
			buttonImage : "../frontend/shoppingcart/images/calendar.gif",
			buttonImageOnly : true,
			changeMonth: true,
			changeYear: true,
			dateFormat:'yy-mm-dd'
		});
	
</script>		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js">
		

</body>
</html>
