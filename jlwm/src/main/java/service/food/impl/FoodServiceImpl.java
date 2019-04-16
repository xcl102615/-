package service.food.impl;

import model.food.Food;
import model.food.FoodFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.model.AjaxResult;
import project.service.BaseService;
import service.food.FoodService;

import java.util.List;

@Service
public class FoodServiceImpl extends BaseService implements FoodService {
    @Autowired
    private dao.food.FoodDao dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }

    @Override
    public AjaxResult save(Object object) {
        Food food=(Food) object;
        List<FoodFormat> list=food.getFoodFormats();
        for (FoodFormat foodFormat:list){
            if (foodFormat.getName()==null||foodFormat.getName().trim().equals("")||foodFormat.getPrice()==null){
                return AjaxResult.build("0","规格错误，新增失败");
            }
        }

        if(list!=null&&list.size()!=0&&list.get(0).getPrice()!=null){
            double minPrice=list.get(0).getPrice();//最低价格先设为第一个规格价格
            for (FoodFormat foodFormat:list) {
                minPrice=foodFormat.getPrice()<minPrice?foodFormat.getPrice():minPrice;
            }
            food.setPrice(minPrice);//设置最低价格
        }
        return super.save(food);
    }
    public AjaxResult addFoodFormat(FoodFormat foodFormat){
        return AjaxResult.build(String.valueOf(dao.addFoodFormat(foodFormat)),"系统已响应您的请求");
    }
    public AjaxResult deleteFoodFormat(FoodFormat foodFormat){
        return AjaxResult.build(String.valueOf(dao.deleteFoodFormat(foodFormat)),"系统已响应您的请求");
    }
    public AjaxResult updateFoodFormat(FoodFormat foodFormat){
        return AjaxResult.build(String.valueOf(dao.updateFoodFormat(foodFormat)),"系统已响应您的请求");
    }

    /**
     * 查询当前食物的近30天的月销售数量   返回数值
     * @param foodId
     * @return
     */
    public AjaxResult findFoodMonthSaleNum(String foodId){
        return  AjaxResult.build("1","查询成功",dao.findFoodMonthSaleNum(foodId));
    }
}