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
    <title>个人中心</title>
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
                            book_name : {
                                message : '请输入书籍名称',
                                validators : {
                                    notEmpty : {
                                        message : '书籍名称不能为空'
                                    }
                                }
                            },
                            price : {
                                message : '请输入大于0的价格',
                                validators : {
                                    notEmpty : {
                                        message : '价格不能为空'
                                    },
                                    greaterThan: {
                                        value : 0.0,
                                        message : '价格不能低于0'
                                    }
                                }
                            },
                        }
                    });
        });
    </script>
    <style>
        .form-horizontal .form-group .col-sm-8 .help-block{
            /*position: absolute;*/
            /*left: 50%;*/
            /*bottom: 25%;*/
            font-size: 16px;
            color: red;
        }
    </style>

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
                    <li><a href="${pageContext.request.contextPath}/consumer/mySell.do" style="color:#ff6700;font-weight:bold;">我发布的商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myAsk.do">我的求购</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myCollection.do">我的收藏</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/opinion.do">意见反馈</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/updatePersonalData.do">修改个人资料</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/updatePwd.do">修改密码</a></li>
                </ul>
            </div>
        </div>


        <!-- 模态框（Modal）start-->
        <div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/book/update.do" id="saveForm"
                              method="post" enctype="multipart/form-data" style="padding-left: 20px">

                            <div class="form-group row">
                                <input type="hidden" class="form-control" name="book_id" id="book_id">

                                <input type="hidden" class="form-control" name="status" value="1" id="status">

                                <label  class="must" ></label>
                                <label for="book_name" class="col-sm-3 control-label">书籍名称</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="book_name" name="book_name" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="author" class="col-sm-3 control-label">书籍作者</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="author" name="author" placeholder="请输入书籍作者">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="uploadImg" class="col-sm-3 control-label">图片</label>
                                <div class="col-sm-8">
                                    <img src="" width="60" height="60" id="pic">
                                    <input type="file" class="form-control" id="uploadImg"
                                           ONCHANGE="setImg(this);" name="uploadImg" placeholder="图片">
                                </div>
                            </div>

                            <div class="form-group help row">
                                <label for="category_id" class="col-sm-3 control-label">书籍类别</label>
                                <div class="col-sm-8" >
                                    <select class="form-control" name="categoryInfo.category_id" id="category_id">

                                        <option value="101">成功励志</option>
                                        <option value="102">法律</option>
                                        <option value="103">工具书</option>
                                        <option value="104">管理</option>
                                        <option value="105">计算机与网络</option>
                                        <option value="106">教育考试</option>
                                        <option value="107">科技工程</option>
                                        <option value="108">生活时尚考试</option>
                                        <option value="112">政治军事</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group help row">
                                <label for="appearance" class="col-sm-3 control-label">书籍成色</label>
                                <div class="col-sm-8" >
                                    <select class="form-control" name="appearance" id="appearance">
                                        <option value="无说明">请选择</option>
                                        <option value="9成新">9成新</option>
                                        <option value="8成新">8成新</option>
                                        <option value="7成新">7成新</option>
                                        <option value="6成新">6成新</option>
                                        <option value="5成新">5成新</option>
                                        <option value="4成新">4成新</option>
                                        <option value="3成新">3成新</option>
                                        <option value="2成新">2成新</option>
                                        <option value="1成新">1成新</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label  class="must" style="padding-top: 10px"></label>
                                <label for="price" class="col-sm-3 control-label">出售价格</label>
                                <div class="col-sm-8">
                                    <input type="number"  min="0.0" step="0.00001" class="form-control" id="price" name="price" placeholder="请输入出售价格">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="description" class="col-sm-3 control-label">描述</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" rows="3" placeholder="说些什么吧..."
                                              id="description"   name="description"></textarea>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary"  >保存</button>
                            </div>
                        </form>

                    </div>
                    <%--<div class="modal-footer">--%>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                    <%--<button type="button" class="btn btn-primary" id="saveUpdate" >保存</button>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
        <%--模态框 end--%>


        <div class="rtcont fr">

            <div class="ddzxbt">我发布的商品</div>
            <c:forEach items="${bookInfo.list}" var="book">
                <div class="ddxq">
                    <div class="ddspt fl"><img style="width: 80px;height: 80px;" src="${book.imgUrl}" alt=""></div>
                    <div class="ddbh fl">《 ${book.book_name} 》</div>
                    <li class="ztxx fr">
                        <ul>
                            <%--<li>${book.categoryInfo.category_name}</li>--%>
                            <li>￥${book.price}</li>
                            <li style="width: 200px"><fmt:formatDate value='${book.time}' pattern='yyyy-MM-dd HH:mm'/></li>
                            <li><a id="update_info" href="" data-toggle="modal" onclick="updateInfo(${book.book_id})">编辑</a></li>
                            <li><a  href="${pageContext.request.contextPath}/book/soldOut.do?book_id=${book.book_id}"
                                   onClick="return confirm('您确定要下架该书籍吗?');">下架</a></li>

                            <div class="clear"></div>
                        </ul>
                    </div>
                    <div class="clear"></div>
            </c:forEach>

            <div class="page_total_class">
                总共${bookInfo.pages} 页，共${bookInfo.total} 条数据。
            </div>


            <%--分页 start--%>
            <div class="page_class">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${bookInfo.pageNum-1}">上一页</a>
                    </li>

                    <c:forEach begin="1" end="${bookInfo.pages}" var="i">
                        <c:if test="${i==bookInfo.pageNum}">
                            <li class="page-item active">
                                <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${i}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${i!=bookInfo.pageNum}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/consumer/mySell.do?page=${bookInfo.pageNum+1}">下一页</a>
                    </li>
                </ul>
            </div>
            <%--分页 end--%>

        </div>

    </div>

    <div class="clear"></div>

</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


<script >

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

    //修改信息 模态框 信息填充
    function updateInfo(book_id){
        $.ajax({
            url:"${pageContext.request.contextPath}/consumer/sell-edit.do?book_id="+book_id,
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            async: false,  //把异步处理设置 为false；即可给方法外部赋值
            type:"post",
            success:function (data) {
                $("#book_id").val(data.book_id);
                $("#book_name").val(data.book_name);
                $("#author").val(data.author);
                $("#pic").attr("src", data.imgUrl);
                $("#category_id").find("option[value="+data.categoryInfo.category_id+"]").prop("selected",true);
                $("#appearance").find("option[value="+data.appearance+"]").prop("selected",true);
                $("#price").val(data.price);
                $("#description").val(data.description);
                $("#update_modal").modal({
                    backdrop: 'static'
                })
            }
        });
    }


</script>

</body>
</html>

