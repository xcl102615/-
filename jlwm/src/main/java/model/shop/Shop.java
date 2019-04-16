package model.shop;

import model.user.User;
import project.model.BaseObject;

import java.util.Date;


public class Shop extends BaseObject {
    private User user;
//    店铺所有者
    private String logo;
//    logo
    private Integer minFree;
//    最低消费
    private String distribution_type;
//    配送方式
    private String businessHours;
//    营业时间
    private String phone;
//    电话
    private String location;
//    地址
    private String latitude;
//    经度
    private String longitude;
//    维度
    private String text;
//    公告
    private Boolean isOpen;
//    是否营业 1.营业中 0.休息中
    private Double money;
//    收益
    private Double commonDeliveryPrice;
    //普通时段配送费
    private Double specialDeliveryPrice;
    //特殊时段配送费
    private Date specialTime=null;
    //特殊时间段，超出后使用特殊配送费
    private Integer monthSaleNum;

    private String legalPerson;//法人姓名

    private String bankId;//银行卡号

    private String openingBank;//开户行

    private String businessLicense;//营业执照

    private Integer list;  //店家排序 默认是 0  越大排序月前

    private Boolean autoReceiving;//false 禁用 true 启用

    //月销售数量
    public Integer getMonthSaleNum() {
        return monthSaleNum;
    }

    public void setMonthSaleNum(Integer monthSaleNum) {
        this.monthSaleNum = monthSaleNum;
    }
    public Date getSpecialTime() {
        return specialTime;
    }

    public void setSpecialTime(Date specialTime) {
        this.specialTime = specialTime;
    }

    public Double getCommonDeliveryPrice() {
        return commonDeliveryPrice;
    }

    public void setCommonDeliveryPrice(Double commonDeliveryPrice) {
        this.commonDeliveryPrice = commonDeliveryPrice;
    }

    public Double getSpecialDeliveryPrice() {
        return specialDeliveryPrice;
    }

    public Boolean getAutoReceiving() {
        return autoReceiving;
    }

    public void setAutoReceiving(Boolean autoReceiving) {
        this.autoReceiving = autoReceiving;
    }

    public void setSpecialDeliveryPrice(Double specialDeliveryPrice) {
        this.specialDeliveryPrice = specialDeliveryPrice;
    }

    public Integer getList() {
        return list;
    }

    public void setList(Integer list) {
        this.list = list;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Integer getMinFree() {
        return minFree;
    }

    public void setMinFree(Integer minFree) {
        this.minFree = minFree;
    }

    public String getDistribution_type() {
        return distribution_type;
    }

    public void setDistribution_type(String distribution_type) {
        this.distribution_type = distribution_type;
    }

    public String getBusinessHours() {
        return businessHours;
    }

    public void setBusinessHours(String businessHours) {
        this.businessHours = businessHours;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getOpen() {
        return isOpen;
    }

    public void setOpen(Boolean open) {
        isOpen = open;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    public String getOpeningBank() {
        return openingBank;
    }

    public void setOpeningBank(String openingBank) {
        this.openingBank = openingBank;
    }

    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }
}
