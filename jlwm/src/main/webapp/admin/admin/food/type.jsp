<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../../header/admin.jsp" %>
<div class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-light">
                    平台分类
                </div>
                <div class="col-md-1">
                    <button id="add" type="button" data-toggle="modal" data-target="#modal-4" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true">新增分类</span></button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>名称</th>
                                <th>图片</th>
                                <th>创建时间</th>
                                <th>状态</th>
                                <th>描述</th>
                                <th>启用状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="content">
                            <%--<tr>
                                <td>名称</td>
                                <td>图片</td>
                                <td>创建时间</td>
                                <td>状态</td>
                                <td>描述</td>
                                <td><button class="btn btn-rounded btn-info">修改</button><button class="btn btn-rounded btn-danger">禁用</button></td>
                            </tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary border-0">
                <h5 class="modal-title text-white">新增平台分类</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-5">
                <form action="<%=basePath%>/upload" enctype="multipart/form-data">
                    <input id="file" type="file" name="image" accept="image/*" style="display: none">
                </form>
                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">分类名称</label>
                        <input type="email" class="name form-control" id="exampleInputEmail1" placeholder="名称不能重复">
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label for="exampleInputFile">图片</label>--%>
                        <%--<input class="image" type="file" id="exampleInputFile">--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label  class="form-control-label">图片</label>
                        <input id="image" name="image" type="hidden" class="form-control" placeholder="请选择文件">
                        <img id="showImage" width="60px" height="60px"/>
                        <button type="button" id="btnFile">上传图片</button>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">描述</label>
                        <input type="email" class="description form-control" id="description" placeholder="">
                    </div>
                </form>
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-link" data-dismiss="modal">取消</button>
                <button id="submit" type="submit" class="btn btn-primary submitUpdate">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    function taskUI(task) {
        var str = "";
        if (task != null) {
            str += '<tr>\n' +
                '                                <td>'+number+++'</td>\n' +
                '                                <td>'+task.name+'</td>\n' +
                '                                <td><img src="<%=baseImgPath%>/'+ task.images + '" style="width: 50px" height="50px"></td>\n' +
                '                                <td>'+task.createDate+'</td>\n' +
                '                                <td>'+(task.status=="1"?"正常":"异常")+'</td>\n' +
                '                                <td>'+task.description+'</td>\n' +
                '                                <td>'+(task.canUse==true?"已启用":"已禁用")+'</td>\n' +
                '                                <td><button id='+task.id+' class="btn btn-rounded btn-info">修改</button><button id='+task.id+' class="btn btn-rounded btn-success">启用</button><button id='+task.id+' class="btn btn-rounded btn-danger">禁用</button></td>\n' +
                '                            </tr>'
            return str;
        }
    }
    $(function () {


        var parm=new Object()
        doDataAllAsc("<%=basePath%>/type/findTypeAdmin",parm,function (data) {
            console.info(data)
            $(data.obj).each(function () {
                $("#content").append(taskUI(this));
            })
        })

        /*************上传图片***************/
        function getObjectURL(file){
            var url=null
            if(window.createObjectURL!=undefined){ // basic
                url=window.createObjectURL(file)
            }else if(window.URL!=undefined){ // mozilla(firefox)
                url=window.URL.createObjectURL(file)
            }else if(window.webkitURL!=undefined){ // webkit or chrome
                url=window.webkitURL.createObjectURL(file)
            }
            return url  ;
        }

        $("#btnFile").click(function () {
            $("#file").click();
            var obj=$("#file").change(function () {
                var objUrl=getObjectURL(this.files[0]);
                var size=this.files[0].size;
                var formData = new FormData();
                formData.append("image",this.files[0]);
                $.ajax({
                    url:'<%=basePath%>/upload',
                    data:formData,
                    processData: false,
                    type:'post',
                    contentType:false,
                    success:function(data){
                        if (data.code>0){
                            $("#showImage").attr("src","<%=baseImgPath%>/"+data.obj[0]);
                            $("#image").val(data.obj[0]);
                        }else{
                            alert(data.msg);
                        }
                    }
                });

            });

        });
    })
    /*点击新增平台分类时清空数据*/
    $("body").on("click", "#add", function () {
        $(".name").val("");
        $("#showImage").attr("src","");
        $(".description").val("");
    })
    /*新增*/
    $("body").on("click", "#submit", function () {
          var type=new Object();
         type.name=$(".name").val();
         type.images= $("#image").val();
         type.description=$(".description").val();
         if($("#submit").html()=="提交"){
             doDataAllAsc("<%=basePath%>/type/addType",type,function (data) {
                 if(data.code>0){
                     alert("新增分类成功")
                     window.location.reload()
                 }
                 else {
                     alert("新增分类失败！")
                     window.location.reload()
                 }
             })
         }

    })
    /*修改*/
    $("body").on("click", "button.btn-info", function () {
        var parm=new Object()
        var id=$(this).attr("id");
        parm.id=id;
        doDataAllAsc("<%=basePath%>/type/findType",parm,function (data) {
            $(data.obj).each(function () {
                $("#submit").html("修改")
                $("h5").html("修改平台分类")
                $(".name").val(this.name);
                $("#showImage").attr("src","<%=baseImgPath%>"+this.images);
                $(".description").val(this.description);
            })
        })
        $("#modal-4").modal();

        $("body").on("click", "#submit", function () {
            var type=new Object();
            type.id=id;
            type.name=$(".name").val();
            type.images= $("#image").val();
            type.description=$(".description").val();
            if($("#submit").html()=="修改"){
                doDataAllAsc("<%=basePath%>/type/updateType",type,function (data) {
                    if(data.code>0){
                        alert("修改成功")
                        window.location.reload();
                    }
                    else {
                        alert("修改失败！")
                        window.location.reload();
                    }
                })
            }

        })

    })
    /*禁用*/
    $("body").on("click", "button.btn-danger", function (){
        var parm=new Object()
        var id=$(this).attr("id");
        parm.id=id;
        doDataAllAsc("<%=basePath%>/type/deleteType",parm,function (data) {
            if(data.code>0){
                alert("操作成功")
                window.location.reload();
            }
            else {
                alert("操作失败！")
                window.location.reload();
            }
        })
    })
    /*启用*/
    $("body").on("click", "button.btn-success", function (){
        var parm=new Object()
        var id=$(this).attr("id");
        parm.id=id;
        parm.canUse=true;
        doDataAllAsc("<%=basePath%>/type/updateType",parm,function (data) {
            if(data.code>0){
                alert("操作成功")
                window.location.reload();
            }
            else {
                alert("操作失败！")
                window.location.reload();
            }
        })
    })
    window.number = 1;//用于计算序号
</script>
