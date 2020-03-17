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
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.do" >首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">全部商品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/consumer/addbook.do">发布商品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">全部求购</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">发布求购</a>
                </li>
                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link" href="${pageContext.request.contextPath}/center">刘嘉俊</a>--%>
                <%--</li>--%>

            </ul>
            <%--<form class="form-inline my-2 my-lg-0">--%>
                <%--<input class="form-control mr-sm-2" type="search" placeholder="在此输入内容" aria-label="Search">--%>
                <%--<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">搜索</button>--%>
            <%--</form>--%>

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



</body>
</html>
