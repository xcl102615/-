package model.address;

import model.user.User;
import project.model.BaseObject;

public class Address extends BaseObject {
    private User user;
    //    用户Id
    private String phone;
    //    手机
    private Boolean isDefault;
    //默认地址
    private String location;
    //    地址
    private String latitude;
    //    经度
    private String longitude;
    //    纬度

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getDefault() {
        return isDefault;
    }

    public void setDefault(Boolean aDefault) {
        isDefault = aDefault;
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
}
