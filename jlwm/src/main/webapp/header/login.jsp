<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    String baseImgPath="https://wm-1253155025.cos.ap-guangzhou.myqcloud.com";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <link href="<%=basePath%>/plugins/assets/ico/favicon.html" rel="shortcut icon">
    <link href="<%=basePath%>/plugins/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/plugins/assets/css/theme.css" rel="stylesheet">
    <link href="<%=basePath%>/plugins/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>/plugins/assets/css/alertify.css" rel="stylesheet">

    <link href="<%=basePath%>/plugins/assets/css/colorpicker.css" rel="stylesheet">
    <link href="<%=basePath%>/plugins/assets/css/datepicker.css" rel="stylesheet">
    <link href="<%=basePath%>/plugins/assets/css/timepicker.css" rel="stylesheet">
    <link href="<%=basePath%>/plugins/assets/css/select2.css" rel="stylesheet">
    <link href="<%=basePath%>/css/jigsaw.css" rel="stylesheet">
    <%--<link href="http://fonts.useso.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">--%>
    <link rel="Favicon Icon" href="<%=basePath%>/plugins/assets/ico/favicon.ico">
<%--    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>--%>

    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/raphael-min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src='<%=basePath%>/plugins/assets/js/sparkline.js'></script>
    <script type="text/javascript" src='<%=basePath%>/plugins/assets/js/morris.min.js'></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.masonry.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.imagesloaded.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.facybox.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.alertify.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.knob.js"></script>
    <script type='text/javascript' src='<%=basePath%>/plugins/assets/js/fullcalendar.min.js'></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/realm.js"></script>
    <script src="<%= basePath %>/script/common/ajax.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/select2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/assets/js/bootstrap-timepicker.js"></script>

</head>
<body>
</body>
</html>
