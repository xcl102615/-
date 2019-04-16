<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/delivery.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>个人资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">
</head>
<body>
<div id="wrap">
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <div class="logo">
                    <img style="height: 30px;width: 105px" src="<%=basePath%>/plugins/assets/img/jlwmlogo.png"
                         alt="计里外卖">
                </div>
                <a class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="btn btn-navbar slide_menu_left visible-tablet">

                </a> <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>

                <div class="top-menu visible-desktop">
                    <ul class="pull-left">
                        <%--  <li><a id="messages" data-notification="2" href="#"><i class="icon-envelope"></i> 消息</a></li>--%>
                        <li><a id="notification" data-notification="0"
                               href="<%=basePath%>/admin/delivery/ui_features.jsp"><i class="icon-globe"></i> 通知</a>
                        </li>
                    </ul>
                    <ul class="pull-right">
                        <li><a id="logOut" href="<%=basePath%>/user/logOut"><i class="icon-off"></i> 退出登录</a></li>
                    </ul>
                </div>

                <div class="top-menu visible-phone visible-tablet">
                    <ul class="pull-right">
                        <li><a title="link to View all Messages page, no popover in phone view or tablet" href="#"><i
                                class="icon-envelope"></i></a></li>
                        <li><a title="link to View all Notifications page, no popover in phone view or tablet" href="#"><i
                                class="icon-globe"></i></a></li>
                        <li><a href="login.jsp"><i class="icon-off"></i></a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <div class="container-fluid">

        <!-- Side menu -->
        <div class="sidebar-nav nav-collapse collapse">
            <div class="user_side clearfix">
                <img id="userImg" alt="Odinn god of Thunder" src="${sessionScope.user.photo}">
                <h5 id="userName">${user.name}</h5>
                <%-- <a href="#"><i class="icon-cog"></i> 设置</a>--%>
            </div>
            <div class="accordion" id="accordion2">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle b_C3F7A7 collapsed" data-toggle="collapse" data-parent="#accordion2"
                           href="#collapse1"><i class="icon-magic"></i> <span>订单管理</span></a>
                    </div>
                    <div id="collapse1" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <a class="accordion-toggle" href="<%=basePath%>/admin/delivery/ui_features.jsp"><i
                                    class="icon-star"></i> 平台可接订单</a>
                            <a class="accordion-toggle" href="<%=basePath%>/admin/delivery/forms.jsp"><i
                                    class="icon-list-alt"></i> 我的所有订单</a>
                            <a class="accordion-toggle" href="<%=basePath%>/admin/delivery/tables.jsp"><i
                                    class="icon-table"></i> 我配送中订单</a>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle b_9FDDF6 collapsed" data-toggle="collapse" data-parent="#accordion2"
                           href="#collapse2"><i class="icon-reorder"></i> <span>资金管理</span></a>
                    </div>
                    <div id="collapse2" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <a class="accordion-toggle" href="<%=basePath%>/admin/delivery/notifications.jsp"><i
                                    class="icon-rss"></i> 个人资料</a>
                            <a class="accordion-toggle" href="<%=basePath%>/admin/delivery/calendar.jsp"><i
                                    class="icon-calendar"></i> 提现</a>
                            <a class="accordion-toggle" href="<%=basePath%>/admin/delivery/gallery.jsp"><i
                                    class="icon-picture"></i>资金流水</a>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle b_9FDDF6 collapsed" data-toggle="collapse" data-parent="#accordion2"
                           href="#collapse3"><i class="icon-reorder"></i> <span>设置</span></a>
                    </div>
                    <div id="collapse3" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <a class="accordion-toggle" href="#"><i
                                    class="icon-rss"></i> 定位</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Side menu -->
        <!-- Main window -->
        <div class="main_container" id="tables_page">


            <div class="row-fluid">
                <div class="widget widget-padding span12">
                    <div class="widget-header">
                        <i class="icon-group"></i>
                        <h5>个人信息</h5>
                        <div class="widget-buttons">
                            <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i
                                    class="icon-chevron-up"></i></a>
                        </div>
                    </div>
                    <div class="widget-body table-responsive">
                        <table style="text-align: center" class="table">
                            <tr>
                                <td>ID</td><td>${sessionScope.user.id}</td>
                            </tr>
                            <tr>
                                <td>用户名</td><td>${sessionScope.user.name}</td>
                            </tr>
                            <tr>
                                <td>性别</td><td>${sessionScope.user.sex==1?"男":"女"}</td>
                            </tr>
                            <tr>
                                <td>年龄</td><td>${sessionScope.user.age}(岁)</td>
                            </tr>
                            <tr>
                                <td>手机</td><td>${sessionScope.user.phone}</td>
                            </tr>
                            <tr>
                                <td>邮箱</td><td>${empty user.email?"用户还没有绑定邮箱":user.email}</td>
                            </tr>
                            <tr>
                                <td>注册时间</td><td><fmt:formatDate value="${sessionScope.user.createDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            </tr>
                            <tr>
                                <td style="column-span: all">角色</td>
                                    <td>
                                        <c:forEach items="${sessionScope.user.roles}" var="role">
                                            ${role.name}(${role.description})
                                        </c:forEach>
                                    </td>
                            </tr>
                            <tr>
                                <td>状态</td><td>${sessionScope.user.status =="1"?"正常":"禁用"}</td>
                            </tr>
                        </table>
                    </div>
                </div> <!-- /widget -->
            </div> <!-- /row-fluid -->

        </div>
        <!-- /Main window -->

    </div><!--/.fluid-container-->
</div><!-- wrap ends-->
</body>
<script>
    $(function () {
        /*****************************定时器查询可接订单*****************************/
        var time = setInterval(function () {
            getAccessible(function (data) {
                if (data.obj.length > 0) {
                    $("#notification").attr("data-notification", data.obj.length);
                    document.getElementById("audio").play();
                    btn();//手机震动
                }
            })
        }, 20000);
    })
</script>
</html>
