<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery淘宝商品列表多条件查询222</title>

<link rel="stylesheet" type="text/css" href="/css/consumer/all-book-list.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<%--<link rel="stylesheet" type="text/css" href="/css/consumer/all-book.css">--%>
<%--<script type="text/javascript" src="/js/all-book/jquery-1.7.2.min.js"></script>--%>
<%--<script type="text/javascript" src="/js/all-book/script.js"></script>--%>

</head>
<body>



<div class="danpin center">

	<div class="main center">
		<c:forEach items="${bookInfo.list}" var="book">
			<div class="mingxing " style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
				<div class="sub_mingxing"><a href=""><img src="../${book.imgUrl}" alt=""></a></div>
				<div class="pinpai"><a href="">${book.book_name}</a></div>
				<c:if test="${empty book.description}">
					<div class="youhui">暂无描述</div>
				</c:if>
				<c:if test="${not empty book.description}">
					<div class="youhui">${book.description}</div>
				</c:if>
				<div class="jiage">${book.price}元</div>
			</div>
		</c:forEach>
	</div>

	<hr style="width: 65%;margin: 0 auto; ">

	<div class="page_total_class1">
		总共${bookInfo.pages} 页，共${bookInfo.total} 条数据。
	</div>

	<%--分页 start--%>
	<div class="page_class1">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" onclick="lastPage()">上一页</a>
			</li>

			<c:forEach begin="1" end="${bookInfo.pages}" var="i">
				<c:if test="${i==bookInfo.pageNum}">
					<li class="page-item active">
						<a class="page-link" onclick="changePage(${i})" >${i}</a>
					</li>
				</c:if>
				<c:if test="${i!=bookInfo.pageNum}">
					<li class="page-item">
						<a class="page-link" onclick="changePage(${i})">${i}</a>
					</li>
				</c:if>
			</c:forEach>




			<li class="page-item">
				<a class="page-link" onclick="nextPage()">下一页</a>
			</li>

		</ul>
	</div>
	<%--分页 end--%>


	<script >
        function lastPage(){
            <%--alert(${findBookCondition.selectCategory})--%>
            <%--alert("${findBookCondition.selectCategory }");--%>
            var json = {
                selectCategory: "${findBookCondition.selectCategory}",
                selectAppearance: "${findBookCondition.selectAppearance}",
                selectPrice: "${findBookCondition.selectPrice}"
            }

            $.ajax({
                url:"/consumer/searchbook.do?page="+${bookInfo.pageNum-1},
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(json),
                dataType:"html",
                type:"post",
                success:function (data) {
                    // alert(data)
                    $('#mydiv').html(data);
                }
            });
        }


        function changePage(n){
            <%--alert(${findBookCondition.selectCategory})--%>
            <%--alert("${findBookCondition.selectCategory }");--%>
            var json = {
                selectCategory: "${findBookCondition.selectCategory}",
                selectAppearance: "${findBookCondition.selectAppearance}",
                selectPrice: "${findBookCondition.selectPrice}"
            }

            $.ajax({
                url:"/consumer/searchbook.do?page="+n,
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(json),
                dataType:"html",
                type:"post",
                success:function (data) {
                    // alert(data)
                    $('#mydiv').html(data);
                }
            });
        }


        function nextPage(){
            <%--alert(${findBookCondition.selectCategory})--%>
            <%--alert("${findBookCondition.selectCategory }");--%>
            var json = {
                selectCategory: "${findBookCondition.selectCategory}",
                selectAppearance: "${findBookCondition.selectAppearance}",
                selectPrice: "${findBookCondition.selectPrice}"
            }

            $.ajax({
                url:"/consumer/searchbook.do?page="+${bookInfo.pageNum+1},
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(json),
                dataType:"html",
                type:"post",
                success:function (data) {
                    // alert(data)
                    $('#mydiv').html(data);
                }
            });
        }

	</script>

</div>


</body>
</html>