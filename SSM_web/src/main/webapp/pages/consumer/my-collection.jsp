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
                    <li><a href="${pageContext.request.contextPath}/consumer/mySell.do">我发布的商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myAsk.do">我的求购</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myCollection.do" style="color:#ff6700;font-weight:bold;">我的收藏</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/opinion.do">意见反馈</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/updatePwd.do">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr">

            <div class="ddzxbt">我的收藏</div>
                <c:forEach items="${collectionInfo.list}" var="collection">
                    <div class="ddxq">
                        <div class="ddspt fl"><img style="width: 80px;height: 80px;" src="${collection.bookInfo.imgUrl}" alt=""></div>
                        <div class="ddbh fl">《 ${collection.bookInfo.book_name} 》</div>
                        <li class="ztxx fr">
                            <ul>
                                <li>${collection.bookInfo.categoryInfo.category_name}</li>
                                <li>￥${collection.bookInfo.price}</li>
                                <li style="width: 200px"><fmt:formatDate value='${collection.time}' pattern='yyyy-MM-dd HH:mm'/></li>
                                <c:if test="${collection.bookInfo.status==0}">
                                    <li>已售出</li>
                                </c:if>
                                <c:if test="${collection.bookInfo.status==1}">
                                    <li><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${collection.bookInfo.book_id}">书籍详情></a></li>
                                </c:if>

                                <div class="clear"></div>
                            </ul>
                        </div>
                        <div class="clear"></div>
                </c:forEach>


            <div class="page_total_class">
                总共${collectionInfo.pages} 页，共${collectionInfo.total} 条数据。
            </div>


            <%--分页 start--%>
            <div class="page_class">
                <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/consumer/myCollection.do?page=${collectionInfo.pageNum-1}">上一页</a>
                </li>

                <c:forEach begin="1" end="${collectionInfo.pages}" var="i">
                    <c:if test="${i==collectionInfo.pageNum}">
                        <li class="page-item active">
                            <a class="page-link" href="${pageContext.request.contextPath}/consumer/myCollection.do?page=${i}">${i}</a>
                        </li>
                    </c:if>
                    <c:if test="${i!=collectionInfo.pageNum}">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/consumer/myCollection.do?page=${i}">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/consumer/myCollection.do?page=${collectionInfo.pageNum+1}">下一页</a>
                </li>
            </ul>
            </div>
            <%--分页 end--%>

            </div>

        </div>

        <div class="clear"></div>

    </div>


<jsp:include page="footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

