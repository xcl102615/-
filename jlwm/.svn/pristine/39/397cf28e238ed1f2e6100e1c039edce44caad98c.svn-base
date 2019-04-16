<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../../header/admin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-light">
                    骑手提现列表
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>提现编号</th>
                                <%--<th>名称</th>--%>
                                <th>创建时间</th>
                                <th>金额</th>
                                <th>状态</th>
                                <th>描述</th>
                                <th>用户</th>
                                <%--<th>订单编号</th>--%>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${list}">
                                <tr>
                                    <td>${item.id}</td>
                                    <%--<td>${item.name}</td>--%>
                                    <td><fmt:formatDate value="${item.createDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                                    <td>${item.money}</td>
                                    <td>${item.status}</td>
                                    <td>${item.description}</td>
                                    <td>${item.user.name}</td>
                                    <%--<td>${item.order.id}</td>--%>
                                    <c:if test="${item.status eq '待审核'}">
                                        <td>
                                            <button id="${item.id}" class="btn btn-rounded btn-primary browser">完成交易</button>
                                        </td>
                                    </c:if>
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