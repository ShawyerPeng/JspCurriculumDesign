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
<!--导航-->
<nav class="nav navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.jsp" class="navbar-brand">Admin</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>后台首页</a></li>
                <li><a href="user_list.jsp"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>
                <li><a href="content.jsp"><span class="glyphicon glyphicon-list-alt"></span>公告管理</a></li>
                <%--<li><a href="tag.jsp"><span class="glyphicon glyphicon-tag"></span>标签管理</a></li>--%>
                <li class="active"><a href="form.jsp"><span class="glyphicon glyphicon-hand-right"></span>教室申请</a></li>
                <li><a href="classroom_info.jsp"><span class="glyphicon glyphicon-info-sign"></span>教室信息</a></li>
                <li><a href="classroom_status.jsp"><span class="glyphicon glyphicon-exclamation-sign"></span>教室状态</a></li>
                <li><a href="application_history.jsp"><span class="glyphicon glyphicon-bookmark"></span>申请历史</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        admin
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="#" class=""><span class="glyphicon glyphicon-home"></span>前台首页</a></li>
                        <li><a href="#" class=""><span class="glyphicon glyphicon-user"></span>个人主页</a></li>
                        <li><a href="#" class=""><span class="glyphicon glyphicon-cog"></span>个人设置</a></li>
                        <li><a href="#" class=""><span class="glyphicon glyphicon-credit-card"></span>账户中心</a></li>
                        <li><a href="#" class=""><span class="glyphicon glyphicon-heart"></span>我的收藏</a></li>
                    </ul>
                </li>
                <li><a href="index.html"><span class="glyphicon glyphicon-off"></span>退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
<div class="bs-example container">
    <button data-target=" /export">借用教室审批表</button>
    <h1 style="margin-left: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;河海大学教室申请表</h1><br>
    <form class="form-horizontal myform" action="/apply" method="post">
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
        <br>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" class="btn btn-primary" value="提交">
                <input type="reset" class="btn btn-default" value="重置">
            </div>
        </div>
    </form>
</div>
</div>
</body>

<script>
    function submitForm(){
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
