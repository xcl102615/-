<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../header/login.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>骑手注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">

  </head>
  <body>
    <div id="wrap"style="padding-top: 0%">
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span12">
          	<div class="row-fluid">
				<div class="widget container-narrow">
					<div class="widget-header">
						<i class="icon-edit"></i>
						<h5>创建新帐户</h5>
					</div>  
					<div class="widget-body clearfix" style="padding:25px;">
						<form  id="ff">

							<%--<div class="control-group ">--%>
								<%--<label for="name">用户名:</label>--%>
								<%--<div class="controls"><input class="btn-block" placeholder="请填写真实姓名" type="text" name="name" id="name"></div>--%>
							<%--</div>--%>
							<div class="control-group ">
								<label for="phone">手机号:</label>
								<div class="controls"><input class="btn-block" type="text" placeholder="请填写真实手机号" name="phone" id="phone"></div>
							</div>
							<div class="control-group ">
								<label for="password">密码:</label>
								<div class="controls"><input class="btn-block" type="password" placeholder="输入密码" name="password" id="password"></div>
							</div>
							<div class="control-group ">
								<label for="true_password">确认密码:</label>
								<div class="controls"><input class="btn-block" type="password" placeholder="再次确认密码" name="true_password" id="true_password"></div>
							</div>
							<div class="control-group ">
								<label for="bankCard">银行卡:</label>
								<div class="controls"><input class="btn-block" type="text" placeholder="填写有效银行卡号" name="bankCard" id="bankCard"></div>
							</div>
							<div class="control-group ">
								<label for="bankCardInfo">开户行地址:</label>
								<div class="controls"><input class="btn-block" type="text" placeholder="填写银行卡开户地址" name="bankCardInfo" id="bankCardInfo"></div>
							</div>
							<div class="control-group ">
								<label for="email">邮箱:</label>
								<div class="controls"><input class="btn-block" type="email" placeholder="填写邮箱地址" name="email" id="email"></div>
							</div>
							<button id="btnSave" type="submit" class="btn btn-large btn-block">注册</button>
						</form>
					</div>  
				</div>  
        	</div><!--/row-fluid-->
        </div><!--/span10-->
      </div><!--/row-fluid-->
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->

  </body>
  <script>
      $(function () {
          $("#true_password").blur(function(){
              if($("#true_password").val()!=$("#password").val()){
                  alert("密码不一致，请重新输入..")
			  }
		  })
          $("#btnSave").click(function () {
			  var user=new Object();
              //user.name=$("#name").val();
              user.phone=$("#phone").val();
              user.password=$("#password").val();
              user.bankCard=$("#bankCard").val();
              user.bankCardInfo=$("#bankCardInfo").val();
              user.email=$("#email").val();
              // if (!$("#ff").form('enableValidation').form('validate')) return false;
              // var obj=serializeArrayToObject("ff");//获取表单数据
              doDataAllAsc("<%=basePath%>/user/riderRegistration",user,function (data) {
				  if(data.code==1){
				      alert("注册成功,快去登录吧`")
				  }
				  else if(data.code==2){
				      alert("您已有骑手身份，快去登录吧")
				  }
				  else {
				      alert("注册失败，请重新注册");
				  }
              })
          })
      });
  </script>
</html>
