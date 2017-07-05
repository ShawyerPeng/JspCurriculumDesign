<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<div id="toolbar">
    <select class="form-control">
        <option value="">Export Basic</option>
        <option value="all">Export All</option>
        <option value="selected">Export Selected</option>
    </select>
</div>

<table id="table">
</table>
</div>
</body>
<script>
    function initTable() {
        //初始化表格,动态从服务器加载数据
        $('#table').bootstrapTable({
            method: "get",  //使用get请求到服务器获取数据
            url: "/user", //获取数据的Servlet地址
            toolbar:'#toolbar',
            striped: true,  //表格显示条纹
            clickToSelect: true, //点击行就选中
            silent: true,
            showPaginationSwitch: false,
            showToggle: false,
            showColumns: true,  //显示隐藏列
            showRefresh: true,  //显示刷新按钮
            showExport: true,
            singleSelect: true, //复选框只能选择一条记录
            locale:'zh-CN', //国际化
            pagination: true, //启动分页
            pageSize: 10,  //每页显示的记录数
            pageNumber:1, //当前第几页
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表
            search: true,  //是否启用查询
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
            //设置为limit可以获取limit, offset, search, sort, order
            queryParamsType : "undefined",
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    name:params.search, //开启自带查询后输入的值
                    pageNumber: params.pageNumber,
                    pageSize: params.pageSize
                };
                return param;
            },
            columns:[
                {field:'name',title:'申请人姓名'},
                {field:'number',title:'申请人学号'},
                {field:'organization',title:'所属组织'},
                {field:'apply_date',title:'申请时间'},
                {field:'room',title:'教室号'},
                {field:'date',title:'使用日期'},
                {field:'time',title:'使用时间'},
                {field:'reason',title:'申请原因'}
            ]
        });
    }

    $(document).ready(function () {
        //调用函数，初始化表格
        initTable();
        //当点击查询按钮的时候执行
        $("#search").bind("click", initTable);
    });
</script>
</html>
