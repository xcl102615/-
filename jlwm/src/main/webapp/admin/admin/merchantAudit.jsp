<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../header/admin.jsp" %>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-light">
                            商户审核
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>商户id</th>
                                        <th>店铺名称</th>
                                        <th>法人姓名</th>
                                        <th>logo</th>
                                        <th>商户营业执照</th>
                                        <th>手机号</th>
                                        <th>创建时间</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script>
    $(function () {
        //加载待审核商铺
        doDataAll("<%=basePath%>/shop/findShop",{"status":"0"},function (data) {
           if(data.code>0){
               $.each(data.obj,function () {
                   $("#tbody").append(" <tr>\n" +
                       "                                        <td>"+this.user.id+"</td>\n" +
                       "                                        <td >"+this.name+"</td>\n" +
                       "                                        <td>"+this.user.name+"</td>\n" +
                       "                                        <td><img style='height: 60px' src='<%=baseImgPath%>/"+this.logo+"'/></td>\n" +
                       "                                        <td><img style='height: 60px' src='<%=baseImgPath%>/"+this.businessLicense+"'/></td>\n" +
                       "                                        <td>"+this.phone+"</td>\n" +
                       "                                        <td>"+this.createDate+"</td>\n" +
                       "                                        <td>"+this.status+"</td>\n" +
                       "                                        <td id="+this.id+"> <button class=\"btn btn-rounded btn-success\">通过</button><button class=\"btn btn-rounded btn-danger\">不通过</button></td>\n" +
                       "                                    </tr>")
               })
           }
        });

        //通过按钮
        $("#tbody").on("click",".btn-success",function () {
            var id=$(this).parent().attr("id");
            doDataAll("<%=basePath%>/shop/toExamine",{"id":id,"status":"1","description":"已通过"},function (data) {
                if(data.code>0){
                    alert("修改成功");
                    window.location.reload();
                }else{
                    alert("修改失败");
                }
            })
        })

        //不通过按钮
        $("#tbody").on("click",".btn-danger",function () {
            var id=$(this).parent().attr("id");
            doDataAll("<%=basePath%>/shop/toExamine",{"id":id,"status":"2","description":"未通过"},function (data) {
                if(data.code>0){
                    alert("修改成功");
                    window.location.reload();
                }else{
                    alert("修改失败");
                }
            })
        })
    })
</script>
