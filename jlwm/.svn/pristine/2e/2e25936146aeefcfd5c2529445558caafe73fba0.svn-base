package model.comment;

import model.order.Order;
import model.shop.Shop;
import model.user.User;
import project.model.BaseObject;
import java.util.List;

/**
 * 用户评价实体类
 */
public class Comment extends BaseObject {
    private Order order;
    //所属订单
    private User user;
    //评论者
    private Shop shop;
    //被评论的店铺（商家）
    private String content;
    //评论的内容
    private String img;
    //评论的图片
    private Integer shopScore;
    //商家星级评分
    private Integer riderScore;
    //骑手星级评分
    private List<CommentReply> commentReplyList;
    //回复信息


    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getShopScore() {
        return shopScore;
    }

    public void setShopScore(Integer shopScore) {
        this.shopScore = shopScore;
    }

    public Integer getRiderScore() {
        return riderScore;
    }

    public void setRiderScore(Integer riderScore) {
        this.riderScore = riderScore;
    }

    public List<CommentReply> getCommentReplyList() {
        return commentReplyList;
    }

    public void setCommentReplyList(List<CommentReply> commentReplyList) {
        this.commentReplyList = commentReplyList;
    }
}
