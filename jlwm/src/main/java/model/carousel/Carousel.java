package model.carousel;

import project.model.BaseObject;

/***
 *  轮播图
 */
public class Carousel extends BaseObject {
    private String image;
    private String url;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
