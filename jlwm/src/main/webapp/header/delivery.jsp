<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
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
<audio id="audio">
    <source src="<%=basePath%>/plugins/assets/gettts.mp3" type="audio/mpeg">
</audio>
</body>
<script>
    $(function () {
        /*****************************定时器查询可接订单*****************************/
     /*   var time = setInterval(function () {
            getAccessible(function (data) {
                if (data.obj.length > 0) {
                    $("#notification").attr("data-notification", data.obj.length);
                    document.getElementById("audio").play();
                }
            })
        }, 20000);*/
        //获取用户信息
        doDataAllAsc("<%=basePath%>/user/getCurrentUser", "", function (data) {
            if (data.code <= 0) {
                alert("用户未登录");
                window.location.href = "<%=basePath%>/admin/delivery/login.jsp";
            } else {
                //设置用户信息
                $("#userName").html(data.obj.name);
                $("#userImg").attr("src", data.obj.photo);
            }
        })

        //退出登录
        $("#logOut").click(function () {
            doDataAllAsc("<%=basePath%>/user/logOut", "", function (data) {
                if (data.code <= 0) {
                    aleret("注销失败");
                } else {
                    window.location.href = "<%=basePath%>/delivery/login";
                }
            })
        });
    })


    /*****************************查询可接订单数据*****************************/
    function getAccessible(callback) {
        doDataAllAsc("<%=basePath%>/order/getAccessible", "", function (data) {
            callback(data);
        });
    }

    /*****************************手机震动*****************************/
    function btn() {
        navigator.vibrate = navigator.vibrate ||
            navigator.webkitVibrate ||
            navigator.mozVibrate ||
            navigator.msVibrate;

        if(navigator.vibrate) {
            // 支持
            console.log("支持设备震动！");
        }

        navigator.vibrate([500, 300, 400, 300]);
    }


</script>
</html>
