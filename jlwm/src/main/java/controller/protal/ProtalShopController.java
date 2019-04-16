package controller.protal;

import model.food.Food;
import model.shop.Shop;
import model.user.Role;
import model.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.ShiroUtil;
import project.util.StringUtils;
import service.shop.impl.ProtalShopService;

@RestController
public class ProtalShopController {
    private Logger log = LoggerFactory.getLogger(ProtalShopController.class);

    @Autowired
    private ProtalShopService bll;

    @PostMapping("protalShop")
    public AjaxResult protalShop(@RequestBody Shop shop) {
        if (StringUtils.objIsNull(shop)) {
            return AjaxResult.build("0", "对象不能为空！");
        }
        log.info("进入查询当前店铺的所有行信息");
        return bll.protalShop(shop);
    }

    /**
     * 商户版店铺首页的食物
     *
     * @param food shopId foodType status 条件查询
     * @return
     */
    @PostMapping("protalFoodAdmin")
    public AjaxResult protalFoodAdmin(@RequestBody Food food) {
        if (StringUtils.objIsNull(food)) {
            return AjaxResult.build("0", "对象不能为空！");
        }
        log.info("进入查询当前店铺的食物信息");
        return bll.protalFoodAdmin(food);
    }
    @RequestMapping("checkPermission")
    public Object checkPermission(){
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return AjaxResult.build("0", "用户未登录");
        }
        boolean flag=false;
        for (Role role:user.getRoles()
        ) {
            if (role.getName().equals("shop")){
                flag=true;
            }
        }
        if (!flag){
            ShiroUtil.invalidate();
            return AjaxResult.build("-1","你还不是商户");
        }
        return AjaxResult.build("1", "权限验证通过", 1);
    }
}
