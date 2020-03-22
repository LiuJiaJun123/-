$(document).ready(function(){

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



        var selectA = $("#selectA a").text();
        var selectB = $("#selectB a").text();
        var selectC = $("#selectC a").text();

        var allData = {
            selectCategory:selectA,
            selectAppearance:selectB,
            selectPrice:selectC
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

        var selectA = $("#selectA a").text();
        var selectB = $("#selectB a").text();
        var selectC = $("#selectC a").text();

        var allData = {
            selectCategory:selectA,
            selectAppearance:selectB,
            selectPrice:selectC
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

        var selectA = $("#selectA a").text();
        var selectB = $("#selectB a").text();
        var selectC = $("#selectC a").text();

        var allData = {
            selectCategory:selectA,
            selectAppearance:selectB,
            selectPrice:selectC
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
    });

    $("#selectA").live("click", function () {
        $(this).remove();
        $("#selectCategory .select-all").addClass("selected").siblings().removeClass("selected");
        
    });

    $("#selectB").live("click", function () {
        $(this).remove();
        $("#selectAppearance .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $("#selectC").live("click", function () {
        $(this).remove();
        $("#selectPrice .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $(".select dd").live("click", function () {
        if ($(".select-result dd").length > 1) {
            $(".select-no").hide();
        } else {
            $(".select-no").show();
        }
    });

});