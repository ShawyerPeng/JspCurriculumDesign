<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="lib/bootstrap/css/darkly.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<style>
    .form-control-feedback {
        display: none;
    }
    .has-feedback.has-success .feedback-success,
    .has-feedback.has-error .feedback-error {
        display: block;
    }
    .form-group > label + .help-block {
        margin-top: -5px;
        margin-bottom: 5px;
    }
</style>
<body>
<div class="bs-example container">
    <!--<label for="field2B">+ validation error</label>-->
    <!--<span class="help-block">Lorem ipsum dolor sit amet.</span>-->
    <!--<div class="form-control-wrapper has-feedback has-error">-->
    <!--<input type="text" class="form-control" id="field2B">-->
    <!--<span class="fa fa-check form-control-feedback feedback-success" aria-hidden="true"></span>-->
    <!--</div>-->
    <h1 style="margin-left: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;河海大学教室申请表</h1><br>
    <form class="form-horizontal myform" action="/search" method="post">
        <div class="form-group">
            <label class="control-label col-xs-3" for="name">申请人姓名:</label>
            <div class="col-xs-3">
                <input type="text" class="form-control" id="name" name="name" placeholder="申请人姓名">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="number">申请人学号:</label>
            <div class="col-xs-3">
                <input type="text" class="form-control" id="number" name="number" placeholder="申请人学号">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="organization">所属组织:</label>
            <div class="col-xs-3">
                <input class="form-control" id="organization" name="organization" placeholder="所属组织" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3">使用日期:</label>
            <div class="col-xs-3">
                <input type="date" class="form-control" id="dateofuse" name="dateofuse" placeholder="使用日期">
            </div>
        </div>
        <!--<div class="form-group">-->
        <!--<label class="control-label col-xs-3">使用时间:</label>-->
        <!--<div class="col-xs-3">-->
        <!--<label class="checkbox inline">-->
        <!--<input type="checkbox" id="inlineCheckbox1" value="option1"> 1-->
        <!--</label>-->
        <!--<label class="checkbox inline">-->
        <!--<input type="checkbox" id="inlineCheckbox2" value="option2"> 2-->
        <!--</label>-->
        <!--<label class="checkbox inline">-->
        <!--<input type="checkbox" id="inlineCheckbox3" value="option3"> 3-->
        <!--</label>-->
        <!--</div>-->
        <!--</div>-->
        <%--<div class="form-group">--%>
            <%--<label class="control-label col-xs-3">使用时间:</label>--%>
            <%--<div>--%>
                <%--<div class="col-xs-1">--%>
                    <%--<span style="line-height: 2.6">第</span>--%>
                <%--</div>--%>
                <%--<div class="col-xs-1">--%>
                    <%--<select class="form-control">--%>
                        <%--<option>1</option>--%>
                        <%--<option>2</option>--%>
                        <%--<option>3</option>--%>
                        <%--<option>4</option>--%>
                        <%--<option>5</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <%--<div class="col-xs-1">--%>
                    <%--<span style="line-height: 2.6">-</span>--%>
                <%--</div>--%>
                <%--<div class="col-xs-1">--%>
                    <%--<select class="form-control">--%>
                        <%--<option>1</option>--%>
                        <%--<option>2</option>--%>
                        <%--<option>3</option>--%>
                        <%--<option>4</option>--%>
                        <%--<option>5</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <%--<div  class="col-xs-1">--%>
                    <%--<span style="line-height: 2.6">大节</span>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="form-group">
            <label class="control-label col-xs-3">使用时间:</label>
            <div class="col-xs-3">
                <select id="timeofuse" name="timeofuse" class="form-control">
                    <option>第一大节</option>
                    <option>第二大节</option>
                    <option>第三大节</option>
                    <option>第四大节</option>
                    <option>第五大节</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="building" class="col-sm-3 control-label">教室位置:</label>
            <div class="col-sm-3">
                <select id="building" name="building" class="form-control">
                    <option>致高楼A</option>
                    <option>致高楼B</option>
                    <option>致用楼</option>
                    <option>博学楼</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="size" class="col-sm-3 control-label">教室规模:</label>
            <div class="col-sm-3">
                <select id="size" name="size" class="form-control">
                    <option>大</option>
                    <option>中</option>
                    <option>小</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3">需要多媒体:</label>
            <div class="col-xs-1">
                <label class="radio-inline">
                    <input type="radio" name="needmedia" value="是" checked="checked"> 是
                </label>
            </div>
            <div class="col-xs-1">
                <label class="radio-inline">
                    <input type="radio" name="needmedia" value="否"> 否
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="available" class="col-sm-3 control-label">可用教室:</label>
            <div class="col-sm-3">
                <select id="available" name="available" onclick="search()" class="form-control">
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="reason">申请理由:</label>
            <div class="col-xs-6">
                <textarea rows="3" class="form-control" id="reason" name="reason" placeholder="申请理由"></textarea>
            </div>
        </div>
        <!--<div class="form-group">-->
        <!--<div class="col-xs-offset-3 col-xs-9">-->
        <!--<label class="checkbox-inline">-->
        <!--<input type="checkbox" value="news"> Send me latest news and updates.-->
        <!--</label>-->
        <!--</div>-->
        <!--</div>-->
        <br>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" class="btn btn-primary" value="提交">
                <input type="reset" class="btn btn-default" value="重置">
            </div>
        </div>
    </form>
</div>
</body>

<script>
//    function submitForm (){
//        firstName = $("#firstName").val();
//        lastName = $("#lastName").val();
//        inputEmail = $("#inputEmail").val();
//        phoneNumber = $("#phoneNumber").val();
//        dateofbirth = $("#dateofbirth").val();
//        postalAddress = $("#postalAddress").val();
//        Postcode = $("#Postcode").val();
//
//        $('.myform').hide();
//
//        $('.container').html('<p>' + firstName + '</p>' + '<p>' + lastName + '</p>' + '<p>' + inputEmail + '</p>' + '<p>' + phoneNumber + '</p>' + '<p>' + dateofbirth + '</p>' + '<p>' + postalAddress + '</p>' + '<p>' + Postcode + '</p>');
//    }
//
//    $('.myform').formValidation(function(){
//
//    });

    function search() {
        var user = {
            dateofuse: $("#dateofuse").val(),
            timeofuse: $("#timeofuse").val(),
            building: $("#building").val(),
            needmedia: $("#needmedia").val(),
            size: $("#size").val()
        };

        console.log(JSON.stringify(user));

        $.ajax({
            url: '/ajaxSearch',
            type: 'POST',
            data: user,
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            success: function (returndata) {
                for(var i=0; i<(Object.keys(returndata)).length; i++) {
                    console.log(returndata[i].building);
                    $("#available option").remove();
                    $("#available").append("<option>" + returndata[i].building + returndata[i].room_name + "</option>");
                }
            },
            error: function (returndata) {
                console.log(returndata);
            }
        });
    }
</script>
</html>
