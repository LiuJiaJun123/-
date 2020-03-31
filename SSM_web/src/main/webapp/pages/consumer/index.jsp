<%--
  User: Liu Jiajun
  Date: 2020/1/30
  Time: 18:09
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>ZQU BOOK</title>

    <link rel="stylesheet" type="text/css" href="/css/consumer/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >

    <link rel="stylesheet" type="text/css" href="/css/consumer/announcement.css">

</head>
<body>
<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->

<div class="news-content">


        <div class="news-content-item">
            <a href="javascript:;" class="news-content-title clearfix">
                <div class="news-title-fl">
                    <div class="news-title-color"></div>
                    <div class="news-title-title">官方公告</div>
                </div>
                <div class="news-title-fr news-title-img01"></div>
            </a>
            <ul class="news-content-lists clearfix">
                <c:forEach items="${announcementInfo.list}" var="announcement">
                    <li class="clearfix">
                        <a target="_blank" href="${pageContext.request.contextPath}/consumer/announcement-xq.do?announcement_id=${announcement.announcement_id}">
                            <i>【<fmt:formatDate value='${announcement.time}' pattern='MM-dd'/>】</i>
                            <span>${announcement.title}</span>
                        </a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>
</div>


<style>
    .border-style{
        margin-left: 27.5%;
        width: 70%;
        height: 500px;
        margin-top: 10px;
        padding: 20px;
        border:1px solid #d3d3d3;background:#f7f7f7
    }
</style>

<div class="bd-example mb-4 border-style">
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="banner banner1" style="background: url('../img/海报1.png');background-size: cover"></div>
                <div class="carousel-caption d-none d-md-block">
                    <%--<h5>蜘蛛侠</h5>--%>
                    <%--<p>蜘蛛侠（Spider-Man）是美国漫威漫画旗下的超级英雄，由编剧斯坦·李和画家史蒂夫·迪特科联合创造，初次登场于《惊奇幻想》（Amazing Fantasy）第15期（1962年8月），因为广受欢迎，几个月后，便开始拥有以自己为主角的单行本漫画。</p>--%>
                </div>
            </div>
            <div class="carousel-item">
                <div class="banner banner2" style="background: url('../img/海报2.png');background-size: cover"></div>
                <div class="carousel-caption d-none d-md-block">
                    <%--<h5>绿巨人</h5>--%>
                    <%--<p>浩克（Hulk）是美国漫威漫画旗下的超级英雄，初次登场于《不可思议的浩克》（The Incredible Hulk）第一期（1962年5月），由斯坦·李和杰克·科比联合创造。</p>--%>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>



<div class="danpin center">

    <div class="biaoti center">新书上架</div>
    <div class="main center">

        <c:forEach items="${newBookList}" var="newBook">
            <div class="mingxing fl">
                <div class="sub_mingxing"><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${newBook.book_id}"><img src="../${newBook.imgUrl}" alt=""></a></div>
                <div class="pinpai"><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${newBook.book_id}">${newBook.book_name}</a></div>
                <c:if test="${empty newBook.description}">
                    <div class="youhui">暂无描述</div>
                </c:if>
                <c:if test="${not empty newBook.description}">
                    <div class="youhui">${newBook.description}</div>
                </c:if>
                <div class="jiage">${newBook.price}元</div>
            </div>
        </c:forEach>
        <div class="clear"></div>
    </div>
</div>

<div class="danpin center" style="margin:50px auto;">
    <div class="biaoti center">超低价格</div>
    <div class="main center">
        <c:forEach items="${cheapBookList}" var="cheapBook">
            <div class="mingxing fl">
                <div class="sub_mingxing"><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${cheapBook.book_id}"><img src="../${cheapBook.imgUrl}" alt=""></a></div>
                <div class="pinpai"><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${cheapBook.book_id}">${cheapBook.book_name}</a></div>
                <c:if test="${empty cheapBook.description}">
                    <div class="youhui">暂无描述</div>
                </c:if>
                <c:if test="${not empty cheapBook.description}">
                    <div class="youhui">${cheapBook.description}</div>
                </c:if>
                <div class="jiage">${cheapBook.price}元</div>
            </div>
        </c:forEach>
        <div class="clear"></div>
    </div>
</div>


<div class="peijian w">
    <div class="biaoti center">精品推荐</div>
    <div class="main center">
        <div class="content">

        <c:forEach items="${goodBookList}" var="goodBook">
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${goodBook.book_id}"><img src="${goodBook.imgUrl}"></a></div>
                <div class="miaoshu"><a target="_blank" href="${pageContext.request.contextPath}/consumer/xq.do?book_id=${goodBook.book_id}">${goodBook.book_name}</a></div>
                <div class="jiage">${goodBook.price}元</div>
            </div>
        </c:forEach>

            <div class="clear"></div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
