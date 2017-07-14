<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* "%>
<%@ page import="com.product.model.* "%>
<%@ page import="com.order.model.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<link rel="stylesheet"
     href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet"
     href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
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

	<style>
		.form-group {
		 text-align: left;
		}

		.form-group label {
		 float: left;
		}

		.title {
		 color: red;
		}

		h3 {
		 color: #dd0000;
		 font-weight: bolder;
		 height: 27px;
		 position: relative;
		 padding: 7px 0px 0px 32px;
		 border-radius: 5px 5px 0px 0px;
		 text-shadow: 1px 1px 0px #ccc;
		}

		body {
		 font-size: 13px;
		 color: #333;
		 font-family: "微軟正黑體", Arial, sans-serif;
		}

		form {
		 padding-top: 60px;
		}

/* 		li { */
/* 		 height: 50px; */
/* 		} */

		.bb, .cc {
		 height: 150px;
		}

		.dd {
		 text-align: center;
		 padding-top: 50px;
		}

		.ui-datepicker-trigger {
		 margin-left: 5px;
		}

		textarea {
		 resize: none;
		}
		#btn {
		  color: #fff;
		    background-color: #5bc0de;
		    border-color: #46b8da;
		    display: inline-block;
		    padding: 6px 12px;
		    margin-bottom: 0;
		    font-size: 16px;
		    font-weight: 400;
		    line-height: 1.42857143;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    -ms-touch-action: manipulation;
		    touch-action: manipulation;
		    cursor: pointer;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    background-image: none;
		    border: 1px solid transparent;
		    border-radius: 4px;
		  
		}

		#btn:hover {background-color:SkyBlue ;}

		#btn:active {
		  background-color:  #40E0D0;
		 
		  transform: translateY(4px);
		}

	</style>
 
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body bgcolor='white'>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="news.html">Login in</a></span>

				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="news.html">最新消息</a></li>
				</ul>
			</div>
		</div>
		<div id="classcontents">
			<div id="items">
				<table border="0" width="720">
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
				<%	
				for (int i = 0; i < buylist.size(); i++) {
					productVO = buylist.get(i);
					String name = productVO.getPro_name();
					int price = (Integer)productVO.getPro_price();
					int quantity =(Integer) productVO.getQuantity();
					String store_id = productVO.getStore_id();
				%>
					<tr>
						<td width="200">
							<div align="center">
								<b><img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=<%= productVO.getPro_id()%>" width="150" height="120"></b>
							</div>
						</td>
						<td width="100">
							<div align="center">
								<b><%=name%></b>
							</div>
						</td>
						<td width="100">
							<div align="center">
								<b><%=price%></b>
							</div>
						</td>
						<td width="100">
							<div align="center">
								<b><%=quantity%></b>
							</div>
						</td>
						<td width="100">
							<div align="center">
								<b><%=price*quantity %></b>
							</div>
						</td>
						<td width="100">
							<div align="center">
								<b></b>
							</div>
						</td>
					</tr>
				<%
					}
				%>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<div align="center">
								<font color="red">
									<b>總金額：</b>
								</font>
							</div>
						</td>
						<td></td>
						<td>
							<font color="red">
								<b>$<%=amount%></b>
							</font>
						</td>
					</tr>
				</table>


				<FORM METHOD = "post" ACTION = "<%=request.getContextPath()%>/frontend/selectOrder/order.do" name = "checkform" >
					<div class="container">
<!-- 					 <div class="row"> -->
                      <div class="col-xs-12 col-sm-10 col-sm-push-1">
                       <div class="panel panel-default">
                        <div class="panel-heading">
						 <h3 class="panel-title title">點餐設定</h3>
					    </div>
					    <ul class="list-group">
                         <li class="list-group-item">
                          <div class="form-group">
                           <div class="col-xs-12 col-sm-4">
						    <label for="aa" class="cntrol-label">取餐方式</label>	
						   </div>
						   <div class="col-xs-12 col-sm-8">
						   	<input type="radio" name="order_way" value="內用">內用　
							<input type="radio" name="order_way" value="外帶">外帶　
							<input type="radio" name="order_way" value="外送">外送
						   </div>
						  </div>
						 </li>

						 <li class="list-group-item">
						  <div class="form-group">
						   <div class="col-xs-12 col-sm-4">
						    <label for="aa" class="control-label">外送地址</label>
						   </div>
						   <div class="col-xs-12 col-sm-8">
						   	<input type = "TEXT" name="receive_address" id="address" value ="<%= (orderVO==null)? " ": orderVO.getReceive_address()%>">
						   </div>
						  </div>
						 </li>
						 
						 <li class="list-group-item">
						  <div class="form-group">
						   <div class="col-xs-12 col-sm-4">
						    <label for="aa" class="control-label">取餐時間</label>
						   </div>
						   <div class="col-xs-12 col-sm-8">		
						    <input type="text" id="datepicker3" name="order_taketime1" value="<%= (orderVO==null)? " ": orderVO.getOrder_taketime()%>">
            				<label for="SearchTime">
            					<span><em  class="moreSpace">時</em> 間</span>:&nbsp;
            				</label>
            				<select id="SearchTime" name="order_taketime2" style="width: 85px;">
            					<option value="">請選擇</option>
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
						   </div>
						  </div>
						 </li>
						 
						 <li class="list-group-item">
        				  <div class="form-group">
                           <div class="col-xs-12 col-sm-4">
                            <label for="aa" class="control-label">付款方式</label>  	 
						   </div>		
                           <div class="col-xs-12 col-sm-8">
							<input type="radio" name="pay" value="cash">現金　
							<input type="radio" name="pay" value="payPal">電子錢包
						   </div>
						  </div>
						 </li>
						 
						 <li class="list-group-item">
                          <div class="form-group">
                           <div class="col-xs-12 col-sm-4">
                            <label for="aa" class="control-label">備註</label>
                           </div>
                           <div class="col-xs-12 col-sm-8">
							<textarea name="order_note" id="note" cols="50" rows="7" value=""></textarea>	
						   </div>
						  </div>
						 </li>
						</ul>
					   </div>	 

					  </div> 	
<!--                      </div> -->
                    </div> 
					<a href=""><i class="glyphicon glyphicon-ok"></i>取消</a>
									
					<input type="hidden"  value = "setOrder_Into" name="action">
					<input type="hidden"  value = "<%=amount%> " name="amount">
					<input type="hidden"  value = "<%=buylist%>" name="buylist">
					<input type="hidden"  value = "<%=productVO.getStore_id()%>" name="store_id">
					<input type="submit" value="送出新增">
								
					<a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=<%=productVO.getStore_id() %>&quentity=<%=productVO.getQuantity()%>">是否繼續購物</a>
				</FORM>
			</div>
			<div id="footer">
				<ul class="navigation">
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="news.html">最新消息</a></li>
				</ul>
				<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
			</div>
		</div>			
	</div>
</body>
</html>
