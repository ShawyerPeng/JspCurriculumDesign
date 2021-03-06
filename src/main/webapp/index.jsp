<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta HTTP-EQUIV="x-ua-compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/bootstrap/css/darkly.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<style>
    /*时间*/
    .time-title .year-month{ padding:10px; background-color:#09C; height:100%; color:#FFF;}
    .time-title .hour-minute{color:#09C; line-height:70px; background-color:#FFF; padding-left:10px; padding-right:10px;}
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
                <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>后台首页</a></li>
                <li><a href="user_list.jsp"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>
                <li><a href="content.jsp"><span class="glyphicon glyphicon-list-alt"></span>公告管理</a></li>
                <!--<li><a href="tag.jsp"><span class="glyphicon glyphicon-tag"></span>标签管理</a></li>-->
                <li><a href="form.jsp"><span class="glyphicon glyphicon-hand-right"></span>教室申请</a></li>
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
                <li><a href="/logout"><span class="glyphicon glyphicon-off"></span>退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<!--/导航-->
<div class="container">
    <div class="row">
        <div class="col-md-12" style="display: none">
            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">×</span>
                </button>
                <h4>网站程序有漏洞，急需修复！</h4>
                <p>当前版本程序(V1.22)存在严重安全问题，容易造成攻击，请即可修复！</p>
                <p>
                    <button type="button" class="btn btn-danger">立即修复</button>
                    <button type="button" class="btn btn-default" data-dismiss="alert">稍后处理</button>
                </p>
            </div>
        </div>
        <div class="col-md-6" style="display: none">
            <div class="panel panel-default">
                <div class="panel-heading">网站数据统计</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>统计项目</th>
                            <th>今日</th>
                            <th>昨日</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>注册会员</th>
                            <td>200</td>
                            <td>400</td>
                        </tr>
                        <tr>
                            <th>登陆会员</th>
                            <td>2222</td>
                            <td>400</td>
                        </tr>
                        <tr>
                            <th>今日发帖</th>
                            <td>200</td>
                            <td>400</td>
                        </tr>
                        <tr>
                            <th>推荐人数</th>
                            <td>200</td>
                            <td>400</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">网站公告</div>
                <ul class="list-group" id="list">
                </ul>
            </div>
        </div>
        <div class="time-title pull-right">
            <div class="year-month pull-left">
                <p id="xq"></p>
                <p><span id="year"></span>年<span id="month"></span>月<span id="day"></span>日</p>
                <p><strong id="hour"></strong><strong>:</strong><strong id="minute"></strong></p>
            </div>
        </div>
    </div>
</div>


<script src="lib/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script>
    var data;
    $(document).ready(function () {
        $.ajax({
            url: '/searchAnnouncement',
            type: 'GET',
            dataType: "json",
            success: function (returndata) {
                data = returndata;
                for(var i=0; i<(Object.keys(returndata)).length; i++) {
//                    $("#list").append('<li class="list-group-item"><a href="javascript:void(0)" onclick=\"getDetail(returndata[i].title)\">' + returndata[i].title +'<small class="pull-right">' + returndata[i].publishTime +'</small></a></li>')
                    $("#list").append('<li class="list-group-item" id="test" value="" data-content=""><a href="javascript:void(0)" onclick="getDetail()">' + returndata[i].title +'<small class="pull-right">' + returndata[i].publishTime +'</small></a></li>')
                }
            },
            error: function (returndata) {
                console.log(returndata);
            }
        });

        var date = new Date();
        var day_list = ['日', '一', '二', '三', '四', '五', '六'];
        $("#xq").html("星期" + day_list[date.getDay()]);
        $("#year").html(date.getFullYear());
        $("#month").html(date.getMonth()+1);
        $("#day").html(date.getDate());
        $("#hour").html(date.getHours()>9?date.getHours().toString():'0' + date.getHours());
        $("#minute").html(date.getMinutes()>9?date.getMinutes().toString():'0' + date.getMinutes());
        $("#time").html(date.getTime());
    });

//    function getDetail() {
//        var detail = $(".list-group-item").data('content');
//        $("#test").val(this.data[0].content);
//        console.log(detail);
//        $.confirm({
//            content: detail,
//            title: "Title"
//        });
//    }
</script>
</body>
</html>
