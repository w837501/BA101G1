<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.tools.*"%>
                        <jsp:useBean id="store_start_time" scope="page" class="java.util.Date" />
                        <jsp:useBean id="store_end_time" scope="page" class="java.util.Date" />
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
                            <%
		StoreService storeSvc = new StoreService();
		List<StoreVO> list = storeSvc.getAll();
		pageContext.setAttribute("list", list);
	%>
<jsp:useBean id="scsSvc" scope="page" class="com.store_class.model.StoreClassService"/>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
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
                                
                                <table class="table table-hover">
                                    <tr>
                                        <th align="center">編號</th>
                                        <th>類別</th>
                                        <th>名稱</th>
                                        <!-- <th>簡介</th> -->
                                        <th>電話</th>
                                        <th>地址</th>
                                        <th>進駐日期</th>
                                        <!-- <th>評價星星數</th> -->
                                        <!-- <th>評價次數</th> -->
                                        <th>狀態</th>
                                        <th>照片</th>
                                        <th>被檢舉次數</th>
                                        <!-- <th>停權開始日期</th> -->
                                        <!-- <th>停權結束日期</th> -->
                                        <!-- <th>密碼</th> -->
                                        <!-- <th>帳號</th> -->
                                        <th>外送</th>
                                        <th>地區</th>
                                        <th>修改</th>
                                        <th>刪除</th>
                                    </tr>
                                    <br>
                                    <%@ include file="pages/page1.file"%>
                                        <c:forEach var="storeVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                            <tr align='center' valign='middle' ${(storeVO.store_id==param.store_id) ? 'bgcolor=#CCCCFF': ''}>
                                                <td>${storeVO.store_id}</td>
                                                <td>${scsSvc.getOneStoreClass(storeVO.sc_id).sc_name}</td>
                                                <td>${storeVO.store_name}</td>
                                                <%-- <td>${storeVO.store_content}</td> --%>
                                                <td>${storeVO.store_phone}</td>
                                                <td>${storeVO.store_addr}</td>
                                                <td>${storeVO.store_date}</td>
                                                <%-- <td>${storeVO.store_star}</td> --%>
                                                <%-- <td>${storeVO.store_count}</td> --%>
                                                <td>${storeVO.store_state}</td>
                                                <td><img src='<%=request.getContextPath()%>/store?store_id=${storeVO.store_id}' height="70"></td>
                                                <td>${storeVO.store_report_count}</td>
                                                <%-- <td>
                                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${storeVO.store_start_time}" />
                                                </td> --%>
                                                <%-- <td>
                                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${storeVO.store_end_time}" />
                                                </td> --%>
                                                <%-- <td>${storeVO.store_pw}</td> --%>
                                                <%-- <td>${storeVO.store_acc}</td> --%>
                                                <td>${storeVO.store_out}</td>
                                                <td>${storeVO.store_zone}</td>
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
                                                        <input type="submit" value="修改">
                                                        <input type="hidden" name="store_id" value="${storeVO.store_id}">
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                                        <input type="hidden" name="whichPage" value="<%=whichPage%>">
                                                        <input type="hidden" name="action" value="getOne_For_Update">
                                                    </FORM>
                                                </td>
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
                                                        <input type="submit" value="刪除">
                                                        <input type="hidden" name="store_id" value="${storeVO.store_id}">
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                                        <input type="hidden" name="whichPage" value="<%=whichPage%>">
                                                        <input type="hidden" name="action" value="delete">
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
                     
