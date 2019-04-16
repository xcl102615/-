//将表单对象序列化成object对象
function serializeFormToObject(form){
    var o={};
    $.each(form.serializeArray(),function(index){
        if(o[this['name']]){
            o[this['name']] = o[this['name']]+","+this['value'];
        }else{
            o[this['name']] = this['value'];
        }
    });
    return o;
}