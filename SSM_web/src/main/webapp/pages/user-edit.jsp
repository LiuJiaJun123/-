<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户信息编辑</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				用户管理 <small>用户信息编辑</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/findAll.do?page=1$pageSize=4">用户管理</a></li>
				<li class="active">用户信息编辑</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form action="${pageContext.request.contextPath}/user/update.do" id="saveForm"
				method="post">
				<!-- 正文区域 -->
				<section class="content">

				<div class="panel panel-default">
					<div class="panel-heading">用户信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">用户ID</div>
						<div class="col-md-10 data">
							<input type="text" class="form-control" name="id"
								   placeholder="用户ID" value="${user.id}" readonly>
						</div>

						<div class="col-md-2 title">用户名称</div>
						<div class="col-md-4 data">
							<div class="input-group date">
								<div style="float: left">
									<input id="username" type="text" class="form-control" name="username"
										   placeholder="用户名称" value="${user.username}">
								</div>
								<span id="span_username" style="float: right"></span>
							</div>
						</div>

						<div class="col-md-2 title">密码</div>
						<div class="col-md-4 data">
							<div class="input-group date">
								<div style="float: left">
									<input id="password" type="text" class="form-control" name="password"
										   placeholder="密码" value="${user.password}">
								</div>
								<span id="span_password" style="float: right"></span>
							</div>
						</div>

						<div class="col-md-2 title">联系电话</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="phone"
								placeholder="联系电话" value="${user.phone}">
						</div>

						<div class="col-md-2 title">qq</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="qq"
								   placeholder="qq" value="${user.qq}">
						</div>


						<div class="col-md-2 title">邮箱</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="email"
								   placeholder="邮箱" value="${user.email}">
						</div>

						<div class="col-md-2 title">地址</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="address"
								   placeholder="地址" value="${user.address}">
						</div>

						<div class="col-md-2 title">角色</div>
						<div class="col-md-4 data line-height36">
							<div class="form-group form-inline">
								<c:if test="${user.role==1}">
									<div class="radio"><label><input name="role" type="radio" value="1" checked>管理员</label></div>
									<div class="radio"><label><input name="role" type="radio" value="2">普通用户</label></div>
								</c:if>
								<c:if test="${user.role==2}">
									<div class="radio"><label><input name="role" type="radio" value="1">管理员</label></div>
									<div class="radio"><label><input name="role" type="radio" value="2" checked>普通用户</label></div>
								</c:if>
							</div>
						</div>

						<div class="col-md-2 title">用户状态</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%" name="status">
								<c:if test="${user.status==0}">
									<option value="1">开启</option>
									<option value="0" selected="selected">关闭</option>
								</c:if>
								<c:if test="${user.status==1}">
									<option value="1" selected="selected">开启</option>
									<option value="0">关闭</option>
								</c:if>
							</select>
						</div>

						<div class="col-md-2 title rowHeight2x">描述</div>
						<div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" name="description"
									  placeholder="描述" >${user.description}</textarea>
						</div>

					</div>
				</div>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<%--<button id="btnSave" type="submit" class="btn bg-maroon" onclick="location.href='${pageContext.request.contextPath}/user/update.do'">保存</button>--%>
					<button id="btnSave" type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
			</form>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Designed by <a href="${pageContext.request.contextPath}/AboutMe.jsp">刘嘉俊</a>.</strong> All rights reserved.
		</footer>
		<!-- 底部导航 /-->
	</div>


	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>


    <%--添加用户时，检查用户名是否存在，密码是否符合正则表达式--%>
    <script>
        // 检查密码是否符合正则表达式
        function checkPassword() {
            var password = $("#password").val();
            var reg_password=/^\w{6,20}$/;
            var flag = reg_password.test(password);
            if (flag==true){
                //校验通过
                $("#password").css("border","");
                $("#span_password").text("")
            } else{
                //校验不通过
                $("#password").css("border","1px solid red");
                $("#span_password").text("请输入6-20位的密码")
                $("#span_password").css("color","red");
            }
            return flag;
        }

        function checkUsername(){
            var username=$("#username").val();
            // 如果用户名是当前用户名，则不查询是否重名
			if (username=="${user.username}") {
                $("#username").css("border","");
                $("#span_username").text("");
				return true;
			}
            var allData = {
                username:username
            };
            var flag =false;

            $.ajax({
                url:"${pageContext.request.contextPath}/user/findByName.do",
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(allData),//'{"username":username}',
                dataType:"json",
                type:"post",
                success:function (data) {
                    if (data.flag){
                        $("#username").css("border","");
                        $("#span_username").text("");
                        flag = true;
                    }else{
                        $("#username").css("border","1px solid red");
                        $("#span_username").text(data.errorMsg);
                        $("#span_username").css("color","red");
                        flag = false;
                    }

                }
            });
            return flag;
        }

        $("#btnSave").click(function () {
            return save_check();
        })

        function save_check(){
            var flag = checkUsername()&&checkPassword();
            if (flag==false){
                // 出错
                return false;
            }
            // 没出错，提交表单
            $("#saveForm").submit();
        }

        $(function () {

            $("#password").blur(checkPassword);
            $("#username").blur(checkUsername);

        });

    </script>



	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

        $(document).ready(function() {

            // 激活导航位置
            setSidebarActive("user-management");

            // 列表按钮
            $("#dataList td input[type='checkbox']").iCheck({
                checkboxClass : 'icheckbox_square-blue',
                increaseArea : '20%'
            });
            // 全选操作
            $("#selall").click(function() {
                var clicks = $(this).is(':checked');
                if (!clicks) {
                    $("#dataList td input[type='checkbox']").iCheck("uncheck");
                } else {
                    $("#dataList td input[type='checkbox']").iCheck("check");
                }
                $(this).data("clicks", !clicks);
            });
        });
	</script>


</body>

</html>