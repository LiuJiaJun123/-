<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  User: Liu Jiajun
  Date: 2020/2/10
  Time: 23:31
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="../../css/consumer/style.css">
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >--%>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min4.css">

    <script
            src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>

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
                            oldPwd : {
                                message : '请输入原密码',
                                validators : {
                                    notEmpty : {
                                        message : '原密码不能为空'
                                    },
                                }
                            },
                            password : {
                                message : ' ',
                                validators : {
                                    notEmpty : {
                                        message : '新密码不能为空'
                                    },
                                    stringLength: {
                                        min: 6,
                                        max: 20,
                                        message: '密码长度必须在6到20位之间'
                                    },
                                    identical: {
                                        field: 'password2',
                                        message: ''
                                    }
                                }
                            },
                            password2 : {
                                message : '请再次输入新密码',
                                validators : {
                                    notEmpty : {
                                        message : '新密码不能为空'
                                    },
                                    identical: {
                                        field: 'password',
                                        message: '两次输入的密码不相符'
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


<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl">
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/consumer/mySell.do" >我发布的商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myAsk.do">我的求购</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myCollection.do">我的收藏</a></li>
                    <li><a href="">消息通知</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/updatePwd.do" style="color:#ff6700;font-weight:bold;">修改密码</a></li>
                </ul>
            </div>
        </div>


        <div class="rtcont fr">
            <div class="ddzxbt">修改密码</div>
        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/consumer/updatePwd.do" id="saveForm"
          method="post">

            <div class="form-group row" >
                <label for="oldPwd" class="col-sm-2 control-label">请输入原密码</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="oldPwd" name="oldPwd" placeholder="请输入原密码">
                </div>
            </div>

            <div class="form-group row" >
                <label for="password" class="col-sm-2 control-label">请输入新密码</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入新密码">
                </div>
            </div>

            <div class="form-group row" >
                <label for="password2" class="col-sm-2 control-label">再次输入新密码</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="再次输入新密码">
                </div>
            </div>


            <div class="box-tools text-center" style="padding-top: 20px;padding-right: 170px;">
                <button type="submit" class="btn btn-primary">修改密码</button>
                <%--<button type="button" class="btn bg-default"--%>
                <%--onclick="history.back(-1);">返回</button>--%>
            </div>

        </form>
        </div>
        <div class="clear"></div>

</div>


<footer class="mt20 center" style="margin-top: 50px;">
    <div class="mt20">
        <b>Version</b> 1.0.8
        <strong>Designed by 刘嘉俊.    </strong> All rights reserved.
    </div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <%--<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>--%>
</footer>

<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>--%>
<script src="/js/bootstrap.min.js"></script>


    <style type="text/css">

        .form-horizontal{
            padding-top: 10px;
            text-align: right;
            /*margin: 0px auto;*/
            /*margin-top: 60px;*/
            margin-left: 20px;
        }

        .form-horizontal .form-group{
            /*padding: 20px 40px 0px;*/
            margin: 10px 0 15px 0;
            position: relative;
        }

        .form-horizontal .form-group label{
            margin-top: 0.35vw;
        }

        .form-horizontal .form-group .col-sm-8 .help-block{
            position: absolute;
            left: 50%;
            bottom: 25%;
            font-size: 16px;
            color: red;
        }



    </style>

<script >


</script>

</body>
</html>

