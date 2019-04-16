<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    String baseImgPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=basePath%>/plugins/dist/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="<%=basePath%>/plugins/dist/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/res/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/res/css/main.css">
    <link rel="stylesheet" href="<%=basePath%>/plugins/dist/css/styles.css">
    <link rel="stylesheet" href="<%=basePath%>/css/normalize.css">
    <link rel="stylesheet" href="<%=basePath%>/css/login.css">
    <link rel="stylesheet" href="<%=basePath%>/css/sign-up-login.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/inputEffect.css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/tooltips.css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/spop.min.css"/>

    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/js/snow.js"></script>
    <script src="<%=basePath%>/js/jquery.pure.tooltips.js"></script>
    <script src="<%=basePath%>/js/spop.min.js"></script>
    <script src="<%=basePath%>/plugins/dist/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/plugins/dist/vendor/popper.js/popper.min.js"></script>
    <script src="<%=basePath%>/plugins/dist/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>/plugins/dist/vendor/chart.js/chart.min.js"></script>
    <script src="<%=basePath%>/plugins/dist/js/carbon.js"></script>
    <script src="<%=basePath%>/plugins/dist/js/demo.js"></script>
    <script src="<%=basePath%>/script/common/public.js"></script>
    <script src="<%= basePath %>/script/common/ajax.js"></script>
    <script src="<%=basePath%>/script/common/jquery-public.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/res/layui/layui.js"></script>
</head>
<body>

</body>
</html>
