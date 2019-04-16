<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../../header/admin.jsp" %>
<div class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-light">
                    用户刚下单(商户未接单)列表
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
                            </tr>
                            </thead>
                            <tbody id="content">
                            <%--<tr>
                                <td>订单编号</td>
                                <td>订单名称</td>
                                <td>创建时间</td>
                                <td>配送费</td>
                                <td>活动减免</td>
                                <td>订单金额</td>
                                <td>实际支付</td>
                                <td>订单状态</td>
                            </tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function taskUI(task) {
        var str = "";
        if (task != null) {
            str += '<tr>\n' +
                '                                <td>'+task.id+'</td>\n' +
                '                                <td>'+task.name+'</td>\n' +
                '                                <td>'+task.createDate+'</td>\n' +
                '                                <td>'+task.deliveryPrice+'元</td>\n' +
                '                                <td>'+task.discountMoney+'元</td>\n' +
                '                                <td>'+task.totalPrice+'元</td>\n' +
                '                                <td>'+task.realPay+'元</td>\n' +
                '                                <td>'+task.status+'</td>\n' +
                '<td> <button id="'+task.id+'" class="btn  btn-success browser">查看</button> </td>\n' +
                '                            </tr>'
            return str;
        }
    }
    $(function () {

        doDataAllAsc("<%=basePath%>/order/freshOrder","",function (data) {
            console.info(data)
            $(data.obj).each(function () {
                $("#content").append(taskUI(this));
            })
        })
        $(".browser").click(function () {
            var id =$(this).attr("id");
            window.open("<%=basePath%>/admin/user/getOrderDetails/"+id);
        });
        /*$("body").on("click","button.btn-danger",function () {
            var id=$(this).attr("id");
            var user=new Object();
            user.id=id;
            if(confirm("确定禁用该员工?\n确定操作后默认该员工已离职！")){
                doDataAllAsc("<%=basePath%>/user/delRoleForDelivery",user,function (data) {
                    if(data.code>0){
                        alert("已禁用")
                        window.location.reload();
                    }
                    else{
                        alert("操作失败！")
                        window.location.reload();
                    }
                })
            }
        })*/
    })
</script>
