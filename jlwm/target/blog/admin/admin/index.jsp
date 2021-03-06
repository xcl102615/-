<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../header/admin.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台首页</title>
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <nav class="navbar page-header">
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>

        <a class="navbar-brand" href="#">
            <img src="<%=basePath%>/plugins/dist/imgs/jlwmlogo.png" alt="logo">
        </a>

        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <ul class="navbar-nav ml-auto">
            <%--<li class="nav-item d-md-down-none">--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-bell"></i>--%>
                    <%--<span class="badge badge-pill badge-danger">5</span>--%>
                <%--</a>--%>
            <%--</li>--%>

            <%--<li class="nav-item d-md-down-none">--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-envelope-open"></i>--%>
                    <%--<span class="badge badge-pill badge-danger">5</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="${user.photo}" class="avatar avatar-sm" alt="logo">
                    <span class="small ml-1 d-md-down-none">${user.name}</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <div class="dropdown-header">账户</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-user"></i> 简况
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-envelope"></i> 消息
                    </a>

                    <div class="dropdown-header">设置</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-bell"></i> 通知
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-wrench"></i> 设置
                    </a>

                    <a id="logout" href="#" class="dropdown-item">
                        <i class="fa fa-lock"></i> 退出登录
                    </a>
                </div>
            </li>
        </ul>
    </nav>

    <div class="main-container">
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-title" style="color: white;font-size: larger">导航</li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 商户管理 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a id="merchantAudit" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 商户审核
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="register" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 商户注册
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="allShops" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 所有店铺查看
                                </a>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 配送员管理 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a id="allDelivery" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 所有配送员
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="deliveryRigster" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 配送员注册
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="allDeliveryToexamine" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 审核配送员
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 订单管理 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a id="freshOrder" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 用户刚下订单
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="allOrders" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 所有订单
                                </a>
                            </li>


                            <li class="nav-item">
                                <a id="unDoOrder" href="#" class="nav-link">
                                    <i class="icon icon-target"></i>待配送中订单
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="onWayOrder" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 配送中订单
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="finishOrder" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 已完成订单
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 商品管理 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a id="allFood" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 所有商品
                                </a>
                            </li>

                            <li class="nav-item">
                                <a id="type" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 平台分类
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 资金管理 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a id="shopApply" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 卖家提现申请
                                </a>
                            </li>

                            <li class="nav-item">
                                <a id="deliveryApply" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 骑手提现申请
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="shopList" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 卖家提现列表
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="deliveryList" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 骑手提现列表
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 平台管理 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a id="photolinks" href="#" class="nav-link">
                                    <i class="icon icon-target"></i> 首页轮播图
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="content">
            <iframe id="frame" scrolling="auto" frameborder="0"  src="index1.jsp" style="width:100%;height:100%;"></iframe>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $("#index").click(function () {
            $("#frame").attr("src","index1.jsp");
        })
        $("#layouts-normal").click(function () {
            $("#frame").attr("src","layouts-normal.jsp");
        })
        $("#layouts-fixed-sidebar").click(function () {
            $("#frame").attr("src","layouts-fixed-sidebar.jsp");
        })

        $("#layouts-fixed-header").click(function () {
            $("#frame").attr("src","layouts-fixed-header.jsp");
        })

        $("#layouts-hidden-sidebar").click(function () {
            $("#frame").attr("src","layouts-hidden-sidebar.jsp");
        })

        $("#alerts").click(function () {
            $("#frame").attr("src","alerts.jsp");
        })

        $("#buttons").click(function () {
            $("#frame").attr("src","buttons.jsp");
        })

        $("#cards").click(function () {
            $("#frame").attr("src","cards.jsp");
        })

        $("#modals").click(function () {
            $("#frame").attr("src","modals.jsp");
        })

        $("#tabs").click(function () {
            $("#frame").attr("src","tabs.jsp");
        })

        $("#progress-bars").click(function () {
            $("#frame").attr("src","progress-bars.jsp");
        })

        $("#widgets").click(function () {
            $("#frame").attr("src","widgets.jsp");
        })

        $("#chartjs").click(function () {
            $("#frame").attr("src","chartjs.jsp");
        })

        $("#forms").click(function () {
            $("#frame").attr("src","forms.jsp");
        })

        $("#tables").click(function () {
            $("#frame").attr("src","tables.jsp");
        })

        $("#blank").click(function () {
            $("#frame").attr("src","blank.jsp");
        })

        $("#register").click(function () {
            $("#frame").attr("src","register.jsp");
        })

        $("#invoice").click(function () {
            $("#frame").attr("src","invoice.jsp");
        })

        $("#404").click(function () {
            $("#frame").attr("src","404.jsp");
        })

        $("#500").click(function () {
            $("#frame").attr("src","500.jsp");
        })

        $("#settings").click(function () {
            $("#frame").attr("src","settings.jsp");
        })

        $("#allFood").click(function () {
            $("#frame").attr("src","food/allFood.jsp");
        })
        $("#allDeliveryToexamine").click(function () {
            $("#frame").attr("src","delivery/allDeliveryToexamine.jsp");
        })
        $("#allDelivery").click(function () {
            $("#frame").attr("src","delivery/allDelivery.jsp");
        })
        $("#type").click(function () {
            $("#frame").attr("src","food/type.jsp");
        })
        $("#register").click(function () {
            $("#frame").attr("src","register.jsp");
        })
        $("#deliveryRigster").click(function () {
            $("#frame").attr("src","delivery/deliveryRigster.jsp");
        })

        /*****************************************/
        $("#merchantAudit").click(function () {
            $("#frame").attr("src","merchantAudit.jsp");
        })
        $("#allShops").click(function () {
            $("#frame").attr("src","allShops.jsp");
        })
        $("#freshOrder").click(function () {
            $("#frame").attr("src","order/freshOrder.jsp");
        })
        //退出登录
        $("#logout").click(function () {
            doDataAllAsc("<%=basePath%>/user/logOut", "", function (data) {
                if (data.code <= 0) {
                    aleret("注销失败");
                } else {
                    window.location.href = "<%=basePath%>/admin/login";
                }
            })
        })

        $("#allOrders").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getAllOrders");
        });
        $("#unDoOrder").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getOrdersByStatus/1");
        });
        $("#onWayOrder").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getOrdersByStatus/2");
        });
        $("#finishOrder").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getOrdersByStatus/3");
        });
        $("#photolinks").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getAllCarousel");
        });
        $("#shopApply").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getAllShopApply");
        });
        $("#deliveryApply").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getAllDeliveryApply");
        });
        $("#shopList").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getAllShopProfit");
        });
        $("#deliveryList").click(function () {
            $("#frame").attr("src","<%=basePath%>/admin/user/getAllDeliveryMoney");
        });

    })

</script>
</html>
