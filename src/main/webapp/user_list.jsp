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
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>后台首页</a></li>
                <li class="active"><a href="user_list.jsp"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>
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
                <li><a href="index.jsp"><span class="glyphicon glyphicon-off"></span>退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--/导航-->

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="user_list.jsp" class="list-group-item active">用户管理</a>
                <a href="user_search.jsp" class="list-group-item">用户搜索</a>
                <a href="" role="button" class="list-group-item" data-toggle="modal" data-target="#myModal">添加用户</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>添加内容</h1>
            </div>
            <ul class="nav nav-tabs">
                <li class="active"><a href="user_list.jsp">用户列表</a></li>
                <li><a href="user_search.jsp">用户搜索</a></li>
                <li><a href="" role="button" data-toggle="modal" data-target="#myModal">添加用户</a></li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>1</th>
                    <td>admin</td>
                    <td>admin@hhu.edu.cn</td>
                    <td>
                        <div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-primary" data-toggle="dropdown" href="#"
                                    role="button"
                                    aria-haspopup="true" aria-expanded="false">
                                操作
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">编辑</a></li>
                                <li><a href="#">删除</a></li>
                                <li><a href="#">锁定</a></li>
                                <li><a href="#">修改密码</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <nav aria-label="Page navigation" class="pull-right">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form action="#">
                    <div class="form-group">
                        <label for="addname">用户名</label>
                        <input id="addname" type="text" class="form-control" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input id="password" type="password" class="form-control" placeholder="请输入密码">
                    </div>
                    <div class="form-group">
                        <label for="password1">确认密码</label>
                        <input id="password1" type="password" class="form-control" placeholder="请输入确认密码">
                    </div>
                    <div class="form-group">
                        <label for="addemail">求输入用户邮箱</label>
                        <input id="addemail" type="email" class="form-control" placeholder="求输入用户邮箱">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script src="lib/jquery.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>