<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
		/*.table-striped tbody tr:nth-of-type(odd){
			background-color: #afa;
		}	*/

		#header{
			height: 200px;
			background-color: #F5F5DC;
		}
		/*LOGO*/
		#page div#header a img{
			float:left;
			margin:20px 0  0 220px;
			width:160px;
		}

		.table-hover tbody tr:hover{
			background-color: #fa0;
		}	

		div>p{
			font-size: 30px;
		}
		
		th{
			font-size: 25px;
		}

		td{
			font-size: 20px;
		}

		</style>	
	</head>
	<body>
	<div id="page">
		<div id="header">
			<a href="index.html">
				<img src="images/logo.png" width="150px" height="150">
			</a>
		</div>
	</div>
	    <div class="col-xs-12 col-sm-4  ee" align="right">
			<font size="30">購物車(3)</font>
	    </div>
		<div class="col-xs-12 col-sm-8  ff"></div>
		

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<table class="table table-hover table-condensed  ">
						<thead>
							<tr>
								<th></th>
								<th>商品名稱</th>
								<th>價格</th>
								<th>數量</th>
								<th>小計</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center" ><img src="images/coffee1.jpg" width="150" height="120"></td>
								<td valign="center" margin-top="20">xxx漢堡</td>
								<td>$260</td>
								<td>1</td>
								<td>$260</td>
								<td>刪除</td>
							</tr>
							<tr>
								<td align="center"><img src="images/coffee2.jpg" width="150" height="120"></td>
								<td>xxx漢堡</td>
								<td>$180</td>
								<td>2</td>
								<td>$360</td>
								<td>刪除</td>
							</tr>
							<tr>
								<td align="center"><img src="images/coffee3.jpg" width="150" height="120"></td>
								<td>xxx漢堡</td>
								<td>$150</td>
								<td>3</td>
								<td>$450</td>
								<td>刪除</td>
							</tr>
						</tbody>
					</table>
					<hr>
				</div>		
			</div>
		</div>
		
		

		<div class="col-xs-12 col-sm-8  cc"></div>
		<div class="col-xs-12 col-sm-4  dd">
			<p>Subtotal : $1070</p>
			<br><br>
			<a href="#" class="btn btn-info"><i class="glyphicon glyphicon-ok"></i>回商店/繼續購物</a>
			<a href="#" class="btn btn-info"><i class="glyphicon glyphicon-ok"></i>下一步</a>
		</div>



		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>