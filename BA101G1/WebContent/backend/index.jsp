<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>吃訂我EatMe</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    	<!-- LOGIN STYLES -->
    <link href="assets/css/login.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
     
           
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top" style="background-color: #ccc;">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="<%=request.getContextPath() %>/backend/index.jsp">
                        <img src="assets/img/LOGO_2.png" style="width: 180px;"/>

                    </a>
                    
                </div>
                
                <span class="logout-spn" >
                  <a href="#" data-toggle="modal" data-target="#login-modal">登入</a>  
                </span>
                
                
            </div>
        </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 


                    <li class="active-link">
                        <a href="<%=request.getContextPath() %>/backend/mem/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 <span class="badge">Included</span></a>
                    </li>
                   

                    <li>
                        <a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><i class="fa fa-table "></i>訂單管理  <span class="badge">Included</span></a>
                    </li>

 <!-- 收合式清單====檢舉管理============================== -->
                    <li class="panel panel-default panel-heading" role="tab" id="panel1">
     
                      <a href="#aaa" data-parent="#accordion2" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="aaa">
                        <i class="fa fa-edit "></i>檢舉管理  <span class="badge">Included</span>
                      </a>
                    
                      <div id="aaa" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="panel1">
                        <div class="list-group">
                          <a href="<%=request.getContextPath() %>/backend/memr/select_page.jsp" class="list-group-item">會員檢舉</a>
                          <a href="<%=request.getContextPath() %>/backend/str/selectPage.jsp" class="list-group-item">商家檢舉</a>                       
                        </div>
                      </div>                   
                    </li>
<!-- ================================== -->
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>審核管理<span class="badge">要連結哪個?</span></a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath() %>/backend/push/selectPage.jsp"><i class="fa fa-edit "></i>推播管理 </a>
                    </li>

                     <li>
                        <a href="#"><i class="fa fa-edit "></i>個人資料</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/rev/Select_Rev.jsp"><i class="fa fa-bar-chart-o"></i>商家月結算</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/man/select_man.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
                    </li>






                    
                </ul>
              </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     	<h2>後端管理者平台</h2>   
                    </div>
                </div>              

                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                            <strong> Nash  之代辦事項</strong> You Have No pending Task For Today.
                        </div>
                    </div>
                    
<!-- ****************代辦事項************************ -->
                <div class="row text-center pad-top">
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                        <div class="div-square">
                            <a href="blank.html">
                                <i class="fa fa-circle-o-notch fa-5x"></i>
                                <h4>Check Data</h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                        <div class="div-square">
                            <a href="blank.html">
                                <i class="fa fa-envelope-o fa-5x"></i>
                                <h4>Mail Box</h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                        <div class="div-square">
                            <a href="blank.html">
                                <i class="fa fa-lightbulb-o fa-5x"></i>
                                <h4>New Issues</h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                        <div class="div-square">
                            <a href="blank.html">
                                <i class="fa fa-users fa-5x"></i>
                                <h4>See Users</h4>
                            </a>
                        </div>
                    </div>
                </div>
<!-- ****************代辦事項************************ -->
        </div>
        <!-- /. PAGE WRAPPER  -->

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  2014 yourdomain.com | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
<!-- ***************************Login區塊************************************************************************ -->              
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
   	  <div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>Login to Your Account</h1><br>
				
			  <form method="post" action="<%=request.getContextPath() %>/backend/man/man.do">
				<input type="text" name="user" placeholder="請輸入帳號" id="accText">
				<input type="password" name="pass" placeholder="請輸入密碼" id="pwdText">
				<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				<input type="hidden" name="action" value="loginCHK">
			  </form>
				<p id="demo">Click the button to delete my HTML content (innerHTML).</p>
			  <div class="login-help">
				  <button type="button" class="btn btn-lg btn-success">
						<a href="<%=request.getContextPath() %>/backend/man/register.jsp">Register</a>
				  </button>-
				  <button type="button" class="btn btn-lg btn-success">
						<a href="<%=request.getContextPath() %>/back end/man/register.jsp">Forgot Password</a>
				  </button>
			  </div>

			</div>
		</div>
	 </div>
<!-- ***************************Login區塊************************************************************************ -->    
</body>
</html>


