<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全部求购</title>

<link rel="stylesheet" type="text/css" href="/css/consumer/all-book-list.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<script type="text/javascript" src="/js/all-book/jquery-1.7.2.min.js"></script>

</head>
<body>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<div>

    <form class="form-group row searchForm">
        <div class="form-group col-sm-9">
            <input type="text" id="searchContent" name="searchContent" class="form-control " placeholder="输入书名进行搜索" />
        </div>
        <button type="button" id="search_btn" class="btn btn-danger col-sm-2 search_btn">搜索</button>
    </form>

    <style>
        .searchForm{
            margin: 50px auto 10px !important;
            width: 800px;
        }
        .search_btn{
            height: 37px;
            margin-left: -10px;
        }
    </style>


    <%--求购书籍列表--%>
    <div  id="mydiv">
    </div>


    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        var allData = {
            searchContent:""
        };
        var flag =false;
        $.ajax({
            url:"/consumer/searchAskbook.do",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify(allData),
            dataType:"html",
            type:"post",
            success:function (data) {
                $('#mydiv').html(data);
            }
        });
    </script>


    <script type="text/javascript">
        function search(){
            var searchContent = $("#searchContent").val();
            var allData = {
                searchContent:searchContent
            };
            $.ajax({
                url:"/consumer/searchAskbook.do",
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(allData),
                dataType:"html",
                type:"post",
                success:function (data) {
                    $('#mydiv').html(data);
                }
            });
        }


        $("#search_btn").click(function () {
            search();
        });

        //按键盘的回车键也执行搜索
        $("#searchContent").keydown(function () {
            if(event.keyCode==13) {
                event.preventDefault();
                search();
            }
        });
    </script>

</div>


</body>
</html>