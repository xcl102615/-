<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/delivery.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>平台可接订单</title>
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
                        <li><a id="logOut"><i class="icon-off"></i> 退出登录</a></li>
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
                <img id="userImg" alt="Odinn god of Thunder">
                <h5 id="userName">用户名</h5>
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
                                    class="icon-picture"></i> 资金流水</a>
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
                        <h5>平台可接订单</h5>
                        <div class="widget-buttons">
                            <a href="http://www.datatables.net/usage/" data-title="Documentation" class="tip"
                               target="_blank"><i class="icon-external-link"></i></a>
                            <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i
                                    class="icon-chevron-up"></i></a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <table class="table table-striped table-bordered ">
                            <thead>
                            <tr>

                                <th>地址</th>
                                <th>店铺</th>
                                <th>金额</th>
                                <th>配送费</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody">

                            </tbody>
                        </table>
                    </div> <!-- /widget-body -->
                </div> <!-- /widget -->
            </div> <!-- /row-fluid -->

        </div>
        <!-- /Main window -->

    </div><!--/.fluid-container-->
</div><!-- wrap ends-->

<audio id="audio" src="<%=basePath%>/plugins/assets/gettts.mp3">
</audio>
<div class="bg-model"
     style="position:absolute;top:0%;left:0%;display:none;background:rgba(0,0,0,0.3);width:100%;height:100%;position:fixed;z-index:9999">
    　　
    <div class='content'
         style="position: absolute;left: 25%;top: 20%;border-radius: 8px;background-color: #fff;">
        <div class="form-group">
            <h5 style="text-align: center">商品名称:<span id="foodName"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">数量:<span id="number"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">价格:<span id="price"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">实付金额:<span id="realPay"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">姓名:<span id="name"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">手机号:<span id="phone"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">地址:<span id="userAddress"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">备注:<span id="remarks"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">店铺名称:<span id="shopName"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">店铺地址:<span id="shopAddress"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">配送费:<span id="deliveryPrice"></span></h5>
        </div>
        <div class="form-group">
            <h5 style="text-align: center">下单时间:<span id="paymentTime"></span></h5>
        </div>
        <div style="text-align: center">
        <button type="button" id="close" class="btn btn-default">关闭</button>
        </div>
    </div>
</div>


</body>
<script>
    $(function () {
        //详情按钮
        $("#tbody").on("click", ".btn-info", function () {
            doDataAllAsc("<%=basePath%>/order/findOrderById",{"id":this.name},function (data) {
                if(data.code>0){
                    $(data.obj).each(function () {
                        $("#name").html(this.address.name);
                        $("#phone").html(this.address.phone);
                        $("#price").html(this.totalPrice+'元');
                        $("#userAddress").html(this.address.location);
                        $("#remarks").html(this.remarks);
                        $("#realPay").html(this.realPay+'元');
                        $("#shopName").html(this.shop.name);
                        $("#shopAddress").html(this.shop.location);
                        $("#deliveryPrice").html(this.deliveryPrice+'元');
                        var  shuzhu=new Array;
                        var  number=new Array();
                        var foodNumber=0;
                        $(this.orderDetails).each(function () {
                            shuzhu.push(this.foodName+"x"+this.num);
                            foodNumber=foodNumber+this.num
                        });
                        $("#foodName").html(shuzhu.toString());
                        $("#number").html(foodNumber);
                        $("#paymentTime").html(this.paymentTime)
                    })
                }
            })

            $(".bg-model").fadeTo(400, 1)
            //隐藏窗体的滚动条
            $("body").css({"overflow": "hidden"});
        })
        //关闭模态框
        $("#close").click(function () {
            $(".bg-model").hide()
        })

        /******************************获取骑手可接单**********************************/
        getAccessible(function (data) {
            load(data);
        });

        /*******************************监听接单按钮***********************************/
        $("#tbody").on("click", ".btn-success", function () {
            doDataAllAsc("<%=basePath%>/deliveryOrder/addDeliveryOrder", {"order": {"id": this.id}}, function (data) {
                if (data.code > 0) {
                    alert("接单成功");
                } else {
                    alert("接单失败");
                }
                window.location.reload();
            })
        })

        /*****************************定时器查询可接订单*****************************/
        var time = setInterval(function () {
            getAccessible(function (data) {
                if (data.obj.length > 0) {
                    btn();//手机震动
                    document.getElementById("audio").play();
                    load(data);
                }
            })
        }, 20000);


    })
    /*****************************查询可接订单数据*****************************/
    function getAccessible(callback) {
        doDataAllAsc("<%=basePath%>/order/getAccessible", "", function (data) {
            callback(data);
        });
    }

    /*****************************给表格加载数据*****************************/
    function load(data) {
        $("#tbody").html("");
        if (data.code > 0) {
            $("#notification").attr("data-notification", data.obj.length);
            $(data.obj).each(function () {
                var str = " <tr>\n" +
                    "                  <td>" + this.address.location + "</td>\n" +
                    "                  <td>" + this.shop.name + "</td>\n" +
                    "                  <td>" + this.realPay + "</td>\n" +
                    "                  <td>" + this.deliveryPrice + "</td>\n" +
                    "                  <td>" + this.status + "</td>\n" +
                    "                  <td><button type=\"button\" id='" + this.id + "' class=\"btn btn-success  btn-xs\">接单</button> <button type=\"button\" name='" + this.id + "' class=\"btn btn-info  btn-xs\">详情</button></td>\n" +
                    "                </tr>";
                $("#tbody").append(str);
            });
        }
    }


</script>
</html>
