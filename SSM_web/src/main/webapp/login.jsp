<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
	<%--pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/img/icon.jpg" sizes="100x100">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.jpg" type="img/x-icon">
	<title>ZQU BOOK</title>

</head>

<body>
<div class="container">
	<div class="logo">
		<img src="${pageContext.request.contextPath}/img/logo.png" alt="">
		<h2 class="hidden-xs"></h2>砚园人的二手书交易平台 <h2 class="hidden-xs"></h2>
	</div>
	<div class="login-toggle">
		<div class="row">
			<div class="center-block">
				<a href="#" class id="login-toggle-signUp">注册</a>
				<a href="#" class="active" id="login-toggle-signIn">登陆</a>
			</div>
			<%--<span id="login-toggle-bar"></span>--%>
		</div>
	</div>
	<div id="signUp-page" style="display: none">
		<form class="form-horizontal" id="register-form" role="form"
              action="${pageContext.request.contextPath}/register.do" method="post">
			<div class="register-group">
				<%--<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">--%>
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="text" id="username" name="username" class="register-control input-lg" required placeholder="用户名">
					<label  class="must" ></label>
					<label class="register-error-msg" id="username-error-msg"></label>
				</div>
			</div>
			<div class="register-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="password" id="password" name="password" class="register-control input-lg" required placeholder="密码（6-20位）">
					<label  class="must" ></label>
					<label class="register-error-msg" id="pwd-error-msg"></label>
				</div>
			</div>
			<div class="register-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="password" id="rePassword" class="register-control input-lg" required placeholder="再次输入密码">
					<label  class="must" ></label>
					<label class="register-error-msg" id="repwd-error-msg"></label>
				</div>
			</div>

			<div class="register-group">
				<%--<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">--%>
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="number" name="phone" class="register-control input-lg" required placeholder="手机号码">
					<label class="error-msg"></label>
				</div>
			</div>
			<div class="register-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="number" name="qq" class="register-control input-lg" required placeholder="QQ">
					<label class="error-msg"></label>
				</div>
			</div>
			<div class="register-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="text" name="email" class="register-control input-lg" required placeholder="邮箱">
					<label class="error-msg"></label>
				</div>
			</div>
			<div class="register-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="text" id="address" name="address" class="register-control input-lg" required placeholder="地址">
					<label class="error-msg"></label>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<%--<a href="#" type="submit" class="btu-submit">注册ZQU BOOK</a>--%>
					<button type="button" id="btn_register" class="btu-submit">注册ZQU BOOK</button>
				</div>
			</div>
		</form>
		<div class="row">
			<p>点击注册按钮，即代表你同意<a href="#">《ZQU BOOK协议》</a></p>
		</div>
	</div>
	<div id="signIn-page" >
		<form class="form-horizontal" id="signIn-form" role="form"
			   action="${pageContext.request.contextPath}/login.do" method="post">
			<div class="form-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="text" name="username" class="form-control input-lg" required placeholder="用户名">
					<label class="error-msg" id="error-msg-phnum">${usernameErrorMsg}</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<input type="password" name="password" class="form-control input-lg" required placeholder="密码">
					<label class="error-msg error-msg-password">${passwordErrorMsg}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-10 col-sm-8 col-md-4 col-lg-2 col-xs-offset-1 col-sm-offset-2 col-md-offset-4 col-lg-offset-5">
					<button type="submit" class="btu-submit">登陆</button>
				</div>
			</div>
		</form>
	</div>
</div>

<%
    if ((String)request.getAttribute("register_info") == "success") { %>
<script>
    alert("注册成功！");
</script>
<%
}%>

<%--<%--%>
    <%--if ((String)request.getAttribute("register_info") == "usernameHasExist") { %>--%>
<%--<script>--%>
    <%--alert("用户名已存在，请重新输入！");--%>
<%--</script>--%>
<%--<%--%>
    <%--}%>--%>

<canvas id="canvas"></canvas>
<script src="${pageContext.request.contextPath}/libs/jq-3.2.1/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/libs/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/login-toggle.js"></script>
<script src='${pageContext.request.contextPath}/js/canvas.js'></script>

<%--添加用户时，检查必填项是否有填，密码是否符合正则表达式，两次密码是否一致--%>
<script>


    //按键盘的回车键也执行注册
    $("#address").keydown(function () {
        if(event.keyCode==13) {
            return register_check();
        }
    });

    $("#btn_register").click(function () {
        return register_check();
    })

    function register_check(){

        var flag = checkUsername()&&checkPassword()&&checkRePassword();

        if (flag==false){
            // 出错
            return false;
        }

        // 没出错，提交表单
        $("#register-form").submit();
    }


    // 检查用户名是否符合正则表达式
	function checkUsername() {
        var username=$("#username").val();
        var allData = {
            username:username
        };
        var flag2 =false;

        $.ajax({
            url:"${pageContext.request.contextPath}/user/findByName.do",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify(allData),//'{"username":username}',
            dataType:"json",
            async: false,  //把异步处理设置 为false；即可给方法外部赋值
            type:"post",
            success:function (data) {
                if (data.flag){
                    $("#username").css("border","1px solid #0f88eb");
                    $("#username-error-msg").text("");
                    flag2 = true;
                }else{
                    $("#username").css("border","1px solid red");
                    // $("#username").text(data.errorMsg);
                    $("#username-error-msg").text("用户名已存在，请重新输入");
                    flag2 = false;
                }
            }
        });
        return flag2;
    }

    // 检查密码是否符合正则表达式
    function checkPassword() {
        var password = $("#password").val().trim();
        var reg_password=/^\w{6,20}$/;
        var flag = reg_password.test(password);
        if (flag==true){
            //校验通过
            $("#password").css("border","1px solid #0f88eb");
            $("#pwd-error-msg").text("")
        } else{
            //校验不通过
            $("#password").css("border","1px solid red");
            $("#pwd-error-msg").text("请输入6-20位的密码");
        }
        return flag;
    }

    // 校验2次密码是否相同
    function checkRePassword(){
        var password = $("#password").val().trim();
        var rePassword = $("#rePassword").val();
        var flag = false;
        if (password==rePassword){
            //校验通过
            $("#rePassword").css("border","1px solid #0f88eb");
            $("#repwd-error-msg").text("");
            flag = true;
        } else{
            //校验不通过
            $("#rePassword").css("border","1px solid red");
            $("#repwd-error-msg").text("两次密码不一致");
        }
        return flag;
	}

    $(function () {

        $("#username").blur(checkUsername);
        $("#password").blur(checkPassword);
        $("#rePassword").blur(checkRePassword);

    });


</script>

</body>

</html>