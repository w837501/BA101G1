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
  <title>�Y�q��EatMe</title>
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
    
        <!-- /. NAV TOP  -->
      
<br> 
                           
                            <%
		StoreService storeSvc = new StoreService();
		List<StoreVO> list = storeSvc.getAll();
		pageContext.setAttribute("list", list);
	%>
<jsp:useBean id="scsSvc" scope="page" class="com.store_class.model.StoreClassService"/>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">�Ӯa</a>
<a href="<%=request.getContextPath()%>/backend/store/listAllStore.jsp">�C�X�����Ӯa</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a>
                                <c:if test="${not empty errorMsgs}">
                                    <font color='red'>�Эץ��H�U���~:
                                        <ul>
                                            <c:forEach var="message" items="${errorMsgs}">
                                                <li>${message}</li>
                                            </c:forEach>
                                        </ul>
                                    </font>
                                </c:if>
                                
                                <table class="table table-hover">
                                    <tr>
                                        <th align="center">�s��</th>
                                        <th>���O</th>
                                        <th>�W��</th>
                                        <th>²��</th>
                                        <th>�q��</th>
                                        <th>�a�}</th>
                                        <th>�i�n���</th>
                                        <th>�Ӥ�</th>
                                        <th>�a��</th>
                                        <th>���A</th>
                                    </tr>
                                    <br>
                                    <%@ include file="pages/page1.file"%>
                                        <c:forEach var="storeVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                            <tr align='center' valign='middle' ${(storeVO.store_id==param.store_id) ? 'bgcolor=#CCCCFF': ''}>
                                                <td>${storeVO.store_id}</td>
                                                <td>${scsSvc.getOneStoreClass(storeVO.sc_id).sc_name}</td>
                                                <td>${storeVO.store_name}</td>
                                                <td>${storeVO.store_content}</td>
                                                <td>${storeVO.store_phone}</td>
                                                <td>${storeVO.store_addr}</td>
                                                <td>${storeVO.store_date}</td>
                                                <td><img src='<%=request.getContextPath()%>/store?store_id=${storeVO.store_id}'   height="70"></td>
                                                <td>${storeVO.store_zone}</td>
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" name="form1">
                                                        <select size="1" name="store_state">
                                                           <option value="�f�֤�" ${(storeVO.store_state=="�f�֤�")?'selected':'' } >�f�֤�
                                                           <option value="�}����" ${(storeVO.store_state=="�}����")?'selected':'' } >�}����
                                                           <option value="���~" ${(storeVO.store_state=="���~")?'selected':'' } >���~
                                                        </select>
                                                        <input type="submit" value="�e�X">
                                                        <input type="hidden" name="store_acc" value="${storeVO.store_acc}">
                                                        <input type="hidden" name="store_id" value="${storeVO.store_id}">
                                                        <input type="hidden" name="action" value="updateStoreState">      
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath() %>">      
                                                     </FORM>
                                                 </td>                                                
                                            </tr>
                                        </c:forEach>
                                </table>
                                <%@ include file="pages/page2.file"%>



        
<!-- ****************����************************ -->

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
                     
