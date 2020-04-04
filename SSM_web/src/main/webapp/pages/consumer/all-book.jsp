<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全部商品</title>
<link rel="stylesheet" type="text/css" href="/css/consumer/all-book.css">
<script type="text/javascript" src="/js/all-book/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/all-book/script.js"></script>

</head>
<body>
<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->

	<ul class="select">
		<li class="select-list">
			<dl id="selectCategory">
				<dt>种类：</dt>
				<dd class="select-all selected"><a href="#">全部</a></dd>

				<c:forEach items="${categoryList}" var="category">
					<dd><a href="#">${category.category_name}</a></dd>
				</c:forEach>

				<%--<dd><a href="#">成功励志</a></dd>--%>
				<%--<dd><a href="#">法律</a></dd>--%>
				<%--<dd><a href="#">工具书</a></dd>--%>
				<%--<dd><a href="#">管理</a></dd>--%>
				<%--<dd><a href="#">计算机与网络</a></dd>--%>
				<%--<dd><a href="#">科技工程</a></dd>--%>
				<%--<dd><a href="#">生活时尚考试</a></dd>--%>
				<%--<dd><a href="#">政治军事</a></dd>--%>
				<%--<dd><a href="#">其他</a></dd>--%>

			</dl>
		</li>
		<li class="select-list">
			<dl id="selectAppearance">
				<dt>成色：</dt>
				<dd class="select-all selected"><a href="#">全部</a></dd>
				<dd><a href="#">9成新</a></dd>
				<dd><a href="#">8成新</a></dd>
				<dd><a href="#">7成新</a></dd>
				<dd><a href="#">6成新</a></dd>
				<dd><a href="#">5成新</a></dd>
				<dd><a href="#">4成新</a></dd>
				<dd><a href="#">3成新</a></dd>
				<dd><a href="#">2成新</a></dd>
				<dd><a href="#">1成新</a></dd>
			</dl>
		</li>
		<li class="select-list">
			<dl id="selectPrice">
				<dt>价格：</dt>
				<dd class="select-all selected"><a href="#">全部</a></dd>
				<dd><a href="#">10元以内</a></dd>
				<dd><a href="#">10~20元</a></dd>
				<dd><a href="#">20~40元</a></dd>
				<dd><a href="#">40元以上</a></dd>
			</dl>
		</li>
		<li class="select-result selectCondition">
			<dl>
				<dt>已选条件：</dt>
				<dd class="select-no">暂时没有选择过滤条件</dd>
			</dl>

			<form class="form-group row searchForm">
				<div class="form-group col-sm-9">
					<input type="text" id="searchContent" name="searchContent" class="form-control " placeholder="输入书名进行搜索" />
				</div>
				<button type="button" id="search_btn" class="btn btn-danger col-sm-3 search_btn">搜索</button>
			</form>
		</li>



		<style>
			.selectCondition{
				position: relative;
			}
			.search_btn{
				height: 37px;
				margin-left: -10px;
			}
			.searchForm{
				position: absolute;
				top: 25%;
				left: 70%;
				width: 300px;
			}
		</style>

	</ul>

<%--书籍列表--%>
<div  id="mydiv">
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script>
    $(function () {
        var allData = {
            selectCategory:"",
            selectAppearance:"",
            selectPrice:"",
            searchContent:""
        };
        var flag =false;
        $.ajax({
            url:"/consumer/searchbook.do",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify(allData),
            dataType:"html",
            type:"post",
            success:function (data) {
                // alert(data)
                $('#mydiv').html(data);
            }
        });
    })
</script>

</body>
</html>