<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/login.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>商户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">

</head>
<body>
<div id="wrap" style="margin-top: 0px">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="row-fluid">
                    <div class="widget container-narrow">
                        <div class="widget-header" style="margin-top: 0px">
                            <i class="icon-edit"></i>
                            <h5>创建新帐户</h5>
                        </div>

                        <div class="widget-body clearfix" style="padding:25px;">
                            <form action="<%=basePath%>/upload" enctype="multipart/form-data">
                                <input id="file" type="file" name="image" accept="image/*" style="display: none">
                            </form>
                            <form action="<%=basePath%>/upload" enctype="multipart/form-data">
                                <input id="file2" type="file" name="image" accept="image/*" style="display: none">
                            </form>
                            <form id="ff">
                                <div class="control-group ">
                                    <label for="name">店铺名称:</label>
                                    <div class="controls"><input class="btn-block" placeholder="店铺名称" type="text"
                                                                 name="name" id="name"></div>
                                </div>
                                <div class="control-group ">
                                    <label for="legalPerson">法人姓名:</label>
                                    <div class="controls"><input class="btn-block" placeholder="请填写银行卡真实姓名" type="text"
                                                                 name="legalPerson" id="legalPerson"></div>
                                </div>
                                <div class="control-group ">
                                    <label for="phone">手机号:</label>
                                    <div class="controls"><input class="btn-block" type="text" placeholder="请填写真实手机号"
                                                                 name="phone" id="phone"></div>
                                </div>

                                <div class="form-group">
                                    <label class="form-control-label">LOGO:</label>
                                    <input id="image" name="image" type="hidden" class="form-control"
                                           placeholder="请选择文件">
                                    <img id="showImage" width="60px" height="60px"/>
                                    <button type="button" id="btnFile">上传图片</button>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label">营业执照:</label>
                                    <input id="image2" name="image" type="hidden" class="form-control"
                                           placeholder="请选择文件">
                                    <img id="showImage2" width="60px" height="60px"/>
                                    <button type="button" id="btnFile2">上传图片</button>
                                </div>

                                <div class="control-group ">
                                    <label for="businessHours">营业时间:</label>
                                    <div class="controls"><input class="btn-block" type="text"
                                                                 placeholder="如格式：7:00-20:00" name="businessHours"
                                                                 id="businessHours"></div>
                                </div>
                                <div class="control-group ">
                                    <label for="bankId">银行卡:</label>
                                    <div class="controls"><input class="btn-block" type="text" placeholder="填写有效银行卡号"
                                                                 name="bankId" id="bankId"></div>
                                </div>
                                <div class="control-group ">
                                    <label for="openingBank">开户行地址:</label>
                                    <div class="controls"><input class="btn-block" type="text" placeholder="填写银行卡开户地址"
                                                                 name="openingBank" id="openingBank"></div>
                                </div>
                                <div class="control-group ">
                                    <label for="location">店铺地址:</label>
                                    <div class="controls"><input class="btn-block" type="text" placeholder="填写店铺所在位置"
                                                                 name="location" id="location"></div>
                                </div>
                                <div class="control-group ">
                                    <label for="description">店铺描述:</label>
                                    <div class="controls"><input class="btn-block" type="text" placeholder="填写店铺描述"
                                                                 name="description" id="description"></div>
                                </div>
                                <button id="btnSave" type="submit" class="btn btn-large btn-block">注册</button>
                            </form>
                        </div>
                    </div>
                </div><!--/row-fluid-->
            </div><!--/span10-->
        </div><!--/row-fluid-->
    </div><!--/.fluid-container-->
</div><!-- wrap ends-->

</body>
<script>
    $(function () {

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

        /*************上传logo图片***************/
        $("#btnFile").click(function () {
            $("#file").click();
            var obj = $("#file").change(function () {
                var objUrl = getObjectURL(this.files[0]);
                var size = this.files[0].size;
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
                            $("#showImage").attr("src", "<%=baseImgPath%>/" + data.obj[0]);
                            $("#image").val(data.obj[0]);
                        } else {
                            alert(data.msg);
                        }
                    }
                });

            });

        });
        /*************上传营业执照图片***************/
        $("#btnFile2").click(function () {
            $("#file2").click();
            var obj = $("#file2").change(function () {
                var objUrl = getObjectURL(this.files[0]);
                var size = this.files[0].size;
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
                            $("#showImage2").attr("src", "<%=baseImgPath%>/" + data.obj[0]);
                            $("#image2").val(data.obj[0]);
                        } else {
                            alert(data.msg);
                        }
                    }
                });

            });

        });
        // $("#true_password").blur(function () {
        //     if ($("#true_password").val() != $("#password").val()) {
        //         alert("密码不一致，请重新输入..")
        //     }
        // })
        $("#btnSave").click(function () {
            var shop = new Object();
            shop.name = $("#name").val();
            shop.legalPerson = $("#legalPerson").val();
            shop.phone = $("#phone").val();
            shop.logo = $("#image").val();
            shop.businessLicense = $("#image2").val();
            shop.bankId = $("#bankId").val();
            shop.openingBank = $("#openingBank").val();
            shop.businessHours = $("#businessHours").val();
            shop.location = $("#location").val();
            shop.description = $("#description").val();
            shop.commonDeliveryPrice="3";
            shop.specialDeliveryPrice="4";
            shop.distribution_type="计里配送"
            // if (!$("#ff").form('enableValidation').form('validate')) return false;
            // var obj=serializeArrayToObject("ff");//获取表单数据
            doDataAllAsc("<%=basePath%>/shop/addShop", shop, function (data) {
                if (data.code > 0) {
                    alert("注册成功,快去登录吧`")
                }
                else {
                    alert("注册失败");
                }
            })
        })
    });
</script>
</html>
