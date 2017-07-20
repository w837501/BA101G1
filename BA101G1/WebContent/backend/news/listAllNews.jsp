<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%@ page import="com.man.model.*"%>

<jsp:useBean id="news_time" scope="page" class="java.util.Date" />
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




<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">�^��������</a>


                            
	<%  NewsService newsSvc = new NewsService();
		List<NewsVO> list = newsSvc.getAll();
		pageContext.setAttribute("list", list);%>

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
                                        <th align="center">�޲z���s��</th>
                                        <th>�����s��</th>
                                        <th>�������D</th>
                                        <th>��������</th>
                                        <th>�����Ϥ�</th>
                                        <th>�����ɶ�</th>
                                    </tr>
                                    <br>
                                    <jsp:useBean id="managerSvc" scope="page" class="com.man.model.ManagerService" />
                                    <%@ include file="pages/page1.file"%>
                                        <c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                            <tr align='center' valign='middle' ${(newsVO.news_id==param.news_id) ? 'bgcolor=#CCCCFF': ''}>
                                                <td>${managerSvc.getOneMan(newsVO.man_id).man_name}</td>
                                                <td>${newsVO.news_id}</td>
                                                
                                                <td>${newsVO.news_name}</td>
                                                <td>${newsVO.news_content}</td>
                                                <td><img src='<%=request.getContextPath()%>/news?news_id=${newsVO.news_id}'   height="70"></td>
                                                <td>
                                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${newsVO.news_time}" />
                                                </td> 
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/news/news.do">
                                                        <input type="submit" value="�ק�">
                                                        <input type="hidden" name="news_id" value="${newsVO.news_id}">
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                                        <input type="hidden" name="whichPage" value="<%=whichPage%>">
                                                        <input type="hidden" name="action" value="getOne_For_Update">
                                                    </FORM>
                                                </td>
                                                <td width="30">
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/news/news.do">
                                                        <input type="submit" value="�R��">
                                                        <input type="hidden" name="news_id" value="${newsVO.news_id}">
                                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                                        <input type="hidden" name="whichPage" value="<%=whichPage%>">
                                                        <input type="hidden" name="action" value="delete">
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