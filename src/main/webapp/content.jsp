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
                <li><a href="user_list.jsp"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>
                <li class="active"><a href="content.jsp"><span class="glyphicon glyphicon-list-alt"></span>公告管理</a></li>
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
                        <li><a href="#" class=""><span class="glyphicon glyphicon-home"></span>首页</a></li>
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
                <a href="content.jsp" class="list-group-item active">公告管理</a>
                <a href="content_post.jsp" class="list-group-item">公告内容</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>公告管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li class="active"><a href="content.jsp">公告管理</a></li>
                <li><a href="content_post.jsp">添加公告</a></li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th>文章标题</th>
                    <th>作者</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>产品经理常犯的7大错误，你造吗？</th>
                    <td>杨泽</td>
                    <td>2017/02/15</td>
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
                                <li><a href="#">全局置顶</a></li>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
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
                    <div class="form-group">
                        <label for="addgroup">确认密码</label>
                        <select name="" id="addgroup" class="form-control">
                            <option value="">限制会员</option>
                            <option value="">新手上路</option>
                            <option value="">注册会员</option>
                            <option value="">中级会员</option>
                            <option value="">高级会员</option>
                        </select>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
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
