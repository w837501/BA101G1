<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%
	StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>
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
                  <a href="<%=request.getContextPath() %>/backend/man/login_man.jsp">�n�X</a>
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
                                <a href="<%=request.getContextPath() %>/backend/member/select_mem.jsp" ><i class="fa fa-desktop "></i>�|���޲z </a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '1'}">
                            <li>
                                    <a href="<%=request.getContextPath() %>/backend/store/store_index.jsp"><i class="fa fa-bar-chart-o"></i>�Ӯa�|���޲z</a>
                            </li>   
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/man/ListAllMan.jsp"><i class="fa fa-bar-chart-o"></i>�޲z���޲z</a>
                            </li> 
                       </c:if>
                    </c:forEach>
                         
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '9'}"> 
                                                     
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/memr/select_memr.jsp"><i class="fa fa-bar-chart-o"></i>�|�����| </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/str/select_str.jsp"><i class="fa fa-bar-chart-o"></i>�Ӯa���|</a>
                            </li>
                            
                         </c:if>
                    </c:forEach>
                            
                   <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '3'}">                                  
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/news/news_index.jsp"><i class="fa fa-bar-chart-o"></i>�Z�n�̷s����</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '4'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/ad/listAllAd.jsp"><i class="fa fa-bar-chart-o"></i>�s�i�޲z</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '8'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/per/ListAllPer.jsp"><i class="fa fa-bar-chart-o"></i>�v���޲z</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    
                    <c:forEach var="perm" items="${permList}">
                        <c:if test="${perm.pa_id eq '10'}">
                            <li>
                                <a href="<%=request.getContextPath() %>/backend/store_commit/store_commit_index.jsp"><i class="fa fa-bar-chart-o"></i>�Ӯa�����޲z</a>
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
                        <!-- <h2></h2>  �������D  -->
                    </div>
                </div>              
                    <div class="col-lg-12 ">

                    </div>
                    
<!-- ****************����************************ -->



<br>

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

<FORM METHOD="post" ACTION="store.do" name="form1" enctype="multipart/form-data">

<table border="0">


 	<tr>
		<td>�Ӯa�s��<font><b>*</b></font></td>
		<td><%=storeVO.getStore_id()%></td>
	</tr> 
	<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<td>������O�s��</td>
		<td>
		<select size="1" name="sc_id">
			<c:forEach var="scVO" items="${scSvc.all}">
				<option value="${scVO.sc_id}" ${(storeVO.sc_id==scVO.sc_id)? 'selected':'' } >${scVO.sc_name}
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>�Ӯa�W��</td>
		<td><input type="TEXT" name="store_name" size="45"	value="<%=storeVO.getStore_name()%>" /></td>
	</tr>
	
	<tr>
		<td>�Ӯa²��</td>
		<td><textarea name="store_content" size="45" placeholder="�п�J²��"><%=storeVO.getStore_content()%></textarea></td>
	</tr>
	<tr>
		<td>�Ӯa�q��</td>
		<td><input type="TEXT" name="store_phone" size="45"	value="<%=storeVO.getStore_phone()%>" /></td>
	</tr>
		<tr>
		<td>�Ӯa�a�}</td>
		<td><textarea name="store_addr" size="45" placeholder="�п�J²��"><%=storeVO.getStore_addr()%></textarea></td>
	</tr>	
	<tr>
		<td>�Ӯa�i�n���</td>
		<td><input type="date" name="store_date" size="45"	value="<%=storeVO.getStore_date()%>" /></td>
	</tr>	
	<tr>
		<td>�Ӯa�����P�P��</td>
		<td><input type="number" name="store_star" size="45"	value="<%=storeVO.getStore_star()%>" /></td>
	</tr>	
	<tr>
		<td>�Ӯa��������</td>
		<td><input type="number" name="store_count" size="45"	value="<%=storeVO.getStore_count()%>" /></td>
	</tr>
	<tr>
		<td>�Ӯa���A</td>
		<td><input type="radio" name="store_state" value="�f�֤�"         />�f�֤�
			<input type="radio" name="store_state" value="�}����"         />�}����
			<input type="radio" name="store_state" value="���~" checked />���~
		</td>
	</tr>

	<tr>
		<td>�Ӯa�Ӥ�</td>
		<td><input type="file" id="myfile" name="store_image" size="45"	value="<%=storeVO.getStore_image()%>" /></td>
	</tr>
	<tr>
		<td>�Ӯa�Q���|����</td>
		<td><input type="number" name="store_report_count" size="45"	value="<%=storeVO.getStore_report_count()%>" /></td>
	</tr>
 	<tr>
		<td>�Ӯa���v�}�l���</td>
		<td><input type="date" name="store_start_time" size="45" 
			value="<%= (storeVO==null)? "" : storeVO.getStore_start_time()%>" /></td>
	</tr>
	<tr>
		<td>�Ӯa���v�������</td>
		<td><input type="date" name="store_end_time" size="45" 
			value="<%= (storeVO==null)? "" : storeVO.getStore_end_time()%>" /></td>
	</tr>	
	<tr>
		<td>�Ӯa�K�X</td>
		<td><input type="password" name="store_pw" size="45"	value="<%=storeVO.getStore_pw()%>" /></td>
	</tr>
	<tr>
		<td>�Ӯa�b��</td>
		<td><input type="TEXT" name="store_acc" size="45"	value="<%=storeVO.getStore_acc()%>" /></td>
	</tr>
	<tr>
		<td>�Ӯa�~�e</td>
		<td><input type="radio" name="store_out" value="�i�H�~�e" />�i�H�~�e
			<input type="radio" name="store_out" value="�S���~�e" checked />�S���~�e</td>
	</tr>
	<tr>
		<td>�Ӯa�a��</td>
		<td>
			<select name="store_zone">
				<option value="�򶩥�">�򶩥�</option>
				<option value="�O�_��">�O�_��</option>
				<option value="�s�_��">�s�_��</option>
				<option value="��饫">��饫</option>
				<option value="�s�˥�">�s�˥�</option>
				<option value="�s�˿�">�s�˿�</option>
				<option value="�]�߿�">�]�߿�</option>
				<option value="�O����">�O����</option>
				<option value="���ƿ�">���ƿ�</option>
				<option value="�n�뿤">�n�뿤</option>
				<option value="���L��">���L��</option>
				<option value="�Ÿq��">�Ÿq��</option>
				<option value="�Ÿq��">�Ÿq��</option>
				<option value="�O�n��">�O�n��</option>
				<option value="������">������</option>
				<option value="�̪F��">�̪F��</option>
				<option value="�O�F��">�O�F��</option>
				<option value="�Ὤ��">�Ὤ��</option>
				<option value="�y����">�y����</option>
			</select>
		</td>
	</tr>
</table>
<br>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="store_id" value="<%=storeVO.getStore_id()%>">
                <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
                <input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">
                <input type="submit" value="�e�X�ק�"></FORM>

		<p>
			<img id="image">
		</p>



        
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