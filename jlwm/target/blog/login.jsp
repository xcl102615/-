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
    <form action="<%=basePath%>login" method="post">
        userName<input type="text" name="name"><br>
        password<input type="password" name="password"><br>
        <input type="submit" value="login">
    </form>

</body>
</html>
