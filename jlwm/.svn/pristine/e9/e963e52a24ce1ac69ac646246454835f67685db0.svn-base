package dao.shop;

import model.shop.Shop;
import project.dao.BaseDao;

import java.util.List;

public interface ShopMapper extends BaseDao {
    List<Shop>findShopByType(String typeId);

    int shopSwitch(Shop shop);//启用与禁用商铺

    int updateShop(Boolean isOpen);
    int updateAutoReceiving(Shop shop);

}
