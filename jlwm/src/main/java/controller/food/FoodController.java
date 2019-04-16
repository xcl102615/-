package controller.food;

import model.food.FoodFormat;
import project.model.AjaxResult;

public interface FoodController {
    AjaxResult addFoodFormat(FoodFormat foodFormat);
    AjaxResult deleteFoodFormat(FoodFormat foodFormat);
    AjaxResult updateFoodFormat(FoodFormat foodFormat);
}
