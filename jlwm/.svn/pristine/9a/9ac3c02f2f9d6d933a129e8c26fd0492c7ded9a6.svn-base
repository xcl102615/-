/**
 * 利用bootstrap-fileinput实现文件上传WebUI封装
 * Created by wph-pc on 2018/8/20.
 */
function KBUploadFile(url,fileId){
    this.url=url;
    this.fileId=fileId;
}
//文件传的服务器地址
KBUploadFile.prototype.url="";
KBUploadFile.prototype.fileId="";
/*
* 文件上传
* @param:fileId,上传的文件输入框的id,
* @param:callback回调函数，上传成功后处理的事情
* */
KBUploadFile.prototype.upload=function (callback) {
    var control = $('#' + this.fileId);

    //初始化上传控件的样式
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: this.url, //上传的地址
        showUpload: true, //是否显示上传按钮
        showCaption: true,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        theme: 'explorer',
        maxFileCount: 10, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
    });

    //导入文件上传完成之后的事件
    $('#' + this.fileId).on("fileuploaded", function (event, data, previewId, index) {
        console.dir(data);
        callback(data);
    });
};

KBUploadFile.prototype.OnSubmit=function () {
    $("#"+this.fileId).fileinput("upload");
};
