<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  User: Liu Jiajun
  Date: 2020/2/10
  Time: 23:31
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="../../css/consumer/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >

</head>
<body>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl">
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/consumer/mySell.do" style="color:#ff6700;font-weight:bold;">我发布的商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myAsk.do">我的求购</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myCollection.do">我的收藏</a></li>
                    <li><a href="">消息通知</a></li>
                    <li><a href="">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr">

            <div class="ddzxbt">我发布的商品</div>
                <c:forEach items="${bookInfo.list}" var="book">
                    <div class="ddxq">
                        <div class="ddspt fl"><img style="width: 80px;height: 80px;" src="${book.imgUrl}" alt=""></div>
                        <div class="ddbh fl">《 ${book.book_name} 》</div>
                        <li class="ztxx fr">
                            <ul>
                                <li>${book.categoryInfo.category_name}</li>
                                <li>￥${book.price}</li>
                                <li style="width: 200px"><fmt:formatDate value='${book.time}' pattern='yyyy-MM-dd HH:mm'/></li>
                                <li><a href="">书籍详情></a></li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <div class="clear"></div>
                </c:forEach>


            <div class="page_total_class">
                总共${bookInfo.pages} 页，共${bookInfo.total} 条数据。
            </div>


            <%--分页 start--%>
            <div class="page_class">
                <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${bookInfo.pageNum-1}">上一页</a>
                </li>

                <c:forEach begin="1" end="${bookInfo.pages}" var="i">
                    <c:if test="${i==bookInfo.pageNum}">
                        <li class="page-item active">
                            <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${i}">${i}</a>
                        </li>
                    </c:if>
                    <c:if test="${i!=bookInfo.pageNum}">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${i}">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${bookInfo.pageNum+1}">下一页</a>
                </li>
            </ul>
            </div>
            <%--分页 end--%>

            </div>

        </div>

        <div class="clear"></div>

    </div>


<footer class="mt20 center" style="margin-top: 50px;">
    <div class="mt20">
        <b>Version</b> 1.0.8
        <strong>Designed by 刘嘉俊.    </strong> All rights reserved.
    </div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <%--<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>--%>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

