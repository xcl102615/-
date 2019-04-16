package model.foodType;

import project.model.BaseObject;

public class FoodType  extends BaseObject {
    private String typeId;
    //    属于 主食 小吃...
    private String shopId;
    // 属于哪家店铺
    private  Integer num;
    //排序
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }
}
