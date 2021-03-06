<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/admin.jsp" %>
<div class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-light">
                    所有店铺查看
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table id="mytab" class="table table-hover">

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><img id="img" src=""></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <form id="form">
                <div class="modal-body">
                    <div class="row">
                        <label class="col-sm-2 control-label">店铺id</label>
                        <div name="id" class="col-sm-10">

                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">是否营业中</label>
                        <div name="open" class="col-sm-10">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">余额</label>
                        <div name="money" class="col-sm-10">

                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">店铺名称</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="name"
                                   placeholder="店铺名称">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">店铺logo</label>
                        <div class="col-sm-10">
                            <img name="logo" style="height: 60px">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">营业执照</label>
                        <div class="col-sm-10">
                            <img name="businessLicense" style="height: 60px">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">营业时间段</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="businessHours"
                                   placeholder="营业时间段">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="phone"
                                   placeholder="电话">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">普通配送费</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="commonDeliveryPrice"
                                   placeholder="普通配送费">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">特殊配送费</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="specialDeliveryPrice"
                                   placeholder="特殊配送费">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">起送价</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="minFree"
                                   placeholder="起送价">
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2 control-label">简介</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="text"
                                   placeholder="简介">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">法人姓名</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="legalPerson"
                                   placeholder="法人姓名">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">银行卡号</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="bankId"
                                   placeholder="银行卡号">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label">开户行</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="openingBank"
                                   placeholder="开户行">
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" style="width: 50%;" class="form-control" name="location"
                                   placeholder="地址">
                        </div>
                    </div>


                </div>
            </form>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">关闭</button>
                <button id="sumbit" type="button" class="btn btn-info">保存</button>
            </div>
        </div>
    </div>
</div>
<form enctype="multipart/form-data">
    <input id="file" type="file" name="image" accept="image/*" style="display: none">
</form>

<form enctype="multipart/form-data">
    <input id="file1" type="file" name="image" accept="image/*" style="display: none">
