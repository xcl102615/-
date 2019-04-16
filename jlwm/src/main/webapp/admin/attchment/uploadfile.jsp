<%--
  Created by IntelliJ IDEA.
  User: wph-pc
  Date: 2017/10/12
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/header/init_bootstrap.jsp"%>
<html>
<head>
    <title>文件上传</title>
    <link href="<%=basePath%>/plugins/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="<%=basePath%>/plugins/bootstrap-fileinput/js/fileinput.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/plugins/bootstrap-fileinput/js/plugins/piexif.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/plugins/bootstrap-fileinput/js/locales/zh.js" type="text/javascript"></script>
    <script src="<%=basePath%>/plugins/bootstrap-fileinput/js/uploadfile.js" type="text/javascript"></script>
    </head>
<body style="padding: 10px;">
<div style="height: 300px;">
    <form enctype="multipart/form-data">
        <input type="file" name="file" id="uploadfile" multiple class="file-loading" />
    </form>
</div>

<script>

    $(document).ready(function () {
        var file=new KBUploadFile(getRootPath()+"/uploadfile","uploadfile");
        file.upload(function (data) {
            console.info(data);
        });

    });
</script>
</body>
</html>
