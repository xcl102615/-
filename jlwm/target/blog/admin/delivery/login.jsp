<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/login.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">

</head>
<body>
<div id="wrap">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="row-fluid">
                    <div class="widget container-narrow">
                        <div class="widget-header">
                            <i class="icon-user"></i>
                            <h5>登录到您的帐户</h5>
                        </div>
                        <div class="widget-body clearfix" style="padding:25px;">

                            <form>
                               <%-- <div style="padding:10px 0">
                                    <a style="" href="#" class="btn btn-large btn-block btn-primary"><i
                                            class="icon-facebook-sign"></i>使用手机号登录</a>
                                </div>
                                <div class="divider">
                                    <hr class="pull-left">
                                    <span>或</span>
                                    <hr class="pull-right">
                                </div>--%>
                                <div class="control-group">
                                    <div class="controls">
                                        <input class="btn-block" type="text" id="phone" placeholder="手机号">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <input class="btn-block" type="password" id="password" placeholder="密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls clearfix">
                                        <label style="width:auto" class="checkbox pull-left">
                                            <input type="checkbox">记住密码
                                        </label>
                                        <a style="padding: 5px 0px 0px 5px;" href="<%=basePath%>/delivery/retrievePassword" class="pull-right">忘记密码?</a>
                                    </div>
                                </div>
                                <button id="submit" type="button" class="btn pull-right">登录</button>
                            </form>
                        </div>
                    </div>
                    <div style="text-align:center">
                        <p>新帐户？<a href="<%=basePath%>/delivery/new_account">注册</a></p>
                    </div>
                </div><!--/row-fluid-->
            </div><!--/span10-->
        </div><!--/row-fluid-->
    </div><!--/.fluid-container-->
</div><!-- wrap ends-->

</body>
<script>
    $(function () {
        $("#submit").click(function () {
            var obj = new Object();
            obj.phone = $("#phone").val();
            obj.password = $("#password").val();
            doDataAllAsc("<%=basePath%>/user/login", obj, function (data) {
                if (data.code <= 0) {
                    alert("账号或密码错误");
                } else {
                    var relst=false;
                    //验证用户是否有骑手权限
                    $.each(data.obj.roles,function () {
                        if(this.name=="delivery"){
                            relst=true;
                        }
                    })
                    if(relst){
                        location.href="<%=basePath%>/admin/delivery/index.jsp";
                    }else{
                        doDataAllAsc("<%=basePath%>/user/logOut", "", function (data) {});
                        alert("你不是骑手用户!");
                    }

                }
            })
        })
    })
</script>
</html>
