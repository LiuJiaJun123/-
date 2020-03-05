<%--
  User: Liu Jiajun
  Date: 2020/1/30
  Time: 18:09
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>ZQU BOOK</title>

    <link rel="stylesheet" type="text/css" href="/css/consumer/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >

</head>
<body>
<!-- 导航栏 start-->
<jsp:include page="header.jsp"></jsp:include>
<!-- 导航栏 end/-->

<div class="bd-example mb-4">
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="banner banner1" style="background: url('../img/海报1.png');background-size: cover"></div>
                <div class="carousel-caption d-none d-md-block">
                    <%--<h5>蜘蛛侠</h5>--%>
                    <%--<p>蜘蛛侠（Spider-Man）是美国漫威漫画旗下的超级英雄，由编剧斯坦·李和画家史蒂夫·迪特科联合创造，初次登场于《惊奇幻想》（Amazing Fantasy）第15期（1962年8月），因为广受欢迎，几个月后，便开始拥有以自己为主角的单行本漫画。</p>--%>
                </div>
            </div>
            <div class="carousel-item">
                <div class="banner banner2" style="background: url('../img/海报2.png');background-size: cover"></div>
                <div class="carousel-caption d-none d-md-block">
                    <%--<h5>绿巨人</h5>--%>
                    <%--<p>浩克（Hulk）是美国漫威漫画旗下的超级英雄，初次登场于《不可思议的浩克》（The Incredible Hulk）第一期（1962年5月），由斯坦·李和杰克·科比联合创造。</p>--%>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>



<div class="danpin center">

    <div class="biaoti center">新书上架</div>
    <div class="main center">

        <c:forEach items="${newBookList}" var="newBook">
            <div class="mingxing fl">
                <div class="sub_mingxing"><a href=""><img src="../${newBook.imgUrl}" alt=""></a></div>
                <div class="pinpai"><a href="">${newBook.book_name}</a></div>
                <c:if test="${empty newBook.description}">
                    <div class="youhui">暂无描述</div>
                </c:if>
                <c:if test="${not empty newBook.description}">
                    <div class="youhui">${newBook.description}</div>
                </c:if>
                <div class="jiage">${newBook.price}元</div>
            </div>
        </c:forEach>
        <div class="clear"></div>
    </div>
</div>

<div class="danpin center" style="margin:50px auto;">
    <div class="biaoti center">超低价格</div>
    <div class="main center">
        <c:forEach items="${cheapBookList}" var="cheapBook">
            <div class="mingxing fl">
                <div class="sub_mingxing"><a href=""><img src="../${cheapBook.imgUrl}" alt=""></a></div>
                <div class="pinpai"><a href="">${cheapBook.book_name}</a></div>
                <c:if test="${empty cheapBook.description}">
                    <div class="youhui">暂无描述</div>
                </c:if>
                <c:if test="${not empty cheapBook.description}">
                    <div class="youhui">${cheapBook.description}</div>
                </c:if>
                <div class="jiage">${cheapBook.price}元</div>
            </div>
        </c:forEach>
        <div class="clear"></div>
    </div>
</div>


<div class="peijian w">
    <div class="biaoti center">精品推荐</div>
    <div class="main center">
        <div class="content">
            <div class="remen fl"><a href=""><img src="/image/peijian1.jpg"></a>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span>新品</span></div>
                <div class="tu"><a href=""><img src="/image/peijian2.jpg"></a></div>
                <div class="miaoshu"><a href="">小米6 硅胶保护套</a></div>
                <div class="jiage">49元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配小米6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="/image/peijian3.jpg"></a></div>
                <div class="miaoshu"><a href="">小米手机4c 小米4c 智能</a></div>
                <div class="jiage">29元</div>
                <div class="pingjia">372人评价</div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:red">享6折</span></div>
                <div class="tu"><a href=""><img src="/image/peijian4.jpg"></a></div>
                <div class="miaoshu"><a href="">红米NOTE 4X 红米note4X</a></div>
                <div class="jiage">19元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配小米6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="/image/peijian5.jpg"></a></div>
                <div class="miaoshu"><a href="">小米支架式自拍杆</a></div>
                <div class="jiage">89元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配小米6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="content">
            <div class="remen fl"><a href=""><img src="/image/peijian6.png"></a>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="/image/peijian7.jpg"></a></div>
                <div class="miaoshu"><a href="">小米指环支架</a></div>
                <div class="jiage">19元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配小米6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="/image/peijian8.jpg"></a></div>
                <div class="miaoshu"><a href="">米家随身风扇</a></div>
                <div class="jiage">19.9元</div>
                <div class="pingjia">372人评价</div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="/image/peijian9.jpg"></a></div>
                <div class="miaoshu"><a href="">红米4X 高透软胶保护套</a></div>
                <div class="jiage">59元</div>
                <div class="pingjia">775人评价</div>
            </div>
            <div class="remenlast fr">
                <div class="hongmi"><a href=""><img src="/image/hongmin4.png" alt=""></a></div>
                <div class="liulangengduo"><a href=""><img src="/image/liulangengduo.png" alt=""></a></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>






<footer class="mt20 center">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
