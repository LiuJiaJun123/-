<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>请登录</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<script type="text/javascript" src="/js/all-book/jquery-1.7.2.min.js"></script>

</head>
<body>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<div class="content">

    <img style="float: left" src="/img/consumer/fx.png">

    <div class="class1">
        <div class="title">
            温馨提示
        </div>
        <hr>
        <div class="desc">
            您还没有登录，请先<a href="/login.jsp" class="login">登录</a>！
        </div>
    </div>

</div>


<style>
    .content{
        margin: 50px auto;
        width: 70%;
        height: 800px;
        padding: 20px;
    }
    img{
        width: 19vw;
    }
    .class1{
        float: right;
        margin: 0% 20% 0 0;
        width: 50%;
        height: 400px;
        padding: 20px;
        border:1px solid #cceff5;background:#fafcfd
    }
    .title{
        color: #0097bc;
        font-size: 22px;
    }
    .desc{
        padding: 10% 10% 0 10%;
        font-size: 20px;
        letter-spacing: 2px;
    }
    .login{
        color: #dc3545;
        font-size: 20px;
        letter-spacing: 2px;
    }

</style>

</body>
</html>