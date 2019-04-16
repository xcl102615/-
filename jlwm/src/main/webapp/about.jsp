
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>关于博客</title>
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
      <a href="index.html">
        <span>MYBLOG</span>
        <img src="<%=basePath%>/res/img/logo.png">
      </a>
    </h1>
    <div class="nav">
      <a href="index.jsp">文章</a>
      <a href="whisper.jsp">微语</a>
      <a href="leacots.jsp">留言</a>
      <a href="album.jsp">相册</a>
      <a href="about.jsp"  class="active">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="index.jsp">文章</a></li>
      <li class="layui-nav-item"><a href="whisper.jsp">微语</a></li>
      <li class="layui-nav-item"><a href="leacots.jsp">留言</a></li>
      <li class="layui-nav-item"><a href="album.jsp">相册</a></li>
      <li class="layui-nav-item"><a href="about.jsp"  class="active">关于</a></li>
    </ul>
    <p class="welcome-text">
      欢迎来到<span class="name">肖可爱</span>的博客~
    </p>
  </div>

  <div class="about-content">
    <div class="w1000">
      <div class="item info">
        <div class="title">
          <h3>我的介绍</h3>
        </div>
        <div class="cont">
          <img src="<%=basePath%>/res/img/xc_img1.jpg">
          <div class="per-info">
            <p>
              <span class="name">肖大帅哥</span><br />
              <span class="age">22岁</span><br />
              <span class="Career">java开发工程师</span><br />
              <span class="interest">爱好吉他,打篮球,写字</span>
            </p>
          </div>
        </div>
      </div>
      <div class="item tool">
        <div class="title">
          <h3>我的技能</h3>
        </div>
        <div class="layui-fluid">
          <div class="layui-row">
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="<%=basePath%>/res/img/gr_img2.jpg">
                <p>80%</p>
              </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="<%=basePath%>/res/img/gr_img3.jpg">
                <p>80%</p>
              </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="<%=basePath%>/res/img/gr_img4.jpg">
                <p>80%</p>
              </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="<%=basePath%>/res/img/gr_img5.jpg">
                <p>80%</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="item contact">
        <div class="title">
          <h3>联系方式</h3>
        </div>
        <div class="cont">
          <img src="<%=basePath%>/res/img/wxewm.jpg">
          <div class="text">
            <p class="WeChat">微信：<span>13576250514</span></p>
            <p class="qq">qq：<span>997515031</span></p>
            <p class="iphone">电话：<span>13576250514</span></p>
          </div>
        </div>
      </div>
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
          <p>微信<span class="WeChat">13576250514</span></p>
          <p>手机<span class="iphone">13576250514</span></p>
          <p>邮箱<span class="email">997515031@qq.com</span></p>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
    layui.config({
      base: '<%=basePath%>/res/js/util/'
    }).use(['element','laypage','form','layer','menu'],function(){
      element = layui.element,laypage = layui.laypage,form = layui.form,layer = layui.layer,menu = layui.menu;
      menu.init();
    })
  </script>
</body>
</html>