$(document).ready(function(){

    function search(){
        var selectA = $("#selectA a").text();
        var selectB = $("#selectB a").text();
        var selectC = $("#selectC a").text();
        var searchContent = $("#searchContent").val();

        var allData = {
            selectCategory:selectA,
            selectAppearance:selectB,
            selectPrice:selectC,
            searchContent:searchContent
        };
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
    }


    $("#selectCategory dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectA").remove();
        } else {
            var copyThisA = $(this).clone();
            if ($("#selectA").length > 0) {
                $("#selectA a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisA.attr("id", "selectA"));
            }
        }

        search();
    });

    $("#selectAppearance dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectB").remove();
        } else {
            var copyThisB = $(this).clone();
            if ($("#selectB").length > 0) {
                $("#selectB a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisB.attr("id", "selectB"));
            }
        }

        search();
    });

    $("#selectPrice dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectC").remove();
        } else {
            var copyThisC = $(this).clone();
            if ($("#selectC").length > 0) {
                $("#selectC a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisC.attr("id", "selectC"));
            }
        }

        search();
    });

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

    $("#selectA").live("click", function () {
        $(this).remove();
        $("#selectCategory .select-all").addClass("selected").siblings().removeClass("selected");


        //点击 x 按钮，去掉筛选时，重新发送一个ajax请求
        search();
    });

    $("#selectB").live("click", function () {
        $(this).remove();
        $("#selectAppearance .select-all").addClass("selected").siblings().removeClass("selected");

        search();
    });

    $("#selectC").live("click", function () {
        $(this).remove();
        $("#selectPrice .select-all").addClass("selected").siblings().removeClass("selected");

        search();
    });

    $(".select dd").live("click", function () {
        if ($(".select-result dd").length > 1) {
            $(".select-no").hide();
        } else {
            $(".select-no").show();
        }
    });

});