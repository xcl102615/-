var jxmstc=new KBOperate("document");
var id=getURLParamValue("id");//document的id

function getCondition() {
    var obj = {};
    obj.name = $("#txtName").val();
    return obj;
}
function find() {
    jxmstc.getMe(id,function (data) {
        $("#dgCatalog").datagrid("loadData",data.items)
    })
}
function doUploadExcel() {
    doUploadFile("uploadfile","frmUploadExcel",null,function (path){
         jxmstc.do("loadData",path[0],function (data) {
             //编写上传的前后台代码
             alert(data.obj);
         });
    });
}
layui.use(['layer'],function () {
        var layer=layui.layer;
    find();
    jxmstc.browserForEasyui(function (obj) {
        var toUrl=getRootPath()+"/document/catalog?type=2&id="+obj.id+"&Did="+id;
        layer.open({
            title:'文档浏览',
            type: 2,
            area:["100%","100%"],
            content: toUrl
        });
    });

    jxmstc.editForEasyui(function (obj) {
        var toUrl=getRootPath()+"/document/catalog?type=1&id="+obj.id+"&Did="+id;
        layer.open({
            title:'文档修改',
            type: 2,
            area:["100%","100%"],
            content: toUrl
        });
    });
    // jxmstc.delForEasyui("您确定删除当前选中的信息吗？",function (data) {
    //     if (data.code>0){
    //         layer.msg("删除成功！");
    //         jxmstc.findForEasyui("dgCatalog",getCondition());
    //     }else
    //     {
    //         layer.msg("删除失败，数据在使用中...！");
    //     }
    // });
    //catalog的删除
    $("i[type=del]").live("click",function () {
        var catalogObj={};
        var data={};
        data.id=$(this).attr("valueId");
        console.log(data.id);
        catalogObj.items=[];
        catalogObj.items.push(data);
        var tips="删除后数据不可恢复，确定吗？";
        var flag=confirm(tips);
        if (flag)
        {
            doData("document/removeCatalog",catalogObj,function (data) {
                if (data.code>0){
                    layer.msg("删除成功！");
                    find();
                }else
                {
                    layer.msg("删除失败，数据在使用中...！");
                }
            });
        }
    });

    $("#btnAdd").click(function () {
        var toUrl=getRootPath()+"/document/document?type=0&Did="+id;
        layer.open({
            title:'文档新增',
            type: 2,
            area:["100%","100%"],
            content: toUrl
        });
    });
    $("#btnLoadData").click(function () {
        $("#uploadExcelFile").click();
    });

    $("#btnDeleteAll").click(function () {
        var ids=jxmstc.getEasyuiGridSelectRowsID("dgCatalog");
        if (ids=="") return;
        var flag=confirm("删除后数据不可回复，您确定删除选中的实训主题信息吗？");
        if (flag==false) return;
        var obj={};
        obj.ids=ids;
        jxmstc.do("deleteAll",obj,function (data) {
            if (data.code>0)
            {
                layer.msg("您选中的文档信息已经删除！");
                find();
            }
            else
            {
                layer.msg("您选中的文档信息删除失败，错误代码："+data.code);
            }
        });
    });
    $("#btnFind").click(function () {
        find();
    });

    $("#btnDownLoad").click(function () {
        $("#txtHName").val("");
        $("#frmDownloadExcel").form().submit();
    });
});


