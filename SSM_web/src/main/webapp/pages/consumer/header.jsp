<%--
  User: Liu Jiajun
  Date: 2020/1/31
  Time: 13:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>header</title>
    <link rel="stylesheet" type="text/css" href="/css/consumer/header.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >

</head>
<body>

<%--导航栏 start--%>
<nav class="navbar navbar-expand-lg navbar-light bg-success" id="nav1">
    <div class="container">
        <a class="navbar-brand " href="#">ZQU BOOK</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " id="navbarSupportedContent" >
            <ul class="navbar-nav mr-auto" id="content">
                <li class="nav-item">
                    <a id="index" class="nav-link" href="${pageContext.request.contextPath}/index.do" >首页</a>
                </li>
                <li class="nav-item">
                    <a id="allbook" class="nav-link" href="${pageContext.request.contextPath}/consumer/allbook.do">全部商品</a>
                </li>
                <li class="nav-item">
                    <a id="addbook" class="nav-link" href="${pageContext.request.contextPath}/consumer/addbook.do">发布商品</a>
                </li>

                <li class="nav-item">
                    <a id="allAskbook" class="nav-link" href="${pageContext.request.contextPath}/consumer/allAskbook.do">全部求购</a>
                </li>

                <li class="nav-item">
                    <a id="addaskbook" class="nav-link" href="${pageContext.request.contextPath}/consumer/addaskbook.do">发布求购</a>
                </li>


            </ul>

            <ul class="navbar-nav mr-auto" id="content2" style="padding-left: 200px">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/consumer/mySell.do" class="nav-link">
                        <img src="${pageContext.request.contextPath}/img/consumer/tou.png">
                        <span >
                            <%--获取当前用户名--%>
                            <shiro:principal/>
                        </span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/logout">退出</a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<%--导航栏 end--%>

<script>
    $(function () {
        var href = window.location.href;
        var id = href.substring(href.lastIndexOf('/')+1);
        id = id.substring(0,id.length-3);
        $("#"+id).addClass("currentSelect");
    })


</script>


</body>
</html>
