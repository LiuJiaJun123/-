<%--
  User: Liu Jiajun
  Date: 2020/3/5
  Time: 22:34
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布二手书</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3//css/bootstrap.min.css" >

    <script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>

</head>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->

<body>
<div class="htmleaf-container">

    <div class="demo form-bg" style="padding: 20px 0;">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6">
                    <form class="form-horizontal">

                        <span class="heading">书籍信息</span>

                        <div class="form-group">
                            <input type="email" class="form-control" id="inputEmail3" placeholder="书籍名称">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group help">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="作者">
                            <%--<i class="fa fa-lock"></i>--%>
                            <%--<a href="#" class="fa fa-question-circle"></a>--%>
                        </div>

                        <div class="form-group help">
                            <select class="form-control">
                                <option>请选择书籍类别</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div class="form-group help">
                            <select class="form-control">
                                <option>请选择书籍成色</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div class="form-group help">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="价格">
                            <i class="fa fa-lock"></i>
                            <a href="#" class="fa fa-question-circle"></a>
                        </div>

                        <div class="form-group">
                            <%--<input type="password" class="form-control" id="inputPassword3" placeholder="描述">--%>
                            <textarea class="form-control" rows="4" placeholder="描述"></textarea>
                            <%--<i class="fa fa-lock"></i>--%>
                            <%--<a href="#" class="fa fa-question-circle"></a>--%>
                        </div>


                        <div class="input-group" style="width: 93%;padding-left: 7%">
                            <input type="text" class="form-control" οnkeydοwn="return false;" οnpaste="return false;" placeholder="上传图片">
                            <label class="input-group-btn">
                                <span class="btn btn-primary">
                                    <i class="glyphicon glyphicon-folder-open"></i>  
                                    选择图片 <input type="file" style="display: none;" multiple>
                                </span>
                            </label>
                        </div>



                        <div class="form-group" style="margin-top: 50px; margin-right:34%;">
                            <%--<div class="main-checkbox">--%>
                                <%--<input type="checkbox" value="None" id="checkbox1" name="check"/>--%>
                                <%--<label for="checkbox1"></label>--%>
                            <%--</div>--%>
                            <%--<span class="text">Remember me</span>--%>
                            <button type="submit" class="btn btn-default">发布二手书</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<style type="text/css">

    body {
        background: url("../../img/背景3.jpg") no-repeat center 0px; //repeat设置重复，center设置位置
    background-position: center 0;
        background-size: cover;

    }

    /*.form-bg{*/
    /*background: #00b4ef;*/
    /*}*/
    .form-horizontal{
        background: #fff;
        padding-bottom: 40px;
        border-radius: 15px;
        text-align: center;
        margin-top: 8%;
        margin-left: 41%;
        width: 650px;
        height: 700px;
    }
    .form-horizontal .heading{
        display: block;
        font-size: 35px;
        font-weight: 700;
        padding: 25px 0;
        border-bottom: 1px solid #f0f0f0;
        margin-bottom: 20px;
    }
    .form-horizontal .form-group{
        padding: 0 40px;
        margin: 0 0 15px 0;
        position: relative;
    }
    .form-horizontal .form-control{
        background: #f0f0f0;
        border: none;
        border-radius: 20px;
        box-shadow: none;
        padding: 0 20px 0 45px;
        /*height: 40px;*/
        transition: all 0.3s ease 0s;
    }
    .form-horizontal .form-control:focus{
        background: #e0e0e0;
        box-shadow: none;
        outline: 0 none;
    }
    .form-horizontal .form-group i{
        position: absolute;
        top: 12px;
        left: 60px;
        font-size: 17px;
        color: #c8c8c8;
        transition : all 0.5s ease 0s;
    }
    .form-horizontal .form-control:focus + i{
        color: #00b4ef;
    }
    .form-horizontal .fa-question-circle{
        display: inline-block;
        position: absolute;
        top: 12px;
        right: 60px;
        font-size: 20px;
        color: #808080;
        transition: all 0.5s ease 0s;
    }
    .form-horizontal .fa-question-circle:hover{
        color: #000;
    }
    .form-horizontal .main-checkbox{
        float: left;
        width: 20px;
        height: 20px;
        background: #11a3fc;
        border-radius: 50%;
        position: relative;
        margin: 5px 0 0 5px;
        border: 1px solid #11a3fc;
    }
    .form-horizontal .main-checkbox label{
        width: 20px;
        height: 20px;
        position: absolute;
        top: 0;
        left: 0;
        cursor: pointer;
    }
    .form-horizontal .main-checkbox label:after{
        content: "";
        width: 10px;
        height: 5px;
        position: absolute;
        top: 5px;
        left: 4px;
        border: 3px solid #fff;
        border-top: none;
        border-right: none;
        background: transparent;
        opacity: 0;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg);
    }
    .form-horizontal .main-checkbox input[type=checkbox]{
        visibility: hidden;
    }
    .form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
        opacity: 1;
    }
    .form-horizontal .text{
        float: left;
        margin-left: 7px;
        line-height: 20px;
        padding-top: 5px;
        text-transform: capitalize;
    }
    .form-horizontal .btn{
        float: right;
        font-size: 14px;
        color: #fff;
        background: #00b4ef;
        border-radius: 30px;
        padding: 10px 25px;
        border: none;
        text-transform: capitalize;
        transition: all 0.5s ease 0s;
    }
    @media only screen and (max-width: 479px){
        .form-horizontal .form-group{
            padding: 0 25px;
        }
        .form-horizontal .form-group i{
            left: 45px;
        }
        .form-horizontal .btn{
            padding: 10px 20px;
        }
    }
</style>

</body>
</html>
