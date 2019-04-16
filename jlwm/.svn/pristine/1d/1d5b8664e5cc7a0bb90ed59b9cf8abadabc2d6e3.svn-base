<%--
  Created by IntelliJ IDEA.
  User: wph-pc
  Date: 2017/10/9
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/header/init.jsp"%>
<html>
<head>
    <title>资源附件管理</title>
    <script src="<%=basePath%>/plugins/layui/layui.js"></script>
    <link href="<%=basePath%>/plugins/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div class="layui-table-tool" id="tb">
    <div class="layui-btn-group">
    <button class="layui-btn layui-btn-small" id="btnAdd" >
        <i class="layui-icon">&#xe608;</i> 资源上传
    </button>
    </div>
    <input type="text"  style="width: 300px; height: 28px;" name="name" id="txtName" required  placeholder="请输入资源名称" autocomplete="off"/>
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-small" id="btnFind">
            <i class="layui-icon">&#xe615;</i> 搜索
        </button>
        <button class="layui-btn layui-btn-small layui-btn-warm" id="btnDeleteAll">
            <i class="layui-icon">&#xe640;</i> 批量删除
        </button>
    </div>
</div>
<table class="easyui-datagrid" title="资源信息管理" style="height:auto" id="dgAttachment"
       data-options="rownumbers:true,pagination:true,collapsible:true,striped:true,fit:true,toolbar:'#tb'">
    <thead>
    <tr>
        <th data-options="field:'id',checkbox:true"></th>
        <th data-options="field:'name',width:180">资源名称</th>
        <th data-options="field:'type',width:60">类型</th>
        <th data-options="field:'size',width:60">大小</th>
        <th data-options="field:'canDownload',width:60">下载?</th>
        <th data-options="field:'canShare',width:60">共享?</th>
        <th data-options="field:'canRead',width:60">阅读?</th>
        <th data-options="field:'downloadCount',width:60">下载数量</th>
        <th data-options="field:'readCount',width:60">阅读数量</th>
        <th data-options="field:'status',width:60">状态</th>
        <th data-options="field:'ids',formatter:operateMiniButton" width="120"
            align="center">操作</th>
    </tr>
    </thead>
</table>

</body>
</html>
