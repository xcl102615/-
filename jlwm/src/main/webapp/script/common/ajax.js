function doDataAll(url,param,callback) {
    $.ajax({
        type:"post",
        url:url,
        cache:false,
        async:true,
        contentType:"application/json;charset=utf-8",
        data:JSON.stringify(param),
        dataType:"json",
        success:callback,
        error:function (XMLHttpRequest,textStatus, errorThrown) {
            alert("请求数据失败..");
            console.info(textStatus);
        }
    });
}
function doDataAllAsc(url,param,callback) {
    $.ajax({
        type:"post",
        url:url,
        cache:false,
        async:false,
        contentType:"application/json;charset=utf-8",
        data:JSON.stringify(param),
        dataType:"json",
        success:callback,
        error:function (XMLHttpRequest,textStatus, errorThrown) {
            alert("请求数据失败..");
            console.info(textStatus);
        }
    });
}
