<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--上传图片--%>
<%--<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />--%>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>书籍信息编辑</title>

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
				书籍管理 <small>书籍信息编辑</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/book/findAll.do?page=1&pageSize=4">书籍管理</a></li>
				<li class="active">书籍信息编辑</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

            <%--enctype="multipart/form-data"--%>
			<form action="${pageContext.request.contextPath}/book/update.do" id="updateForm"
				method="post" enctype="multipart/form-data">
				<!-- 正文区域 -->
				<section class="content"> <!--产品信息-->

				<div class="panel panel-default">
					<div class="panel-heading">书籍信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">书籍编号</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="book_id"
								   value="${bookInfo.book_id }" readonly="readonly">
						</div>

						<div class="col-md-2 title">卖家ID</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="userInfo.id"
								   value="${bookInfo.userInfo.id }" readonly="readonly">
						</div>

						<div class="col-md-2 title">书籍名称</div>
						<div class="col-md-4 data">
                            <input id="book_name" type="text" class="form-control" name="book_name"
                                 placeholder="书籍名称" value="${bookInfo.book_name}">
						</div>
						<div class="col-md-2 title">书籍作者</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="author"
								   placeholder="书籍作者" value="${bookInfo.author}">
						</div>

                        <div class="col-md-2 title">类别</div>
                        <div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%" name="categoryInfo.category_id">
								<option value="${bookInfo.categoryInfo.category_id}" selected>${bookInfo.categoryInfo.category_name}</option>
								<c:forEach items="${categoryNotSet}" var="category">
									<option value="${category.category_id}">${category.category_name}</option>
								</c:forEach>
							</select>
                        </div>
                        <div class="col-md-2 title">书籍成色</div>
                        <div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%"
									name="appearance">
								<c:if test="${bookInfo.appearance=='无说明'}">
									<option value="无说明" selected>请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='9成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新" selected>9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='8成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新" selected>8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='7成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新" selected>7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='6成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新" selected>6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='5成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新" selected>5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='4成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新" selected>4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='3成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新" selected>3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='2成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新" selected>2成新</option>
									<option value="1成新">1成新</option>
								</c:if>

								<c:if test="${bookInfo.appearance=='1成新'}">
									<option value="无说明">请选择</option>
									<option value="9成新">9成新</option>
									<option value="8成新">8成新</option>
									<option value="7成新">7成新</option>
									<option value="6成新">6成新</option>
									<option value="5成新">5成新</option>
									<option value="4成新">4成新</option>
									<option value="3成新">3成新</option>
									<option value="2成新">2成新</option>
									<option value="1成新" selected>1成新</option>
								</c:if>

							</select>
                        </div>
						<div class="col-md-2 title">书籍价格</div>
						<div class="col-md-4 data">
							<input type="number" class="form-control" name="price"
								 value="${bookInfo.price}">
						</div>

						<div class="col-md-2 title">上市时间</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="time"
								   value="<fmt:formatDate value='${bookInfo.time}' pattern='yyyy-MM-dd HH:mm'/>" readonly="readonly">
						</div>


						<div class="col-md-2 title">状态</div>
						<div class="col-md-10 data">
							<select class="form-control select2" style="width: 100%"
								name="status">
								<c:if test="${bookInfo.status==0}">
									<option value="0" selected="selected">关闭</option>
									<option value="1">开启</option>
								</c:if>

								<c:if test="${bookInfo.status==1}">
									<option value="0">关闭</option>
									<option value="1" selected="selected">开启</option>
								</c:if>
							</select>
						</div>

						<div class="col-md-2 title rowHeight2x">书籍图片</div>
						<div class="col-md-4 rowHeight2x" >
							<%--<input type="file" id="imgUrl" name="imgUrl" ONCHANGE="setImg(this);">--%>
							<%--没有图片--%>
							<c:if test="${bookInfo.imgUrl=='../img/暂无图片.png'}">
								<input style="margin-top: 0.5%; padding-top: 4%; padding-left: 2%; border: 1px solid lightgrey; width: 27vw; height: 4vw;"
									   type="file" id="uploadImg" name="uploadImg" ONCHANGE="setImg(this);">
							</c:if>
							<%--已有图片--%>
							<c:if test="${bookInfo.imgUrl !='../img/暂无图片.png'}">
								<img class="img-responsive" src="${bookInfo.imgUrl}" alt="Photo" style="height: 4.5vw;float: left;">
								<%--<input type="file" id="uploadImg" value="更换图片" name="uploadImg" ONCHANGE="setImg(this);">--%>
								<input type="button" value="修改图片" onclick="javascript:$('input[name=\'uploadImg\']').click();"
									style="margin-top: 10%;margin-left: 13%;"/>
								<input name="fileName" readonly />
								<input type="file" name="uploadImg"  style="display: none;" onchange="setImg2(this);" />
							</c:if>
						</div>

                        <div class="col-md-2 title rowHeight2x">描述</div>
                            <div class="col-md-4 data rowHeight2x">
                            <textarea class="form-control" rows="3"
                                      name="description">${bookInfo.description}</textarea>
                        </div>

					</div>
				</div>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button id="btnSave" type="button" class="btn bg-maroon">保存</button>
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


	<script>

        //图片上传,检查提交的是不是图片
        function setImg2(obj){

            var f=$(obj).val();
            if(f == null || f ==undefined || f == ''){
                return false;
            }
            if(!/\.(?:png|jpg|bmp|PNG|JPG|BMP)$/.test(f))
            {
                alert("类型必须是图片(.png|jpg|bmp|PNG|JPG|BMP)");
                $(obj).val('');
                return false;
            }
            $('input[name="fileName"]').val(obj.files[0].name);
        }

        //图片上传,检查提交的是不是图片
        function setImg(obj){

            var f=$(obj).val();
            if(f == null || f ==undefined || f == ''){
                return false;
            }
            if(!/\.(?:png|jpg|bmp|PNG|JPG|BMP)$/.test(f))
            {
                alert("类型必须是图片(.png|jpg|bmp|PNG|JPG|BMP)");
                $(obj).val('');
                return false;
            }
        }

        //提交
        $("#btnSave").click(function () {
            $("#updateForm").submit();
        })

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
            setSidebarActive("book-management");

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