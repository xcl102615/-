<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/delivery.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>资金流水</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">
    <link href="<%=basePath%>/plugins/assets/css/facybox.css" rel="stylesheet">
  </head>
  <body>
  <div id="wrap">
      <div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
              <div class="container-fluid">
                  <div class="logo">
                      <img style="height: 30px;width: 105px" src="<%=basePath%>/plugins/assets/img/jlwmlogo.png" alt="Realm Admin Template">
                  </div>
                  <a class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </a>
                  <a class="btn btn-navbar slide_menu_left visible-tablet">

                  </a>      <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>

                  <div class="top-menu visible-desktop">
                      <ul class="pull-left">
                          <li><a id="notification" data-notification="0" href="<%=basePath%>/admin/delivery/ui_features.jsp"><i class="icon-globe"></i> 通知</a></li>
                      </ul>
                      <ul class="pull-right">
                          <li><a id="logOut"><i class="icon-off"></i> 退出登录</a></li>
                      </ul>
                  </div>

                  <div class="top-menu visible-phone visible-tablet">
                      <ul class="pull-right">
                          <li><a title="link to View all Messages page, no popover in phone view or tablet" href="#"><i class="icon-envelope"></i></a></li>
                          <li><a title="link to View all Notifications page, no popover in phone view or tablet" href="#"><i class="icon-globe"></i></a></li>
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
                          <h5>资金流水</h5>
                          <div class="widget-buttons">
                              <a href="http://www.iooint.com" data-title="Documentation" class="tip" target="_blank"><i class="icon-external-link"></i></a>
                              <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
                          </div>
                      </div>
                      <div class="widget-body">
                          <table  class="table table-striped table-bordered ">
                              <thead>
                              <tr>
                                  <th>时间</th>
                                  <th>状态</th>
                                  <th>类型</th>
                                  <th>金额</th>
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
          //获取骑手资金流水
          doDataAll("<%=basePath%>/deliveryMoney/findDeliveryMoney",{"type":"45"},function (data) {
             if (data.code<=0){
                 alert("未查询到记录");
             } else{
                load(data);
             }
          })
      })
      /*****************************给表格加载数据*****************************/
      function load(data) {
          $("#tbody").html("");
          if (data.code > 0) {
              $(data.obj).each(function () {
                  var str = " <tr>\n" +
                      "                  <td>" + this.createDate + "</td>\n" +
                      "                  <td>" + this.status + "</td>\n" +
                      "                  <td>" + this.type + "</td>\n" +
                      "                  <td>" + this.money + "元</td>\n" +
                      "                </tr>";
                  $("#tbody").append(str);
              });
          }
      }

  </script>
</html>
