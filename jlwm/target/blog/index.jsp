<%--
  Created by IntelliJ IDEA.
  User: iooint
  Date: 2019/4/2
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>博客首页</title>
    <%@ include file="header/admin.jsp" %>
    <!--加载meta IE兼容文件-->
    <!--[if lt IE 9]>
    <![endif]-->
</head>
<body>
<div class="header">
    <div class="menu-btn">
        <div class="menu"></div>
    </div>
    <h1 class="logo">
        <a href="index.jsp">
            <span>MYBLOG</span>
            <img src="<%=basePath%>/res/img/logo.png">
        </a>
    </h1>
    <div class="nav">
        <a href="index.jsp" class="active">文章</a>
        <a href="whisper.jsp">微语</a>
        <a href="leacots.jsp">留言</a>
        <a href="album.jsp">相册</a>
        <a href="about.jsp">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="index.jsp" class="active">文章</a></li>
        <li class="layui-nav-item"><a href="whisper.jsp">微语</a></li>
        <li class="layui-nav-item"><a href="leacots.jsp">留言</a></li>
        <li class="layui-nav-item"><a href="album.jsp">相册</a></li>
        <li class="layui-nav-item"><a href="about.jsp">关于</a></li>
    </ul>
    <p class="welcome-text">
        欢迎来到<span class="name" id="username"></span>的博客~
    </p>
</div>

<div class="banner">
    <div class="cont w1000">
        <div class="title">
            <h3>MY<br />BLOG</h3>
            <h4>well-balanced heart</h4>
        </div>
        <div class="amount">
            <p><span class="text">访问量</span><span class="access">1000+</span></p>
            <p><span class="text">日志</span><span class="daily-record">1000+</span></p>
        </div>
        <%--<div id="slidershow" class="carousel slide" data-ride="carousel" data-interval = 2000 data-pause = "hover" data-wrap="true" style="margin-top: 5rem; width: 50%;height: 50%; margin-left:auto; margin-right:auto;">--%>
        <%--<!-- 设置图片轮播的顺序 -->--%>
        <%--<ol class="carousel-indicators">--%>
        <%--<li class="active" data-target="#slidershow" data-slide-to="0" ></li>--%>
        <%--<li data-target="#slidershow" data-slide-to="1"></li>--%>
        <%--<li data-target="#slidershow" data-slide-to="2"></li>--%>
        <%--</ol>--%>
        <%--<!--设置轮播的图片-->--%>
        <%--<div class="carousel-inner">--%>
        <%--<div class="item active">--%>
        <%--<a href="##"><img src="<%=basePath%>/res/img/wy_img1.jpg" alt="cat1"></a>--%>
        <%--</div>--%>
        <%--<div class="item">--%>
        <%--<a href="##"><img src="<%=basePath%>/res/img/wy_img3.jpg" alt="cat2"></a>--%>
        <%--</div>--%>
        <%--<div class="item">--%>
        <%--<a href="##"><img src="<%=basePath%>/res/img/wy_img2.jpg" alt="cat3"></a>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<a class="left carousel-control" href="#slidershow" role="button" data-slide="prev" >--%>
        <%--<span class="glyphicon glyphicon-chevron-left"></span>--%>
        <%--</a>--%>
        <%--<a class="right carousel-control" href="#slidershow" role="button" data-slide="next">--%>
        <%--<span class="glyphicon glyphicon-chevron-right"></span>--%>
        <%--</a>--%>
        <%--</div>--%>
    </div>
