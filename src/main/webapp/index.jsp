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
        <div class="col-md-6">
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
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">网站公告</div>
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">在你所在的专业，有哪些核心期刊？
                        <small class="pull-right">2015/08/08</small>
                    </a></li>
                    <li class="list-group-item"><a href="#">在你所在的专业，有哪些核心期刊？
                        <small class="pull-right">2015/08/08</small>
                    </a></li>
                    <li class="list-group-item"><a href="#">在你所在的专业，有哪些核心期刊？
                        <small class="pull-right">2015/08/08</small>
                    </a></li>
                    <li class="list-group-item"><a href="#">在你所在的专业，有哪些核心期刊？
                        <small class="pull-right">2015/08/08</small>
                    </a></li>
                    <li class="list-group-item"><a href="#">在你所在的专业，有哪些核心期刊？
                        <small class="pull-right">2015/08/08</small>
                    </a></li>
                    <li class="list-group-item"><a href="#">在你所在的专业，有哪些核心期刊？
                        <small class="pull-right">2015/08/08</small>
                    </a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<script src="lib/jquery.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script src="lib/Chart.js"></script>
<script src="js/script.js"></script>
</body>
</html>
