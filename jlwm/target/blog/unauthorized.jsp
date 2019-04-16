<%--
  Created by IntelliJ IDEA.
  User: JLTD-3003
  Date: 2019/1/11
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>未授权的操作,请<a href="<%=basePath%>login.jsp">登录</a>，或联系管理员</h1>
</body>
</html>
