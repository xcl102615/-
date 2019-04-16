package model.printer;

import java.util.Date;


public class Printer{
    private String id;

    private String shopId;
    //    店铺id
    private String sn;
    //    打印机SN码
    private String ukey;
    //    打印机key码
    private String phone;
    //    打印机手机号
    private String remarks;
    //    打印机名称
    private Integer times;
    //    每次打印次数
    private Integer status;
    //    1为正常显示，0为禁用
    private Date createTime=null;
    private Date updateTime=null;
    private Boolean autoPrint;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getUkey() {
        return ukey;
    }

    public void setUkey(String ukey) {
        this.ukey = ukey;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Boolean getAutoPrint() {
        return autoPrint;
    }

    public void setAutoPrint(Boolean autoPrint) {
        this.autoPrint = autoPrint;
    }
}
