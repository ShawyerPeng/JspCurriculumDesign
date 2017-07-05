<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/x-editable/1.5.1/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/extensions/filter-control/bootstrap-table-filter-control.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/extensions/filter/bootstrap-table-filter.min.js"></script>
</head>
<body>
<div id="productToolBar">
    <form class="form-inline" id="queryProductTemplateForm">
        <button type="button" id="addProductTemplateBtn" class="btn btn-success btn-sm">
            <i class='ace-icon fa fa-plus bigger-120'></i>新增
        </button>
        <button type="button" id="editProductTemplateBtn" class="btn btn-primary btn-sm">
            <i class='ace-icon fa fa-edit bigger-120'></i>修改
        </button>
        <button type="button" id="delProductTemplateBtn" class="btn btn-danger btn-sm">
            <i class='ace-icon fa fa-trash-o bigger-120'></i>删除
        </button>
        <input type="hidden" name="ISDEL" value="0">
    </form>
</div>
<table class="table-hover" id="productTable">
</table>

</body>
<script>
    $('#productTable').bootstrapTable({
        classes:'table table-no-bordered',
        toolbar:'#productToolBar',
        striped: false,
        clickToSelect: true, //点击行就选中
        silent: true,
        showPaginationSwitch: false,
        showToggle: false,
        showColumns: true,  //显示隐藏列
        showRefresh: true,  //显示刷新按钮
        singleSelect: true, //复选框只能选择一条记录
        url: '/user', //servlet地址
        queryParams: queryParams, //查询参数
        queryParamsType: 'limit', //类型
        locale:'zh-CN', //国际化
        pagination: true, //开启分页
        pageSize: 10,    //分页条数
        pageList: [10,20,50,100,200],
        search: true,
        idField: 'ID',
        columns:[
            {field:'username',title:'产品名称'},
            {field:'password',title:'公司名称'}
        ]
    });
    function queryParams(params) {
        return {
            NAME:params.search, //开启自带查询后输入的值
            ISDEL:0,
            pageSize: params.limit, //分页条数
            pageNumber: params.pageNumber //当前页数
        };
    } //在这里你可以自己定义查询的参数
</script>
</html>
