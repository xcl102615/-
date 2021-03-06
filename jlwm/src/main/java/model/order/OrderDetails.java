package model.order;

import project.model.BaseObject;

/****
 * 订单详情
 */
public class OrderDetails extends BaseObject {
    private String foodName;
    //    食品名称
    private Integer num;
    //    数量
    private Double price;
    //总价格
    private String img;
    //图片路径
    private Double unitPrice;
    //单价

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
