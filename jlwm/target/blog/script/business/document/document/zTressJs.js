var setting = {
    view: {
        selectedMulti: false
    },
    edit: {
        enable: true,
        showRemoveBtn: false,
        showRenameBtn: false
    },
    data: {
        keep: {
            parent:true,
            leaf:true
        },
        simpleData: {
            enable: true
        }
    },
    callback: {
        beforeDrag: beforeDrag,
        beforeRemove: beforeRemove,
        beforeRename: beforeRename,
        // onRemove: onRemove,
        beforeClick: beforeClick,
        onClick: onClick
    }
};

//id随机数
function generateMixed() {
    var res = "";
    var chars = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    for(var i = 0; i < 30 ; i ++) {
        var id = Math.ceil(Math.random()*35);
        res += chars[id];
    }
    return res;
}

var zNodes =[
    // { id:1, pId:0, name:"文档目录如下", open:true},
    // { id:11, pId:1, name:"目录名称 "}
];
var log, className = "dark";
function beforeDrag(treeId, treeNodes) {
    return false;
}
function beforeRemove(treeId, treeNode) {
    className = (className === "dark" ? "":"dark");
    // showLog("[ beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
    return confirm("确认删除  -- " + treeNode.name + " 目录吗？");
}
// function onRemove(e, treeId, treeNode) {
//     showLog("[  onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
// }
function beforeRename(treeId, treeNode, newName) {
    if (newName.length == 0) {
        alert("目录名称不能为空.");
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        setTimeout(function(){zTree.editName(treeNode)}, 10);
        return false;
    }
    return true;
}
function showLog(str) {
    if (!log) log = $("#log");
    log.append("<li class='"+className+"'>"+str+"</li>");
    if(log.children("li").length > 8) {
        log.get(0).removeChild(log.children("li")[0]);
    }
}
var treeName; //点击得到节点（目录）的name
var treeID;//点击得到节点（目录）的id
var treeSerial;
function beforeClick(treeId, treeNode, clickFlag) {
    className = (className === "dark" ? "":"dark");
    // showLog("[ "+getTime()+" beforeClick ]&nbsp;&nbsp;" + treeNode.name );
     treeName=treeNode.name;
     treeID=treeNode.id;
     $("#showName").html(treeName);
     $("#contentID").html(treeID);

    return (treeNode.click != false);
}
function onClick(event, treeId, treeNode, clickFlag) {
    // showLog("[ "+getTime()+" onClick ]&nbsp;&nbsp;clickFlag = " + clickFlag + " (" + (clickFlag===1 ? "普通选中": (clickFlag===0 ? "<b>取消选中</b>" : "<b>追加选中</b>")) + ")");
}

var newCount = 1;
var serialCount=1;
function add(e) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        isParent = e.data.isParent,
        nodes = zTree.getSelectedNodes(),
        treeNode = nodes[0];
    // if (treeNode) {
    //     treeNode = zTree.addNodes(treeNode, {id:(generateMixed()), pId:treeNode.id, isParent:isParent, name:"目录名称" + (newCount++),isNew:true});
    // }
    // else if(treeNode==null){
    //     alert("请点击文档目录进行添加！");
    // }
    // else if(!treeNode.isParent){
    //     alert("文档目录下无法添加目录！")
    // }
    // else {
        treeNode = zTree.addNodes(null, {id:(generateMixed()), pId:0, isParent:isParent, name:"任务名称" + (newCount++),isNew:true,serial:serialCount++});
    // }
    // if (treeNode) {
    //     zTree.editName(treeNode[0]);
    // }
    // else {
    //     alert("叶子节点被锁定，无法增加子节点");
    // }
    // else {
    //     alert("文档目录下无法添加目录！");
    // }
}
function edit() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getSelectedNodes(),
        treeNode = nodes[0];
    if (nodes.length == 0) {
        alert("请先选择需要编辑的目录名称!");
        return;
    }
    zTree.editName(treeNode);
}
function remove(e) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getSelectedNodes(),
        treeNode = nodes[0];
    if (nodes.length == 0) {
        alert("请选择需要删除的目录名称！");
        return;
    }
    var callbackFlag = $("#callbackTrigger").attr("checked");
    zTree.removeNode(treeNode, callbackFlag);
}
function clearChildren(e) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getSelectedNodes(),
        treeNode = nodes[0];
    if (nodes.length == 0 || !nodes[0].isParent) {
        alert("请先选择一个父节点");
        return;
    }
    zTree.removeChildNodes(treeNode);
}
$(document).ready(function(){
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    $("#addParent").bind("click", {isParent:true}, add);
    $("#addLeaf").bind("click", {isParent:false}, add);
    $("#edit").bind("click", edit);
    $("#remove").bind("click", remove);
    $("#clearChildren").bind("click", clearChildren);
});

