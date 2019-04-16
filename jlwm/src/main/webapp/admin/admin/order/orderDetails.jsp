<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../../header/admin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    p{
        font-size: large;
    }
</style>
<div style="width: 100%;padding-top:5%;text-align: center">
    <p>
        订单编号:${order.id}
    </p>
    <p>
        店铺名称:${order.name}
    </p>
    <p>
        创建时间:<fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
    </p>
    <p>
        订单描述:${order.description}
    </p>
    <p>
        用户编号:${order.user.id}
    </p>
    <p>
        店铺名称:${order.shop.name}
    </p>
    <p>
        配送费:${order.deliveryPrice}
    </p>
    <p>
        活动减免:${order.discountMoney}
    </p>
    <p>
        实付:${order.realPay}元
    </p>
    <p>
        总价:${order.totalPrice}元
    </p>
    <p>
        备注:${order.remarks}
    </p>
<br><br>
    <p>
        商品详情:
    </p>
    <table  class="table table-hover">
        <thead>
            <td>
                图片
            </td>
            <td>
               名称
            </td>
            <td>
                数量
            </td>
            <td>
                单价
            </td>
            <td>
               总价
            </td>
        </thead>
      <c:forEach var="t" items="${order.orderDetails}">
          <tr>
              <td>
                  <img src="<%=baseImgPath%>/${t.img}" style="width: 100px" height="100px"/>
              </td>
              <td>
                    ${t.foodName}
              </td>
              <td>
                      ${t.num}
              </td>
              <td>
                      ${t.unitPrice}元
              </td>
              <td>
                      ${t.price}元
              </td>
          </tr>
      </c:forEach>
    </table>
</div>