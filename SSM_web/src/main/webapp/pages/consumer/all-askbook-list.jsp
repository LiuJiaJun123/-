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


</head>
<body>

<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->


<div>

        <div class="askbook_list">
            <c:forEach items="${askBookInfo.list}" var="askbook">
                <a target="_blank" href="${pageContext.request.contextPath}/consumer/askbook-xq.do?askbook_id=${askbook.askbook_id}" style="text-decoration:none;">
                <div class="goods" onmousemove="this.style.backgroundColor='#E6E6E6'" onmouseout="this.style.backgroundColor='#FFF'">
                    <img src="${askbook.imgUrl}" class="goodsImage"/>
                    <div class="goodsContent">
                        <span class="goodsTitle">${askbook.askbook_name}</span>
                        <span class="goodsDesc">描述：${askbook.description}</span>
                        <span class="goodsTime"><fmt:formatDate value='${askbook.time}' pattern='yyyy-MM-dd HH:mm'/></span>
                    </div>
                </div>
                </a>
            </c:forEach>
        </div>

        <style>
            .askbook_list{
                margin-top: 30px;
            }
            .goods{
                height: 150px;
                padding: 5px;
                display: flex;
                width: 70%;
                margin:0  auto;
                border-bottom: 1px solid #e4e4e4;
            }
            .goodsImage{
                width: 100px;
                height: 100px;
                margin: 19px 20px 15px;
                border-radius: 3px;
            }
            .goodsContent{
                display: inline-block;
                height: 120px;
                width: 100%;
                /*border: 1px solid red;*/
                position: relative;
                padding-top: 15px;
                padding-left: 5px;
            }
            .goodsTitle{
                width: 100%;
                padding-top: 5px;
                font-size: 18px;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
            }
            .goodsDesc{
                width: 100%;
                padding-top: 5px;
                color: #6F6F6F;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
            }
            .goodsTime{
                color: #919191;
                position: absolute;
                bottom: 2px;
                right: 8px;
                font-size: 13px;
            }
        </style>

	<hr style="width: 65%;margin: 0 auto; ">

	<div class="page_total_class1">
		总共${askBookInfo.pages} 页，共${askBookInfo.total} 条数据。
	</div>

	<%--分页 start--%>
	<div class="page_class1">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/consumer/allaskbook.do?page=${askBookInfo.pageNum-1}">上一页</a>
			</li>

            <!-- 分页 -->
            <!--总页数没有10页-->
            <c:choose>
                <c:when test="${askBookInfo.pages <= 10}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${askBookInfo.pages}"/>
                </c:when>
                <%--页数超过了10页--%>
                <c:otherwise>
                    <c:set var="begin" value="${askBookInfo.pageNum - 5}"/>
                    <c:set var="end" value="${askBookInfo.pageNum + 4}"/>
                    <%--如果begin等于0,设置起始页为1,最大页为10--%>
                    <c:if test="${begin  <= 0}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="10"/>
                    </c:if>
                    <%--如果end超过最大页,设置起始页=最大页-9--%>
                    <c:if test="${end > askBookInfo.pages}">
                        <c:set var="begin" value="${askBookInfo.pages - 9}"/>
                        <c:set var="end" value="${askBookInfo.pages}"/>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <!-- 分页 /-->

            <%--遍历--%>
            <c:forEach begin="${begin}" end="${end}" var="i">
                <c:if test="${i==askBookInfo.pageNum}">
                    <li class="page-item active">
                        <a class="page-link" href="${pageContext.request.contextPath}/consumer/allaskbook.do?page=${i}">${i}</a>
                    </li>
                </c:if>
                <c:if test="${i!=askBookInfo.pageNum}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/consumer/allaskbook.do?page=${i}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>

			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/consumer/allaskbook.do?page=${askBookInfo.pageNum+1}">下一页</a>
			</li>

		</ul>
	</div>
	<%--分页 end--%>

</div>


</body>
</html>