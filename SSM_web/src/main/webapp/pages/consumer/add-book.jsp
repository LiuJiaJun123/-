<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发布二手书</title>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    <!-- 表单校验插件 -->
    <script
            src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $('form')
                .bootstrapValidator(
                    {
                        message : 'This value is not valid',
                        feedbackIcons : {
                            valid : 'glyphiconglyphicon-ok',
                            invalid : 'glyphiconglyphicon-remove',
                            validating : 'glyphiconglyphicon-refresh'
                        },
                        fields : {
                            book_name : {
                                message : '请输入书籍名称',
                                validators : {
                                    notEmpty : {
                                        message : '书籍名称不能为空'
                                    }
                                }
                            },
                            price : {
                                message : '请输入大于0的价格',
                                validators : {
                                    notEmpty : {
                                        message : '价格不能为空'
                                    },
                                    greaterThan: {
                                        value : 0.0,
                                        message : '价格不能低于0'
                                    }
                                }
                            },
                        }
                    });
        });
    </script>
</head>



<body>
<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<form class="form-horizontal" role="form" id="form1">

    <span class="heading">发布二手书</span>

    <div class="form-group row">
        <label  class="must" ></label>
        <label for="book_name" class="col-sm-3 control-label">书籍名称</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="book_name" name="book_name" placeholder="请输入书籍名称">
        </div>
    </div>

    <div class="form-group row">
        <label for="author" class="col-sm-3 control-label">书籍作者</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="author" name="author" placeholder="请输入书籍作者">
        </div>
    </div>

    <div class="form-group help row">
        <label for="category_id" class="col-sm-3 control-label">书籍类别</label>
        <div class="col-sm-9" >
            <select class="form-control" name="categoryInfo.category_id" id="category_id">
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.category_id}">${category.category_name}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group help row">
        <label for="appearance" class="col-sm-3 control-label">书籍成色</label>
        <div class="col-sm-9" >
            <select class="form-control" name="appearance" id="appearance">
                <option value="无说明">请选择</option>
                <option value="9成新">9成新</option>
                <option value="8成新">8成新</option>
                <option value="7成新">7成新</option>
                <option value="6成新">6成新</option>
                <option value="5成新">5成新</option>
                <option value="4成新">4成新</option>
                <option value="3成新">3成新</option>
                <option value="2成新">2成新</option>
                <option value="1成新">1成新</option>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="must"></label>
        <label for="price" class="col-sm-3 control-label">出售价格</label>
        <div class="col-sm-9">
            <input type="number"  min="0.0" step="0.00001" class="form-control" id="price" name="price" placeholder="请输入出售价格">
        </div>
    </div>

    <%
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String now = sdf.format(date);
    %>
    <input type="hidden" class="form-control" name="time"
           placeholder="出售时间" value="<%=now %>">

    <div class="form-group row">
        <label for="description" class="col-sm-3 control-label">描述</label>
        <div class="col-sm-9">
            <textarea class="form-control" rows="3" placeholder="说些什么吧..."
                   id="description"   name="description"></textarea>
        </div>
    </div>


</form>

<style type="text/css">


    .must:before {
        content: '*';
        position: absolute;
        top: -3px;
        left: 10px;
        padding: 0 8px;
        line-height: 48px;
        color: #c33;
        cursor: text;
        visibility: visible;
        opacity: 1;
        -webkit-transform: translate(0, 0);
        -ms-transform: translate(0, 0);
        transform: translate(0, 0);
        font-size: 24px;
        font-weight: normal;
    }

    body {
        background: url("../../img/背景6.png") no-repeat center 0px; //repeat设置重复，center设置位置
        background-position: center 0;
        background-size: cover;
    }


    .form-horizontal{
        background: #fff;
        padding-top: 10px;
        border-radius: 10px;
        text-align: center;
        margin: 0px auto;
        /*margin-left: 41%;*/
        margin-top: 100px;
        width: 650px;
        height: 700px;
    }
    .form-horizontal .heading{
        display: block;
        font-size: 25px;
        font-weight: 500;
        padding: 15px 0;
        border-bottom: 1px solid #f0f0f0;
        margin-bottom: 20px;
    }


    .form-horizontal .form-group{
        /*padding: 20px 40px 0px;*/
        margin: 10px 0 15px 0;
        position: relative;
    }

    .form-horizontal .form-group label{
        margin-top: 0.35vw;
    }

    .form-horizontal .form-group .col-sm-9 .help-block{
        position: absolute;
        left: 50%;
        bottom: 25%;
        font-size: 16px;
        color: red;
    }

</style>


</body>
</html>