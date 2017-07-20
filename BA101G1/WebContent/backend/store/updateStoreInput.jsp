<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%
	StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>
<html>
<head>
  <title>吃訂我EatMe</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
        <!-- LOGIN STYLES -->
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> 
</head>
<body>
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="<%=request.getContextPath() %>/backend/index.jsp">
                        <img src="<%=request.getContextPath() %>/backend/assets/img/LOGO_2.png" style="width: 180px;"/>
                    </a>
                </div>
                <span class="logout-spn" >

                        ${manVO.man_id} ${manVO.man_name}
                  <a href="<%=request.getContextPath() %>/backend/man/login_man.jsp">登出</a>
                </span>
            </div>
        </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '0'}">
                            <li class="active-link">
                                <a href="<%=request.getContextPath() %>/backend/member/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 </a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '1'}">
                            <li>
                                    <a href="<%=request.getContextPath() %>/backend/store/store_index.jsp"><i class="fa fa-bar-chart-o"></i>商家會員管理</a>
                            </li>   
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/man/ListAllMan.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
                            </li> 
                       </c:if>
                    </c:forEach>
                         
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '9'}"> 
                                                     
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/memr/select_memr.jsp"><i class="fa fa-bar-chart-o"></i>會員檢舉 </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/str/select_str.jsp"><i class="fa fa-bar-chart-o"></i>商家檢舉</a>
                            </li>
                            
                         </c:if>
                    </c:forEach>
                            
                   <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '3'}">                                  
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/news/news_index.jsp"><i class="fa fa-bar-chart-o"></i>刊登最新消息</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '4'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/ad/listAllAd.jsp"><i class="fa fa-bar-chart-o"></i>廣告管理</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>權限管理</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '10'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/store_commit/store_commit_index.jsp"><i class="fa fa-bar-chart-o"></i>商家評價管理</a>
                            </li>
                         </c:if>
                    </c:forEach>
                                   
                </ul>
              </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- <h2></h2>  內頁標題  -->
                    </div>
                </div>              
                    <div class="col-lg-12 ">

                    </div>
                    
<!-- ****************內頁************************ -->



<br>

<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href="<%=request.getContextPath()%>/backend/store/listAllStore.jsp">列出全部商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a>


<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="store.do" name="form1" enctype="multipart/form-data">

<table border="0">


 	<tr>
		<td>商家編號<font><b>*</b></font></td>
		<td><%=storeVO.getStore_id()%></td>
	</tr> 
	<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<td>選擇類別編號</td>
		<td>
		<select size="1" name="sc_id">
			<c:forEach var="scVO" items="${scSvc.all}">
				<option value="${scVO.sc_id}" ${(storeVO.sc_id==scVO.sc_id)? 'selected':'' } >${scVO.sc_name}
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>商家名稱</td>
		<td><input type="TEXT" name="store_name" size="45"	value="<%=storeVO.getStore_name()%>" /></td>
	</tr>
	
	<tr>
		<td>商家簡介</td>
		<td><textarea name="store_content" size="45" placeholder="請輸入簡介"><%=storeVO.getStore_content()%></textarea></td>
	</tr>
	<tr>
		<td>商家電話</td>
		<td><input type="TEXT" name="store_phone" size="45"	value="<%=storeVO.getStore_phone()%>" /></td>
	</tr>
		<tr>
		<td>商家地址</td>
		<td><textarea name="store_addr" size="45" placeholder="請輸入簡介"><%=storeVO.getStore_addr()%></textarea></td>
	</tr>	
	<tr>
		<td>商家進駐日期</td>
		<td><input type="date" name="store_date" size="45"	value="<%=storeVO.getStore_date()%>" /></td>
	</tr>	
	<tr>
		<td>商家評價星星數</td>
		<td><input type="number" name="store_star" size="45"	value="<%=storeVO.getStore_star()%>" /></td>
	</tr>	
	<tr>
		<td>商家評價次數</td>
		<td><input type="number" name="store_count" size="45"	value="<%=storeVO.getStore_count()%>" /></td>
	</tr>
	<tr>
		<td>商家狀態</td>
		<td><input type="radio" name="store_state" value="審核中"         />審核中
			<input type="radio" name="store_state" value="開店中"         />開店中
			<input type="radio" name="store_state" value="停業" checked />停業
		</td>
	</tr>

	<tr>
		<td>商家照片</td>
		<td><input type="file" id="myfile" name="store_image" size="45"	value="<%=storeVO.getStore_image()%>" /></td>
	</tr>
	<tr>
		<td>商家被檢舉次數</td>
		<td><input type="number" name="store_report_count" size="45"	value="<%=storeVO.getStore_report_count()%>" /></td>
	</tr>
 	<tr>
		<td>商家停權開始日期</td>
		<td><input type="date" name="store_start_time" size="45" 
			value="<%= (storeVO==null)? "" : storeVO.getStore_start_time()%>" /></td>
	</tr>
	<tr>
		<td>商家停權結束日期</td>
		<td><input type="date" name="store_end_time" size="45" 
			value="<%= (storeVO==null)? "" : storeVO.getStore_end_time()%>" /></td>
	</tr>	
	<tr>
		<td>商家密碼</td>
		<td><input type="password" name="store_pw" size="45"	value="<%=storeVO.getStore_pw()%>" /></td>
	</tr>
	<tr>
		<td>商家帳號</td>
		<td><input type="TEXT" name="store_acc" size="45"	value="<%=storeVO.getStore_acc()%>" /></td>
	</tr>
	<tr>
		<td>商家外送</td>
		<td><input type="radio" name="store_out" value="可以外送" />可以外送
			<input type="radio" name="store_out" value="沒有外送" checked />沒有外送</td>
	</tr>
	<tr>
		<td>商家地區</td>
		<td>
			<select name="store_zone">
				<option value="基隆市">基隆市</option>
				<option value="臺北市">臺北市</option>
				<option value="新北市">新北市</option>
				<option value="桃園市">桃園市</option>
				<option value="新竹市">新竹市</option>
				<option value="新竹縣">新竹縣</option>
				<option value="苗栗縣">苗栗縣</option>
				<option value="臺中市">臺中市</option>
				<option value="彰化縣">彰化縣</option>
				<option value="南投縣">南投縣</option>
				<option value="雲林縣">雲林縣</option>
				<option value="嘉義市">嘉義市</option>
				<option value="嘉義縣">嘉義縣</option>
				<option value="臺南市">臺南市</option>
				<option value="高雄市">高雄市</option>
				<option value="屏東縣">屏東縣</option>
				<option value="臺東縣">臺東縣</option>
				<option value="花蓮縣">花蓮縣</option>
				<option value="宜蘭縣">宜蘭縣</option>
			</select>
		</td>
	</tr>
</table>
<br>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="store_id" value="<%=storeVO.getStore_id()%>">
                <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
                <input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">
                <input type="submit" value="送出修改"></FORM>

		<p>
			<img id="image">
		</p>



        
<!-- ****************內頁************************ -->

        </div>
        <!-- /. PAGE WRAPPER  -->

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
        </div>
     <!-- /. WRAPPER  -->

    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/custom.js"></script>
    
    
</body>
</html>