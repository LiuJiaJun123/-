<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%--
  User: Liu Jiajun
  Date: 2020/2/10
  Time: 23:31
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="../../css/consumer/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
    <%--<script type="text/javascript" src="/js/xiangqing/jquery-1.12.0.min.js"></script>--%>

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
                            askbook_name : {
                                message : '请输入求购书籍名称',
                                validators : {
                                    notEmpty : {
                                        message : '求购书籍名称不能为空'
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
                    <li><a href="${pageContext.request.contextPath}/consumer/mySell.do" >我发布的商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myAsk.do" style="color:#ff6700;font-weight:bold;">我的求购</a></li>
                    <li><a href="${pageContext.request.contextPath}/consumer/myCollection.do">我的收藏</a></li>
                    <li><a href="">消息通知</a></li>
                    <li><a href="">修改密码</a></li>
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
                        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/askbook/update.do" id="saveForm"
                              method="post" enctype="multipart/form-data" style="padding-left: 20px">

                            <div class="form-group row">
                                <input type="hidden" class="form-control" name="askbook_id" id="askbook_id">

                                <input type="hidden" class="form-control" name="status" value="1" id="status">

                                <label  class="must" ></label>
                                <label for="askbook_name" class="col-sm-3 control-label">求购书籍名</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="askbook_name" name="askbook_name" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="author" class="col-sm-3 control-label">书籍作者</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="author" name="author" placeholder="请输入求购书籍作者">
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

            <div class="ddzxbt">我的求购</div>
            <c:forEach items="${askbookInfo.list}" var="askbook">
                <div class="ddxq">
                    <div class="ddspt fl"><img style="width: 80px;height: 80px;" src="${askbook.imgUrl}" alt=""></div>
                    <div class="ddbh fl">《 ${askbook.askbook_name} 》</div>
                    <li class="ztxx fr">
                        <ul>
                            <li>${askbook.categoryInfo.category_name}</li>
                            <li style="width: 200px"><fmt:formatDate value='${askbook.time}' pattern='yyyy-MM-dd HH:mm'/></li>
                            <li><a id="update_info" href="" data-toggle="modal" onclick="updateInfo(${askbook.askbook_id})">编辑</a></li>
                            <li><a href="">下架</a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                    <div class="clear"></div>
            </c:forEach>


            <div class="page_total_class">
                总共${askbookInfo.pages} 页，共${askbookInfo.total} 条数据。
            </div>


            <%--分页 start--%>
            <div class="page_class">
                <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/consumer/myAsk.do?page=${askbookInfo.pageNum-1}">上一页</a>
                </li>

                <c:forEach begin="1" end="${askbookInfo.pages}" var="i">
                    <c:if test="${i==askbookInfo.pageNum}">
                        <li class="page-item active">
                            <a class="page-link" href="${pageContext.request.contextPath}/consumer/myAsk.do?page=${i}">${i}</a>
                        </li>
                    </c:if>
                    <c:if test="${i!=askbookInfo.pageNum}">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/consumer/myAsk.do?page=${i}">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/consumer/myAsk.do?page=${askbookInfo.pageNum+1}">下一页</a>
                </li>
            </ul>
            </div>
            <%--分页 end--%>

            </div>

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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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

    function updateInfo(askbook_id){
        $.ajax({
            url:"${pageContext.request.contextPath}/consumer/ask-edit.do?askbook_id="+askbook_id,
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            async: false,  //把异步处理设置 为false；即可给方法外部赋值
            type:"post",
            success:function (data) {
                $("#askbook_id").val(data.askbook_id);
                $("#askbook_name").val(data.askbook_name);
                $("#author").val(data.author);
                $("#pic").attr("src", data.imgUrl);
                $("#category_id").find("option[value="+data.categoryInfo.category_id+"]").prop("selected",true);
                $("#appearance").find("option[value="+data.appearance+"]").prop("selected",true);
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

