<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公告详情</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<script type="text/javascript" src="/js/all-book/jquery-1.7.2.min.js"></script>

</head>
<body>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<div class="announcement-content">

    <div class="announcement-title">
        ${announcementInfo.title}
    </div>
    <span class="announcement-time">发布时间：<fmt:formatDate value='${announcementInfo.time}' pattern='yyyy-MM-dd HH:mm'/></span>
    <hr>

    <div class="announcement-desc">
        ${announcementInfo.description}
    </div>

    <div class="announcement-img">
        <c:if test="${announcementInfo.imgUrl!='../img/暂无图片.png'}">
            <img src="${announcementInfo.imgUrl}">
        </c:if>

    </div>

</div>


<style>
    .announcement-content{
        margin: 50px auto;
        width: 70%;
        height: 800px;
        padding: 20px;
        border:1px solid #d3d3d3;background:#f7f7f7
    }
    .announcement-title{
        text-align: center;
        font-size: 24px;
    }
    .announcement-time{
        color: #919191;
        font-size: 13px;
        padding-left: 70%;
    }
    .announcement-desc{
        padding: 20px 5px;
        text-indent: 2em;
    }
    .announcement-img{
        margin: 20px auto;
    }
    .announcement-img img{
        margin: 40px auto;
        height: 400px;
        width: 600px;
        margin-left: 20%;

    }
</style>

</body>
</html>