</div>
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
<div class="content">
    <div class="cont w1000">
        <div class="title">
        <span class="layui-breadcrumb" lay-separator="|">
          <a href="javascript:;" class="active">设计文章</a>
          <a href="javascript:;">前端文章</a>
          <a href="javascript:;">旅游杂记</a>
        </span>
        </div>
        <div class="list-item">
            <div class="item">
                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                            <div class="img"><img src="<%=basePath%>/res/img/sy_img1.jpg" alt=""></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                            <div class="item-cont">
                                <h3>空间立体效果图，完美呈现最终效果<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                                <h5>设计文章</h5>
                                <p>室内设计作为一门新兴的学科，尽管还只是近数十年的事，但是人们有意识地对自己生活、生产活动的室内进行安排布置，甚至美化装饰，赋予室内环境以所祈使的气氛，却早巳从人类文明伊始的时期就已存在</p>
                                <a href="details.jsp" class="go-icon"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                            <div class="img"><img src="<%=basePath%>/res/img/sy_img2.jpg" alt=""></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                            <div class="item-cont">
                                <h3>空间立体效果图，完美呈现最终效果<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                                <h5>设计文章</h5>
                                <p>室内设计作为一门新兴的学科，尽管还只是近数十年的事，但是人们有意识地对自己生活、生产活动的室内进行安排布置，甚至美化装饰，赋予室内环境以所祈使的气氛，却早巳从人类文明伊始的时期就已存在</p>
                                <a href="details.jsp" class="go-icon"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                            <div class="img"><img src="<%=basePath%>/res/img/sy_img3.jpg" alt=""></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                            <div class="item-cont">
                                <h3>空间立体效果图，完美呈现最终效果<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                                <h5>设计文章</h5>
                                <p>室内设计作为一门新兴的学科，尽管还只是近数十年的事，但是人们有意识地对自己生活、生产活动的室内进行安排布置，甚至美化装饰，赋予室内环境以所祈使的气氛，却早巳从人类文明伊始的时期就已存在</p>
                                <a href="details.jsp" class="go-icon"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                            <div class="img"><img src="<%=basePath%>/res/img/sy_img4.jpg" alt=""></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                            <div class="item-cont">
                                <h3>空间立体效果图，完美呈现最终效果<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                                <h5>设计文章</h5>
                                <p>室内设计作为一门新兴的学科，尽管还只是近数十年的事，但是人们有意识地对自己生活、生产活动的室内进行安排布置，甚至美化装饰，赋予室内环境以所祈使的气氛，却早巳从人类文明伊始的时期就已存在</p>
                                <a href="details.jsp" class="go-icon"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                            <div class="img"><img src="<%=basePath%>/res/img/sy_img5.jpg" alt=""></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                            <div class="item-cont">
                                <h3>空间立体效果图，完美呈现最终效果<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                                <h5>设计文章</h5>
                                <p>室内设计作为一门新兴的学科，尽管还只是近数十年的事，但是人们有意识地对自己生活、生产活动的室内进行安排布置，甚至美化装饰，赋予室内环境以所祈使的气氛，却早巳从人类文明伊始的时期就已存在</p>
                                <a href="details.jsp" class="go-icon"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="demo" style="text-align: center;"></div>
    </div>
</div>

<div class="footer-wrap">
    <div class="footer w1000">
        <div class="qrcode">
            <img style="width: 160px;height: 160px" src="<%=basePath%>/res/img/wxewm.jpg">
        </div>
        <div class="practice-mode">
            <img src="<%=basePath%>/res/img/down_img.jpg">
            <div class="text">
                <h4 class="title">我的联系方式</h4>
                <p>微信<span class="WeChat" id="userphone"></span></p>
                <p>邮箱<span class="email" id="useremail"></span></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        doDataAllAsc("<%=basePath%>/user/getCurrentUser","", function (data) {
            if (data.code>0) {
                alert(data.obj.name);
                $("#username").html(data.obj.name);
                $("#userphone").html(data.obj.phone);
                $("#useremaile").html('997515031@qq.com');
            }
        })
    });
    layui.config({
        base: '<%=basePath%>/res/js/util/'
    }).use(['element','laypage','jquery','menu'],function(){
        element = layui.element,laypage = layui.laypage,$ = layui.$,menu = layui.menu;
        laypage.render({
            elem: 'demo'
            ,count: 70 //数据总数，从服务端得到
        });
        menu.init();
    })

</script>
</body>
</html>