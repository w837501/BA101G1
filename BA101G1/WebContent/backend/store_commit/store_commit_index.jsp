<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Store_Commit_index.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<br>本網頁的路徑:<br><b>
   <font>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>

<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">會員</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">最新消息</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">商家月結</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">商家評價</a>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>


<ul>
       <li><a href='<%=request.getContextPath()%>/backend/store_commit/listAllStoreCommit.jsp'>List</a> all Store Commit. </li> <br><br>
</ul>


   <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/store_commit/store_commit.do" >
        <b>輸入評價編號 (如SC-000001):</b>
        <input type="text" name="sc_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>


 <jsp:useBean id="scSvc" scope="page" class="com.store_commit.model.StoreCommitService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/store_commit/store_commit.do" >
       <b>選擇評價編號:</b>
       <select size="1" name="sc_id">                                        
         <c:forEach var="scVO" items="${scSvc.all}" > 
          <option value="${scVO.sc_id}">${scVO.sc_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">                                       
    </FORM>
  </li>
</ul>


  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
        <b>輸入商家編號(如STO-000001)找出所有商家評價</b>
        <input type="text" name="store_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getStoreCommitsByStore_id">
    </FORM>
  </li>






<ul>
  <li><a href='<%=request.getContextPath()%>/backend/store_commit/addStoreCommit.jsp'>新增</a>評價</li>
</ul>


    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>