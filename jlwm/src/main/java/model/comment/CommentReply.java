package model.comment;

import model.shop.Shop;
import model.user.User;
import project.model.BaseObject;

/**
 * 商家回复实体类
 */
public class CommentReply extends BaseObject {
    private Shop shop;
    //商家回复者
    private User user;
    //被回复用户
    private String content;
    //回复内容


    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
