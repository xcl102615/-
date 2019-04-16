<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../../header/admin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-light">
                            轮播图&nbsp;&nbsp;&nbsp;<button id="id" class="btn btn-sm btn-primary browser">新增</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>名称</th>
                                        <th>创建时间</th>
                                        <th>状态</th>
                                        <th>描述</th>
                                        <th>图片</th>
                                        <th>跳转地址</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="photo" items="${list}">
                                            <tr>
                                                <td>${photo.id}</td>
                                                <td>${photo.name}</td>
                                                <td><fmt:formatDate value="${photo.createDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                                                <td>${photo.status}</td>
                                                <td>${photo.description}</td>
                                                <td><img src="<%=baseImgPath%>/${photo.image}" width="132px" height="124px"/> </td>
                                                <td>${photo.url}</td>
                                                <td>
                                                    <button id="${photo.id}" class="btn btn-rounded btn-primary browser">编辑</button>
                                                    <button id="${photo.id}" class="btn btn-rounded btn-danger delete">删除</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(".browser").click(function () {
                var id =$(this).attr("id");
                window.open("<%=basePath%>/admin/user/goEditCarousel/"+id);
            });
            $(".delete").click(function () {
                var id =$(this).attr("id");
                var param=new Object();
                param.id=id;
                doDataAll("<%=basePath%>/carousel/deleteCarousel",param,function (data) {
                    if (data.code>0){
                        alert("删除成功");
                        location.reload();
                    }else {
                        alert("删除失败");
                    }
                });
            });
        </script>
