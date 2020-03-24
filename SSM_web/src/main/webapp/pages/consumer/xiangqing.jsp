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
<form action="post" method="">

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


<%--评论--%>
<div class="commentAll">
    <!--评论区域 begin-->
    <div class="reviewArea clearfix">
        <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
        <a href="javascript:;" class="plBtn">评论</a>
    </div>
    <!--评论区域 end-->
    <!--回复区域 begin-->
    <div class="comment-show">
        <div class="comment-show-con clearfix">
            <div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div>
            <div class="comment-show-con-list pull-left clearfix">
                <div class="pl-text clearfix">
                    <a href="#" class="comment-size-name">张三 : </a>
                    <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                </div>
                <div class="date-dz">
                    <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                    <div class="date-dz-right pull-right comment-pl-block">
                        <a href="javascript:;" class="removeBlock">删除</a>
                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                        <span class="pull-left date-dz-line">|</span>
                        <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
                    </div>
                </div>
                <div class="hf-list-con"></div>
            </div>
        </div>
    </div>
    <!--回复区域 end-->
</div>



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

</script>







<!--textarea高度自适应-->
<script type="text/javascript">
     
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
     
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
</script>
<!--点击评论创建评论条-->
<script type="text/javascript">
     
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }
    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
     
    $('.comment-show').on('click','.pl-hf',function(){
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@'+fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
     
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName;
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
            $.getJSON("json/pl.json",function(data){
                var oAt = '';
                var oHf = '';
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
     
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    })
</script>
<!--点赞-->
<script type="text/javascript">
     
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
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
