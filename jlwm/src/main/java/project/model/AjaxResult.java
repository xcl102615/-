package project.model;

import java.io.Serializable;

/**
 * @author 张家健
 * @version V1.0
 * @Project: sso
 * @Package model
 * @Description: ajax 访问返回数据格式
 * @date 2019/1/2
 */
public class AjaxResult implements Serializable {
    private String code;
    private String msg;
    private Object obj=null;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public AjaxResult(){}
    public AjaxResult(String code,String msg,Object obj){
        this.code=code;
        this.msg=msg;
        this.obj=obj;
    }
    public AjaxResult(String code,String msg){
        this.code=code;
        this.msg=msg;
    }
    public static AjaxResult build(String code, String msg, Object obj){
        return new AjaxResult(code,msg,obj);
    }
    public static AjaxResult build(String code, String msg){
        return new AjaxResult(code,msg);
    }
}
