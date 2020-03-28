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
    <title>商品详情</title>
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
<form action="post" method="" style="margin-bottom: 100px">

    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl">${bookInfo.book_name}</div>
            <%--<nav class="fr">--%>
                <%--<li><a href="">概述</a></li>--%>
                <%--<li>|</li>--%>
                <%--<li><a href="">变焦双摄</a></li>--%>
                <%--<li>|</li>--%>
                <%--<li><a href="">设计</a></li>--%>
                <%--<li>|</li>--%>
                <%--<li><a href="">参数</a></li>--%>
                <%--<li>|</li>--%>
                <%--<li><a href="">F码通道</a></li>--%>
                <%--<li>|</li>--%>
                <%--<li><a href="">用户评价</a></li>--%>
                <%--<div class="clear"></div>--%>
            <%--</nav>--%>
            <div class="clear"></div>
        </div>
    </div>

    <div class="jieshao mt20 w">
        <div class="left fl"><img src="${bookInfo.imgUrl}"></div>
        <div class="right fr">

            <div class="favorite fr" style="margin-top: 25px; margin-right: 300px;" >
                <span class="favo favo-default" onclick="favo_click()"></span><span class="favotxt">
                    点击收藏
                </span>
            </div>

            <div class="h3 ml20 mt20" style="color: teal">${bookInfo.book_name}</div>

            <div class="jianjie mr40 ml20 mt20"><span style="color: #0097bc">描述：</span>${bookInfo.description}</div>
            <div class="mr40 ml20 mt20">作者：<span style="color: teal">${bookInfo.author}</span>
                <span class="ml40">类别：</span><a style="color: teal" href="" >${bookInfo.categoryInfo.category_name}</a>
                <span class="ml40">成色：</span><a style="color: teal" href="" >${bookInfo.appearance}</a>
            </div>

            <div class="mr40 ml20 mt20">上市时间：
                <span style="color: teal"><fmt:formatDate value='${bookInfo.time}' pattern='yyyy-MM-dd HH:mm'/></span>
            </div>

            <div class="jiage ml20 mt40">价格：￥${bookInfo.price}元</div>

            <br><br>
            <span class="ml20" style="font-size: 20px;color: #ff6709; ">联系卖家：</span><br>
            <div class="mr40 ml20 mt10">
                <span class="ml20">卖家名字：</span><a style="color: teal" href="" >${bookInfo.userInfo.username}</a>
                <span class="ml20">手机：</span><a style="color: teal" href="" >${bookInfo.userInfo.phone}</a>
                <span class="ml20">qq：</span><a style="color: teal" href="" >${bookInfo.userInfo.qq}</a>
            </div>

            <div class="mr40 ml20 mt10">
                <span class="ml20">email：</span><a style="color: teal" href="" >${bookInfo.userInfo.email}</a>
                <span class="ml20">地址：</span><a style="color: teal" href="" >${bookInfo.userInfo.address}</a>
            </div>



            <%--<div class="xiadan ml20 mt20">--%>
                <%--<input class="jrgwc"  type="button" name="jrgwc" value="点击收藏" />--%>
                <%--<input class="jrgwc" type="button" name="jrgwc" value="我想要" />--%>

            <%--</div>--%>
        </div>
        <div class="clear"></div>
    </div>
</form>


<script type="text/javascript" src="/js/xiangqing/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/js/xiangqing/jquery.flexText.js"></script>


<%--点击收藏、取消收藏--%>
<style>
    .favorite{
        width: 90px;
        height: 30px;
        line-height: 30px;
        font-size: 14px;
        color: #999;
    }
    .favorite>span.favo{
        display: inline-block;
        vertical-align: top;
        width: 25px;
        height: 25px;
        cursor: pointer;
    }
    .favo-default{
        background: url(/img/favo.png) no-repeat center top;
        background-size: 25px 25px;
    }
    .favo-hover{
        background: url(/img/favo-hover.png) no-repeat center top;
        background-size: 25px 25px;
    }
    /*.favotxt-color{*/
        /*color: #999;*/
    /*}*/
    .favotxt-color{
        color: #00a7d0;
    }
</style>

<script>

    function favo_click(){

        var txt = $(".favotxt").text().trim()

        if( txt == "点击收藏" && $(".favo").hasClass("favo-default")){
            $(".favotxt").text("已收藏")
            $(".favotxt").addClass("favotxt-color")
            $(".favo").removeClass("favo-default");
            $(".favo").addClass("favo-hover");

            $.ajax({
                url:"/collection/save.do?book_id="+${bookInfo.book_id},
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                type:"post",
                success:function (data) {
                }
            });
        }

        if (txt == "已收藏" && $(".favo").hasClass("favo-hover")){
            $(".favotxt").text("点击收藏");
            $(".favotxt").removeClass("favotxt-color")
            $(".favo").removeClass("favo-hover");
            $(".favo").addClass("favo-default");

            $.ajax({
                url:"/collection/delete.do?book_id="+${bookInfo.book_id},
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                type:"post",
                success:function (data) {
                }
            });
        };
    }



    //页面加载时候，查询是否 已经收藏
    $(document).ready(function() {
        $.ajax({
            url:"/collection/search.do?book_id="+${bookInfo.book_id},
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            type:"post",
            success:function (data) {
                // 已收藏
                if (data==1){
                    $(".favotxt").text("已收藏")
                    $(".favotxt").addClass("favotxt-color")
                    $(".favo").removeClass("favo-default");
                    $(".favo").addClass("favo-hover");
                }
            }
        });
    });

</script>


<!-- footer -->
<footer class="mt20 center">

    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

</footer>

<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper./js/xinagqing/1.14.3/umd/popper.min.js"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3//js/xinagqing/bootstrap.min.js"></script>--%>


</body>
</html>
