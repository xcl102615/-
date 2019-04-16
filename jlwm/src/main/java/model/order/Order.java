package model.order;

import model.address.Address;
import model.shop.Shop;
import model.user.User;
import project.model.BaseObject;

import java.util.Date;
import java.util.List;


/****
 * 订单
 */
public class Order extends BaseObject {
    private User user;
    //    用户
    private Shop shop;
    //    店铺
    private Integer userStatus;
    //    1 未支付 2 已支付
    private Integer shopStatus;
    //    1 未接单 2 已接单
    private Integer deliveryStatus;
    //  1.未接单 2 已接单 3. 已取件 4. 配送中 5.已送达
    private List<OrderDetails> orderDetails;
    //订单详情
    private Double deliveryPrice;
    //    配送费
    private Double discountMoney;
    //    活动减免
    private Double realPay;
    //    实际支付
    private Double totalPrice;
    //    总价
    private String remarks;
    //    备注
    private Address address;
    //    地址信息
    private String deliveryType;
    //    配送方式

    private Date paymentTime ;
    //付款时间
    private Date shopReceiptTime ;
    //商家接单时间;
    private Date deliveryReceiptTime;
    //骑手接单时间
    private Date serviceTime ;
    //骑手送达时间

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public Integer getShopStatus() {
        return shopStatus;
    }

    public void setShopStatus(Integer shopStatus) {
        this.shopStatus = shopStatus;
    }

    public Integer getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(Integer deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Double getDeliveryPrice() {
        return deliveryPrice;
    }

    public void setDeliveryPrice(Double deliveryPrice) {
        this.deliveryPrice = deliveryPrice;
    }

    public Double getDiscountMoney() {
        return discountMoney;
    }

    public void setDiscountMoney(Double discountMoney) {
        this.discountMoney = discountMoney;
    }

    public Double getRealPay() {
        return realPay;
    }

    public void setRealPay(Double realPay) {
        this.realPay = realPay;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getDeliveryType() {
        return deliveryType;
    }

    public void setDeliveryType(String deliveryType) {
        this.deliveryType = deliveryType;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getShopReceiptTime() {
        return shopReceiptTime;
    }

    public void setShopReceiptTime(Date shopReceiptTime) {
        this.shopReceiptTime = shopReceiptTime;
    }

    public Date getDeliveryReceiptTime() {
        return deliveryReceiptTime;
    }

    public void setDeliveryReceiptTime(Date deliveryReceiptTime) {
        this.deliveryReceiptTime = deliveryReceiptTime;
    }

    public Date getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
    }
}
