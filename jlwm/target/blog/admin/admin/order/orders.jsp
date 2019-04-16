<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../../header/admin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-light">
                            所有订单
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>订单名称</th>
                                        <th>创建时间</th>
                                        <th>配送费</th>
                                        <th>活动减免</th>
                                        <th>订单金额</th>
                                        <th>实际支付</th>
                                        <th>订单状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td>${order.id}</td>
                                                <td>${order.name}</td>
                                                <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                                                <td>${order.deliveryPrice}</td>
                                                <td>${empty order.discountMoney?0.0:order.discountMoney}</td>
                                                <td>${order.totalPrice}</td>
                                                <td>${order.realPay}</td>
                                                <td>${order.status}</td>
                                                <td>
                                                    <button id="${order.id}" class="btn  btn-success browser">查看</button>
                                                    <button id="${order.id}" class="btn  btn-danger delete">删除</button>
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
                window.open("<%=basePath%>/admin/user/getOrderDetails/"+id);
            });
            $(".delete").click(function () {
                var id =$(this).attr("id");
                doDataAll("<%=basePath%>/admin/user/deleteOrder/"+id,null,function (data) {
                    if (data.code>0){
                        alert("删除成功");
                    }else {
                        alert("删除失败");
                    }
                });
            });
        </script>
