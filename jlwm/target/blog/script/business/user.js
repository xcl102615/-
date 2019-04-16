/**
 * Created by wph-pc on 2017/10/10.
 */

var jxmstc=new KBOperate("user");


function getMenu(value, rowData, rowIndex) {

    var str =  "&nbsp;&nbsp;"+"<i class='layui-icon' id='setUp' style='cursor:pointer;color:rgb(0,150,36)' type='setUp' valueId='" + rowData.id + "' name='" + rowData.name + "' title='详情'>&#xe614;</i>";
    $("i[type=setUp]").live("click",function () {
        var obj=new Object();
        obj.id=$(this).attr("valueId");
        obj.name=$(this).attr("name");
        obj.button=this;
        location.href="itemindex?id="+obj.id;
    });
    return jxmstc.formateOperateForEasyui(value, rowData, rowIndex)+str;
}

function getCondition() {
    var obj = new Object();
    obj.name = $("#txtName").val();
    return obj;
}
function find() {
    jxmstc.findForEasyui("duser",getCondition());
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
        var toUrl=getRootPath()+"/user/uioperate?type=2&id="+obj.id;
        layer.open({
            title:'实训任务分组浏览',
            type: 2,
            area:["100%","100%"],
            content: toUrl
        });
    });

    jxmstc.editForEasyui(function (obj) {
        var toUrl=getRootPath()+"/user/uioperate?type=1&id="+obj.id;
        layer.open({
            title:'实训任务分组修改',
            type: 2,
            area:["100%","100%"],
            content: toUrl
        });
    });
    jxmstc.delForEasyui("您确定删除当前选中的信息吗？",function (data) {
        if (data.code>0){
            layer.msg("删除成功！");
            jxmstc.findForEasyui("duser",getCondition());
        }else
        {
            layer.msg("删除失败，数据在使用中...！");
        }
    });

    $("#btnAdd").click(function () {
        var toUrl=getRootPath()+"/user/uioperate?type=0";
        layer.open({
            title:'实训任务分组新增',
            type: 2,
            area:["100%","100%"],
            content: toUrl
        });
    });
    $("#btnLoadData").click(function () {
        $("#uploadExcelFile").click();
    });

    $("#btnDeleteAll").click(function () {
        var ids=jxmstc.getEasyuiGridSelectRowsID("duser");
        if (ids=="") return;
        var flag=confirm("删除后数据不可回复，您确定删除选中的实训主题信息吗？");
        if (flag==false) return;
        var obj=new Object();
        obj.ids=ids;
        jxmstc.do("deleteAll",obj,function (data) {
            if (data.code>0)
            {
                layer.msg("您选中的实训任务分组信息已经删除！");
                find();
            }
            else
            {
                layer.msg("您选中的实训任务分组信息删除失败，错误代码："+data.code);
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


