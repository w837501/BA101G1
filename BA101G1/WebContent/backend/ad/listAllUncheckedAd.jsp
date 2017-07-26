<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="com.tools.*"%>
<jsp:useBean id="news_time" scope="page" class="java.util.Date" />
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService"/>
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
                    Backend_Index
                        <!-- <h2></h2>  內頁標題  -->
                    </div>
                </div>              
                    <div class="col-lg-12 ">

                    </div>
                    <br>
<!-- ****************內頁************************ -->
<!-- ****************代辦事項div************************ -->
<!-- ****************廣告審核(使用listSize取值)************************ -->
<%@ page import="com.ad.model.*"%>
	<%  AdService adSvc = new AdService();
		List<AdVO> listsize = adSvc.getAllUncheckedAd();
		Integer listSize = listsize.size();
		pageContext.setAttribute("listSize", listSize); %>
		
                    <div class="col-md-4"> 

                         <div class="schedule">
                         
								<div class="alert alert-danger">
									目前有
                                    ${listSize}									
									筆待審核的廣告  <a href="<%=request.getContextPath() %>/backend/ad/listAllUncheckedAd.jsp">點我開啟</a>
								
								</div>	                         
<!-- ****************廣告審核************************ -->
<%-- <!-- ****************會員審核(使用SQL select count(*)取值)************************ -->
<%@ page import="com.mem.model.*" %>
<% MemberService memberSvc = new MemberService(); 
   Integer count = memberSvc.getAllUncheckedCount();
   pageContext.setAttribute("count" , count);%>
								<div class="alert alert-info">
									目前有
									${count}
									 筆待審核的會員   <a href="<%=request.getContextPath() %>/backend/member/listAllMemberState.jsp">點我前往</a>
								</div>
<!-- ****************會員審核************************ --> --%>
<!-- ****************商家審核(使用SQL select count(*)取值)************************ -->
<%@ page import="com.store.model.*"%>
	<%  StoreService storeService = new StoreService();
		Integer storecount = storeService.getAllUncheckedCount();
		pageContext.setAttribute("storecount", storecount); %>
                         	
								<div class="alert alert-success">
								    目前有
								  ${storecount}
								    <!-- 筆待審核的商家   <a href="#" onClick="getAllUncheckedStore();">列出全部</a> -->
								  筆待審核的商家   <a href="<%=request.getContextPath() %>/backend/store/listAllStoreState.jsp">列出全部</a>  
								</div>
                         </div>
                    </div>
                    <div class="col-md-8"> 
                    </div>
<!-- ****************商家審核************************ -->                    
<!-- ****************代辦事項div************************ -->

                  <br><br><br><br><br><br><br><br>
                    
                    <a href="<%=request.getContextPath() %>/backend/ad/listAllAd.jsp"></i>列出全部廣告</a>
                    
                                <c:if test="${not empty errorMsgs}">
                                    <font color='red'>請修正以下錯誤:
                                        <ul>
                                            <c:forEach var="message" items="${errorMsgs}">
                                                <li>${message}</li>
                                            </c:forEach>
                                        </ul>
                                    </font>
                                </c:if>
                                
	<%  
		List<AdVO> list = adSvc.getAllUncheckedAd();
		request.setAttribute("adSvc",adSvc);
		pageContext.setAttribute("list", list); %>
                                <table class="table table-hover">
                                    <tr>
                                        <th align="center">廣告編號</th>
                                        <th>商家名稱</th>
                                        <th>廣告標題</th>
                                        <th>廣告內文</th>
                                        <th>廣告圖片</th>
                                        <th>廣告時間</th>
                                        <th>廣告推播內容</th>
                                        <th>選擇審查狀態</th>
                                    </tr>
                                    <br>
                                    <%@ include file="pages/page1.file"%>
                                        <c:forEach var="adVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                            <tr align='center' valign='middle' ${(adVO.ad_id==param.ad_id) ? 'bgcolor=#CCCCFF': ''}>
                                                <td>${adVO.ad_id}</td>
                                                <td>${storeSvc.getOneStore1(adVO.store_id).store_name}</td>
                                                <td>${adVO.ad_name}</td>
                                                <td>${adVO.ad_content}</td>
                                                <td><img src='<%=request.getContextPath()%>/ad?ad_id=${adVO.ad_id}'   height="100"></td>
                                                <td>
                                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${adVO.ad_time}" />
                                                </td>
                                                <td>${adVO.ad_push_content}</td>
                                                
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Ad" name="form1">
                                                    <select size="1" name="ad_state">
                                                        <option value="審核中" ${(adVO.ad_state=="審核中")?'selected':'' } >審核中
                                                        <option value="刊登中" ${(adVO.ad_state=="刊登中")?'selected':'' } >刊登中
                                                        <option value="下架" ${(adVO.ad_state=="下架")?'selected':'' } >下架
                                                    </select>
                                                    <input type="submit" value="送出">
                                                    <input type="hidden" name="ad_id" value="${adVO.ad_id}">
                                                    <input type="hidden" name="store_phone" value="${storeSvc.getOneStore1(adVO.store_id).store_phone}">
                                                    <input type="hidden" name="action" value="updateUnckeckedAdState">      
                                                    </FORM>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                </table>
                                <%@ include file="pages/page2.file"%>

<!-- ****************內頁************************ -->

        </div>
        <!-- /. PAGE WRAPPER  -->

                  <!-- /. ROW  --> 
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
<script>
function getAllUncheckedStore(){ 
  //===建立xhr物件(填入程式碼)
  var xhr = new XMLHttpRequest();
  //設定好回呼函數   
  xhr.onreadystatechange = function (){
    if( xhr.readyState == 4){
      if( xhr.status == 200){
      //取回...回傳的資料
         document.getElementById("page-inner").innerHTML = xhr.responseText;
      }else{
         alert( xhr.status );
      }//xhr.status == 200
    }//xhr.readyState == 4
  };//onreadystatechange 
  
  //建立好Get連接
  var url= "<%=request.getContextPath()%>/backend/store/listAllStoreStateAjax.jsp";
  xhr.open("Get",url,true); 

  //送出請求 
  xhr.send( null );
}
</script>
  
 