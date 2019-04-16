package dao.deliveryOrder;

import model.deliveryOrder.DeliveryMoney;
import project.dao.BaseDao;

import java.util.Map;

public interface DeliveryMoneyMapper extends BaseDao {
    Double selectMoney(String uid);//获取用户金额
    Integer insertMoney(Map map);
    int updateMoney(Map map);
}