</form>
<script>
    $(function () {
        //遍历所有商户信息
        $('#mytab').bootstrapTable({
            method: 'post',
            url: "<%=basePath%>/shop/findShop",//请求路径
            striped: true, //是否显示行间隔色
            pageNumber: 1, //初始化加载第一页
            pagination: true,//是否分页
            sidePagination: 'client',//server:服务器端分页|client：前端分页
            pageSize: 10,//单页记录数
            pageList: [5, 10, 20, 30],//可选择单页记录数
            showRefresh: true,//刷新按钮
            queryParams: function (params) {//上传服务器的参数
                var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
                    limit: params.limit, // 每页显示数量
                    offset: params.offset// SQL语句起始索引
                    //page : (params.offset / params.limit) + 1, //当前页码

                    // Name : $('#search_name').val(),
                    // Tel : $('#search_tel').val()
                };
                return temp;
            },
            columns: [{
                title: '商户号',
                field: 'id',
                sortable: true
            }, {
                title: '店铺名',
                field: 'name',
                sortable: true
            }, {
                title: '电话',
                field: 'phone',
                sortable: true
            }, {
                title: '余额',
                field: 'money',
                sortable: true
            }, {
                title: '状态',
                field: 'status',
                sortable: true
            }, {
                title: '启用与禁用',
                field: 'canUse',
                sortable: true,
                formatter: formatCanUse,//对返回的数据进行处理再显示
            }, {
                title: '操作',
                field: 'id',
                formatter: operation,//对资源进行操作
            }],
            responseHandler: function (data) {
                return data.obj;
            }
        })

        //value 为1为启用0为禁用
        function formatCanUse(value, row, index) {
            return value==1?"启用":"禁用";
        }


        //删除、编辑操作
        function operation(value, row, index) {
            var htm ='<div id='+value+'><button class=\"btn btn-rounded btn-success\">启用</button><button class=\"btn btn-rounded btn-danger\">禁用</button><button class=\"btn btn-rounded btn-primary\">详情</button></div>'
            return htm;
        }

        //查询按钮事件
        $('#search_btn').click(function () {
            $('#mytab').bootstrapTable('refresh', {
                url: '<%=basePath%>/shop/findShop'
            });
        })

        //启用
        $("#mytab").on("click", ".btn-success", function () {
            var id = $(this).parent().attr("id");
            doDataAll("<%=basePath%>/shop/shopSwitch", {"id": id, "canUse": true}, function (data) {
                if (data.code > 0) {
                    alert("启用成功");
                    window.location.reload();
                } else {
                    alert("启用失败");
                }
            })
        })

        //禁用
        $("#mytab").on("click", ".btn-danger", function () {
            var id = $(this).parent().attr("id");
            doDataAll("<%=basePath%>/shop/shopSwitch", {"id": id, "canUse": false}, function (data) {
                if (data.code > 0) {
                    alert("禁用成功");
                    window.location.reload();
                } else {
                    alert("禁用失败");
                }
            })
        })

        //详情
        $("#mytab").on("click", ".btn-primary", function () {
            var id = $(this).parent().attr("id");
            doDataAll("<%=basePath%>/shop/findShop", {"id": id}, function (data) {
                if (data.code > 0) {
                    $("[name='id']").text(data.obj[0].id);
                    $("[name='name']").val(data.obj[0].name);
                    $("[name='logo']").attr("src", "<%=baseImgPath%>/" + data.obj[0].logo);
                    $("[name='businessLicense']").attr("src", "<%=baseImgPath%>/" + data.obj[0].businessLicense);
                    $("[name='businessHours']").val(data.obj[0].businessHours);
                    $("[name='phone']").val(data.obj[0].phone);
                    $("[name='commonDeliveryPrice']").val(data.obj[0].commonDeliveryPrice);
                    $("[name='specialDeliveryPrice']").val(data.obj[0].specialDeliveryPrice);
                    $("[name='minFree']").val(data.obj[0].minFree);
                    $("[name='open']").text(data.obj[0].open == true ? "是" : "否");
                    $("[name='text']").val(data.obj[0].text);
                    $("[name='legalPerson']").val(data.obj[0].legalPerson);
                    $("[name='bankId']").val(data.obj[0].bankId);
                    $("[name='openingBank']").val(data.obj[0].openingBank);
                    $("[name='money']").text(data.obj[0].money);
                    $("[name='location']").val(data.obj[0].location);

                    $("[name='logo']").val(data.obj[0].logo);
                    $("[name='businessLicense']").val(data.obj[0].businessLicense);
                }
            })

            $("#modal-2").modal();
        })

        /*************上传图片***************/
        function getObjectURL(file) {
            var url = null
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file)
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file)
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file)
            }
            return url;
        }

        //logo
        $("[name='logo']").click(function () {
            $("#file").click();
            $("#file").change(function () {
                var formData = new FormData();
                formData.append("image", this.files[0]);
                $.ajax({
                    url: '<%=basePath%>/upload',
                    data: formData,
                    processData: false,
                    type: 'post',
                    contentType: false,
                    success: function (data) {
                        if (data.code > 0) {
                            $("[name='logo']").attr("src", "<%=baseImgPath%>/" + data.obj[0]);
                            $("[name='logo']").val(data.obj[0]);
                        } else {
                            alert(data.msg);
                        }
                    }
                });

            });
        })
        //营业执照
        $("[name='businessLicense']").click(function () {
            $("#file1").click();
            $("#file1").change(function () {
                var formData = new FormData();
                formData.append("image", this.files[0]);
                $.ajax({
                    url: '<%=basePath%>/upload',
                    data: formData,
                    processData: false,
                    type: 'post',
                    contentType: false,
                    success: function (data) {
                        if (data.code > 0) {
                            $("[name='businessLicense']").attr("src", "<%=baseImgPath%>/" + data.obj[0]);
                            $("[name='businessLicense']").val(data.obj[0]);
                        } else {
                            alert(data.msg);
                        }
                    }
                });

            });
        })

        //保存
        $("#sumbit").click(function () {
            var obj = serializeArrayToObject("form");
            obj.id = $("[name='id']").text();
            obj.logo = $("[name='logo']").val();
            obj.businessLicense = $("[name='businessLicense']").val();
            doDataAll("<%=basePath%>/shop/updateShop", obj, function (data) {
                if (data.code > 0) {
                    alert("保存成功");
                    $('#modal-2').modal('hide');
                } else {
                    alert("修改失败");
                }
            })
        })
    })
</script>
