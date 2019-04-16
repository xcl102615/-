<%--
  Created by IntelliJ IDEA.
  User: wph-pc
  Date: 2017/8/1
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="Author" content="kesun">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link href="<%= basePath %>/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= basePath %>/css/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="<%= basePath %>/plugins/bootstrap/bootstrap-treeview.min.css" rel="stylesheet" />
    <link href="<%= basePath %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="<%= basePath %>/css/toastr.min.css" rel="stylesheet" />

    <script src="<%= basePath %>/script/common/jquery-1.10.2.min.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/bootstrapValidator.min.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/toastr.min.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/bootstrap-treeview.min.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/bootstrap-datetimepicker.min.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="<%= basePath %>/plugins/bootstrap/bootstrapMessageDialog.js"></script>

    <script>
        $(function(){
            toastr.options = {
                positionClass: "toast-bottom-center",
                onclick: null,
                showDuration: "300",
                hideDuration: "1000",
                timeOut: "2000",
                extendedTimeOut: "1000",
                showEasing: "swing",
                hideEasing: "linear",
                showMethod: "fadeIn",
                hideMethod: "fadeOut"
            };
        });
    </script>
    <style>
        td {
            background-color: #fff;
            border: solid 10px #ffffff;
            color: rgba(0, 0, 0, 0.99);
            font-size: 12px;
            font-family: Helvetica Neue,Helvetica,PingFang SC,Hiragino Sans GB,Microsoft YaHei,Noto Sans CJK SC,WenQuanYi Micro Hei,Arial,sans-serif;
            margin: 0;
            padding: 0;
        }
        .bs-callout {
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #eee;
            border-left-width: 1px;
            border-left-color: rgb(238, 238, 238);
            border-left-width: 5px;
            border-radius: 3px;
        }
        .bs-callout-danger {
            border-left-color: #ce4844;
        }
        .bs-callout-danger h4 {
            color: #ce4844;
        }
        .bs-callout-warning {
            border-left-color: #aa6708;
        }
        .bs-callout-warning h4 {
            color: #aa6708;
        }
        .bs-callout-info {
            border-left-color: #1b809e;
        }
        .bs-callout-info h4 {
            color: #1b809e;
        }
        .mask {
            position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #777;
            z-index: 1002; left: 0px;
            opacity:0.5; -moz-opacity:0.5;
            width: 100%;
            display:none;
            vertical-align: middle;
            text-align: center;
        }
    </style>
</head>
<body>
<div id="mask" class="mask">
    <img src="<%=basePath%>/images/loading.gif"/>
</div>
</body>
</html>
