<%--
  Created by IntelliJ IDEA.
  User: iooint
  Date: 2019/4/8
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>登录</title>
    <%@ include file="header/admin.jsp" %>
    <script src="<%=basePath%>/js/jquery.pure.tooltips.js"></script>
    <script>
        // $(function () {
        //     // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
        //     if (!String.prototype.trim) {
        //         (function () {
        //             // Make sure we trim BOM and NBSP
        //             var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
        //             String.prototype.trim = function () {
        //                 return this.replace(rtrim, '');
        //             };
        //         })();
        //     }
        //
        //     [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
        //         // in case the input is already filled..
        //         if (inputEl.value.trim() !== '') {
        //             classie.add(inputEl.parentNode, 'input--filled');
        //         }
        //
        //         // events:
        //         inputEl.addEventListener('focus', onInputFocus);
        //         inputEl.addEventListener('blur', onInputBlur);
        //     });
        //
        //     function onInputFocus(ev) {
        //         classie.add(ev.target.parentNode, 'input--filled');
        //     }
        //
        //     function onInputBlur(ev) {
        //         if (ev.target.value.trim() === '') {
        //             classie.remove(ev.target.parentNode, 'input--filled');
        //         }
        //     }
        // });

        $(function () {
            $('#login #login-password').focus(function () {
                $('.login-owl').addClass('password');
            }).blur(function () {
                $('.login-owl').removeClass('password');
            });
            $('#login #register-password').focus(function () {
                $('.register-owl').addClass('password');
            }).blur(function () {
                $('.register-owl').removeClass('password');
            });
            $('#login #register-repassword').focus(function () {
                $('.register-owl').addClass('password');
            }).blur(function () {
                $('.register-owl').removeClass('password');
            });
            $('#login #forget-password').focus(function () {
                $('.forget-owl').addClass('password');
            }).blur(function () {
                $('.forget-owl').removeClass('password');
            });
        });
        $(function () {
            register();
            login();
            goto_login();
            goto_register();
            forget();
            goto_forget();
        });

        function goto_register() {
            $("#register-username").val("");
            $("#register-phone").val("");
            $("#register-password").val("");
            $("#register-repassword").val("");
            $("#register-code").val("");
            $("#tab-2").prop("checked", true);
        }

        function goto_login() {
            $("#login-phone").val("");
            $("#login-password").val("");
            $("#tab-1").prop("checked", true);
        }

        function goto_forget() {
            $("#forget-username").val("");
            $("#forget-password").val("");
            $("#forget-code").val("");
            $("#tab-3").prop("checked", true);
        }

        function login() {//登录
            var phone = $("#login-phone").val(),
                password = $("#login-password").val(),
                validatecode = null,
                flag = false;
            //判断用户名密码是否为空
            if ($("#login-phone").val() == "") {
                $.pt({
                    target: $("#login-phone"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "手机号不能为空"
                });
                flag = true;
            }
            if ($("#login-password").val() =="") {
                $.pt({
                    target: $("#login-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "密码不能为空"
                });
                flag = true;
            }
            //用户名只能是15位以下的字母或数字
            // var regExp = new RegExp(/^1[34578]\d{9}$/);
            // if (!regExp.test(phone) {
            //     $.pt({
            //         target: $("#login-phone"),
            //         position: 'r',
            //         align: 't',
            //         width: 'auto',
            //         height: 'auto',
            //         content: "手机号格式不正确"
            //     });
            //     flag = true;
            // }

            if (flag) {
                return false;
            } else {//登录
                //调用后台登录验证的方法
                var obj = new Object();
                obj.phone = $("#login-phone").val();
                obj.password = $("#login-password").val();
                console.info(obj);
                doDataAll("<%=basePath%>/user/login", obj, function (data) {
                    if (data.code>0) {
                        spop({
                            template: '<h4 class="spop-title">登录成功</h4>即将于3秒后跳转登首页',
                            position: 'top-center',
                            style: 'success',
                            autoclose: 3000,
                            onOpen: function () {
                                var second = 2;
                                var showPop = setInterval(function () {
                                    if (second == 0) {
                                        clearInterval(showPop);
                                    }
                                    $('.spop-body').html('<h4 class="spop-title">登录成功</h4>即将于' + second + '秒后跳转登首页');
                                    second--;
                                }, 1000);
                            },
                            onClose: function () {
                                window.location.replace("index.jsp");
                            }
                        });
                    }
                })
                return false;
            }
        }

        //注册
        function register() {
            var username = $("#register-username").val();
            var   phone = $("#register-phone").val();
            var  password = $("#register-password").val();
            var  repassword = $("#register-repassword").val();
            var code = $("#register-code").val();
            var  flag = false;
            var  validatecode = null;
            //判断用户名密码是否为空
            $("#register-username").blur(function(){
                if ($("#register-username").val() == "") {
                    $.pt({
                        target: $("#register-username"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "用户名不能为空"
                    });
                    flag = true;
                }
            });
            $("#register-repassword").blur(function () {
                if ($("#register-password").val() =="") {
                    $.pt({
                        target: $("#register-password"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "密码不能为空"
                    });
                    flag = true;
                } else {
                    if ($("#register-password").val() !== $("#register-repassword").val()) {
                        $.pt({
                            target: $("#register-repassword"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "两次输入的密码不一致"
                        });
                        flag = true;
                    }
                }
            });
            function isPhoneNo(phone) {
                var pattern = /^1[34578]\d{9}$/;
                return pattern.test(phone);
            }
            // 验证手机号
            $("#register-phone").blur(function () {
                // 判断手机号码
                if ($.trim($('#register-phone').val()).length == 0) {
                    $.pt({
                        target: $("#register-phone"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "手机号没有输入"
                    });
                    $('#register-phone').focus();
                } else {
                    if(isPhoneNo($.trim($('#register-phone').val()) == false)) {
                        $.pt({
                            target: $("#register-phone"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "手机号码不正确"
                        });
                        $('#register-phone').focus();
                    }
                }
            });



            //用户名只能是15位以下的字母或数字
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#register-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名必须为15位以下的字母或数字"
                });
                flag = true;
            }

            $("#register-username").blur(function(){
                var name=$("#register-username").val();
                doDataAllAsc("<%=basePath%>/user/getUserName",name, function (data) {
                    if (data.obj==true) {
                        $.pt({
                            target: $("#register-username"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "该用户名已存在"
                        });
                    }
                })
            });
            $("#register-phone").blur(function(){
                var phone=$("#register-phone").val();
                doDataAllAsc("<%=basePath%>/user/getUserByPhone",phone, function (data) {
                    if (data.obj==true) {
                        $.pt({
                            target: $("#register-phone"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "该手机号已被注册"
                        });
                    }
                })
            });
            //检查用户名是否已经存在
            //调后台代码检查用户名是否已经被注册

            //检查注册码是否正确
            //调后台方法检查注册码，这里写死为11111111
            if ($("#register-code").val() != '0528') {
                $.pt({
                    target: $("#register-code"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "注册码不正确"
                });
                flag = true;
            }


            if (flag) {
                return false;
            } else {//注册
                var user=new Object();
                user.name=$("#register-username").val();
                user.password=$("#register-password").val();
                user.phone=$("#register-phone").val();
                doDataAllAsc("<%=basePath%>/user/reg",user, function (data) {
                    if (data.code>0) {
                        spop({
                            template: '<h4 class="spop-title">注册成功</h4>即将于3秒后返回登录',
                            position: 'top-center',
                            style: 'success',
                            autoclose: 3000,
                            onOpen: function () {
                                var second = 2;
                                var showPop = setInterval(function () {
                                    if (second == 0) {
                                        clearInterval(showPop);
                                    }
                                    $('.spop-body').html('<h4 class="spop-title">注册成功</h4>即将于' + second + '秒后返回登录');
                                    second--;
                                }, 1000);
                            },
                            onClose: function () {
                                goto_login();
                            }
                        });
                    }
                    else {
                        alert("注册失败！请重新填写注册信息...")
                    }
                })

                return false;
            }
        }

        //重置密码
        function forget() {
            var username = $("#forget-username").val(),
                password = $("#forget-password").val(),
                code = $("#forget-code").val(),
                flag = false,
                validatecode = null;
            //判断用户名密码是否为空
            if (username == "") {
                $.pt({
                    target: $("#forget-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名不能为空"
                });
                flag = true;
            }
            if (password == "") {
                $.pt({
                    target: $("#forget-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "密码不能为空"
                });
                flag = true;
            }
            //用户名只能是15位以下的字母或数字
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#forget-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名必须为15位以下的字母或数字"
                });
                flag = true;
            }
            //检查用户名是否存在
            //调后台方法

            //检查注册码是否正确
            if (code != '11111111') {
                $.pt({
                    target: $("#forget-code"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "注册码不正确"
                });
                flag = true;
            }


            if (flag) {
                return false;
            } else {//重置密码
                spop({
                    template: '<h4 class="spop-title">重置密码成功</h4>即将于3秒后返回登录',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 3000,
                    onOpen: function () {
                        var second = 2;
                        var showPop = setInterval(function () {
                            if (second == 0) {
                                clearInterval(showPop);
                            }
                            $('.spop-body').html('<h4 class="spop-title">重置密码成功</h4>即将于' + second + '秒后返回登录');
                            second--;
                        }, 1000);
                    },
                    onClose: function () {
                        goto_login();
                    }
                });
                return false;
            }
        }


    </script>
    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
        }

        body {

            background-repeat: no-repeat;

            background-position: center center #2D0F0F;

            background-color: #00BDDC;

            background-image: url(images/snow.jpg);

            background-size: 100% 100%;

        }

        .snow-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 100001;
        }

    </style>
</head>
<body>
<!-- 雪花背景 -->
<div class="snow-container"></div>
<!-- 登录控件 -->
<div id="login">
    <input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked/>
    <input id="tab-2" type="radio" name="tab" class="sign-up hidden"/>
    <input id="tab-3" type="radio" name="tab" class="sign-out hidden"/>
    <div class="wrapper">
        <!-- 登录页面 -->
        <div class="login sign-in-htm">
            <form class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="login-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="login-phone"
                                       autocomplete="off" placeholder="请输入手机号" tabindex="1" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-phone">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="login-password"
                                       placeholder="请输入密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a tabindex="4" class="btn pull-left btn-link text-muted" onClick="goto_forget()">忘记密码?</a>
                    <a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
                    <input class="btn btn-primary" type="button" tabindex="3" onClick="login()" value="登录"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- 忘记密码页面 -->
        <div class="login sign-out-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="forget-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-username"
                                       autocomplete="off" placeholder="请输入用户名"/>
								<label class="input__label input__label--hideo" for="forget-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-code"
                                       autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="forget-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-password"
                                       placeholder="请重置密码"/>
								<label class="input__label input__label--hideo" for="forget-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
                    <input class="btn btn-primary" type="button" onClick="forget()" value="重置密码"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- 注册页面 -->
        <div class="login sign-up-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="register-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-username"
                                       autocomplete="off" placeholder="请输入用户名" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-phone"
                                       autocomplete="off" placeholder="请输入手机号" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-phone">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-password"
                                       placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-repassword"
                                       placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-code"
                                       autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="register-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
                    <input class="btn btn-primary" type="button" onClick="register()" value="注册"
                           style="color:white;"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>