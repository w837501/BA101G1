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
<br>�����������|:<br><b>
   <font>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>

<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">�|��</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">�̷s����</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">�Ӯa�뵲</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">�Ӯa</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">�Ӯa����</a>

<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
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
        <b>��J�����s�� (�pSC-000001):</b>
        <input type="text" name="sc_id">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>


 <jsp:useBean id="scSvc" scope="page" class="com.store_commit.model.StoreCommitService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/store_commit/store_commit.do" >
       <b>��ܵ����s��:</b>
       <select size="1" name="sc_id">                                        
         <c:forEach var="scVO" items="${scSvc.all}" > 
          <option value="${scVO.sc_id}">${scVO.sc_id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">                                       
    </FORM>
  </li>
</ul>


  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
        <b>��J�Ӯa�s��(�pSTO-000001)��X�Ҧ��Ӯa����</b>
        <input type="text" name="store_id">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getStoreCommitsByStore_id">
    </FORM>
  </li>






<ul>
  <li><a href='<%=request.getContextPath()%>/backend/store_commit/addStoreCommit.jsp'>�s�W</a>����</li>
</ul>


    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>