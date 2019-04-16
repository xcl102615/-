<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>博客留言</title>
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
      <a href="leacots.jsp"  class="active">留言</a>
      <a href="album.jsp">相册</a>
      <a href="about.jsp">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="index.jsp">文章</a></li>
      <li class="layui-nav-item"><a href="whisper.jsp">微语</a></li>
      <li class="layui-nav-item"><a href="leacots.jsp"  class="active">留言</a></li>
      <li class="layui-nav-item"><a href="album.jsp">相册</a></li>
      <li class="layui-nav-item"><a href="about.jsp">关于</a></li>
    </ul>
    <p class="welcome-text">
        欢迎来到<span class="name">肖可爱</span>的博客~
    </p>
  </div>


  <div class="content whisper-content leacots-content">
    <div class="cont w1000">
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version">
              <div class="form-box">
                <img class="banner-img" src="<%=basePath%>/res/img/liuyan.jpg">
                <div class="form">
                  <form class="layui-form" action="">
                    <div class="layui-form-item layui-form-text">
                      <div class="layui-input-block">
                        <textarea name="desc" placeholder="既然来了，就说几句" class="layui-textarea"></textarea>
                      </div>
                    </div>
                    <div class="layui-form-item">
                      <div class="layui-input-block" style="text-align: right;">
                        <button class="layui-btn definite">確定</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              <div class="volume">
                全部留言 <span>10</span>
              </div>
              <div class="list-cont">        
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
                <div class="cont">
                  <div class="img">
                    <img src="<%=basePath%>/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                    <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久 不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
      <div id="demo" style="text-align: center;"></div>
    </div>
  </div>
  <script type="text/html" id="laytplCont">
    <div class="cont">
      <div class="img">
        {{#  if(d.avatar){ }}
        <img src="{{d.avatar}}" alt="">
        {{#  } else { }}
        <img src="<%=basePath%>/res/img/header.png" alt="">
        {{# } }}
      </div>
      <div class="text">
        <p class="tit"><span class="name">{{d.name}}</span><span class="data">2018/06/06</span></p>
        <p class="ct">{{d.cont}}</p>
      </div>
    </div>
  </script>
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
    }).use(['element','laypage','form','menu'],function(){
      element = layui.element,laypage = layui.laypage,form = layui.form,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
      menu.submit()
    })
  </script>
</body>
</html>