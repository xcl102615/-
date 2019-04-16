<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../header/admin.jsp" %>
<div class="content">
    <div style="padding-top: 2%" class="col-md-12">
        <div class="card">
            <div class="card-header bg-light">
                所有商品列表
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="content" class="table table-hover">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">食品规格详情</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td>序号</td>
                            <th>规格名称</th>
                            <th>价格</th>
                            <th>上传时间</th>
                        </tr>
                        </thead>
                        <tbody id="content2">
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>
<script>

    function foodFormatsUI(foodFormats) {
        var str = "";
        if (foodFormats != null) {
            str += '<tr>\n' +
                '                                            <td>' + number++ + '</td>\n' +
                '                                            <td>' + foodFormats.name + '</td>\n' +
                '                                            <td class="text-nowrap">' + foodFormats.price + '</td>\n' +
                '                                            <td>' + foodFormats.createDate + '</td>\n' +
                '\n' +
                '                                        </tr>'
            return str;
        }
    }

    $(function () {
        //遍历所有商品信息
        $('#content').bootstrapTable({
            method: 'post',
            url: "<%=basePath%>/food/findAllFood",//请求路径
            striped: true, //是否显示行间隔色
            search: true,//启用搜索
            undefinedText: "空",
            data_local: "zh-US",//表格汉化
            pageNumber: 1, //初始化加载第一页
            pagination: true,//是否分页
            sidePagination: 'client',//server:服务器端分页|client：前端分页
            pageSize: 5,//单页记录数
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
                title: '食品图片',
                field: 'image',
                sortable: true,
                formatter: image,//对资源进行操作
            }, {
                title: '食品名称',
                field: 'name',
                sortable: true
            }, {
                title: '上传时间',
                field: 'createDate',
                sortable: true
            }, {
                title: '所属店铺',
                field: 'shop.name',
                sortable: true,
                //formatter: shop,
            }, {
                title: '所属分类',
                field: 'foodType.name',
                sortable: true
            }, {
                title: '所属平台分类',
                field: 'type.name',
                sortable: true,

            }, {
                title: '食品价格',
                field: 'price',
                sortable: true,

            }, {
                title: '月销售',
                field: 'monthSaleNum',
                sortable: true,

            }, {
                title: '销售总量',
                field: 'saleCount',
                sortable: true,

            }, {
                title: '库存',
                field: 'number',
                sortable: true,

            }, {
                title: '状态',
                field: 'status',
                sortable: true,
                formatter: function (value, row, index) {
                    if (row['status'] == 1) {
                        return '上架';
                    }
                    if (row['status'] == 0) {
                        return '下架';
                    }
                    return value;
                }

            }, {
                title: '操作',
                field: 'id',
                formatter: operation,//对资源进行操作
            }],
            responseHandler: function (data) {
                return data.obj;
            }
        });

        //删除、编辑操作
        function operation(value, row, index) {
            var htm = '<div id=' + value + '><button id="' + row['id'] + '" class="btn btn-rounded btn-success">规格详情</button></div>'
            return htm;
        }

        function image(value, row, index) {
            var htm = '<img src="<%=baseImgPath%>/' + value + '" style="width: 50px" height="50px"/>'
            return htm;
        }


        /*关闭事件*/
        $("body").on("click", "button.btn-link", function () {
            $("#content2").empty();
        })
        $("body").on("click", "button.close", function () {
            $("#content2").empty();
        })
        /*查看详情*/
        $("body").on("click", "button.btn-success", function () {
            var id = $(this).attr("id");
            var food = new Object();
            food.id = id;
            doDataAllAsc("<%=basePath%>/food/findFoodById", food, function (data) {
                $(data.obj.foodFormats).each(function () {
                    $("#content2").append(foodFormatsUI(this));
                })
            })
            $('#modal-2').modal();

        })
    })

    window.number = 1;//用于计算序号
</script>
