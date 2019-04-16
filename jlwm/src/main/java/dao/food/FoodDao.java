package dao.food;

import model.food.Food;
import model.food.FoodFormat;
import project.dao.BaseDao;
import project.model.AjaxResult;

public interface FoodDao extends BaseDao {

    int addFoodFormat(FoodFormat foodFormat);
    int deleteFoodFormat(FoodFormat foodFormat);
    int updateFoodFormat(FoodFormat foodFormat);
//    查询当前食物的月销售数量
    int findFoodMonthSaleNum(String foodId);
}
