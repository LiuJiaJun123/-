<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  User: Liu Jiajun
  Date: 2020/1/31
  Time: 13:21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>求购详情</title>
    <link rel="stylesheet" type="text/css" href="/css/consumer/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3//css/bootstrap.min.css" >

    <link rel="stylesheet" href="/css/consumer/xiangqing/style2.css">
    <link rel="stylesheet" href="/css/consumer/xiangqing/comment.css">

</head>
<body>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<!-- xiangqing -->
<form action="post" method=""  style="margin-bottom: 100px">

    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl">求购书籍详情</div>
            <div class="clear"></div>
        </div>
    </div>

    <div class="jieshao mt20 w">
        <div class="left fl"><img src="${askBookInfo.imgUrl}"></div>
        <div class="right fr">

            <div class="h3 ml20 mt20" style="color: teal">${askBookInfo.askbook_name}</div>

            <div class="jianjie mr40 ml20 mt20"><span style="color: #0097bc">描述：</span>${askBookInfo.description}</div>
            <div class="mr40 ml20 mt20">作者：<span style="color: teal">${askBookInfo.author}</span>
                <span class="ml40">类别：</span><a style="color: teal" href="" >${askBookInfo.categoryInfo.category_name}</a>
                <span class="ml40">成色：</span><a style="color: teal" href="" >${askBookInfo.appearance}</a>
            </div>

            <div class="mr40 ml20 mt20">上市时间：
                <span style="color: teal"><fmt:formatDate value='${askBookInfo.time}' pattern='yyyy-MM-dd HH:mm'/></span>
            </div>

            <%--<div class="jiage ml20 mt40">价格：￥${askBookInfo.price}元</div>--%>

            <br><br>
            <span class="ml20" style="font-size: 20px;color: #ff6709; ">联系买家：</span><br>
            <div class="mr40 ml20 mt10">
                <span class="ml20">买家名字：</span><a style="color: teal" href="" >${askBookInfo.userInfo.username}</a>
                <span class="ml20">手机：</span><a style="color: teal" href="" >${askBookInfo.userInfo.phone}</a>
                <span class="ml20">qq：</span><a style="color: teal" href="" >${askBookInfo.userInfo.qq}</a>
            </div>

            <div class="mr40 ml20 mt10">
                <span class="ml20">email：</span><a style="color: teal" href="" >${askBookInfo.userInfo.email}</a>
                <span class="ml20">地址：</span><a style="color: teal" href="" >${askBookInfo.userInfo.address}</a>
            </div>


        </div>
        <div class="clear"></div>
    </div>
</form>




<script type="text/javascript" src="/js/xiangqing/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/js/xiangqing/jquery.flexText.js"></script>


<!-- footer -->
<footer class="mt20 center">

    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

</footer>

</body>
</html>
