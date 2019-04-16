package controller.shop.impl;

import model.shop.Shop;
import model.shop.ShopProfit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.StringUtils;
import service.shop.impl.ShopProfitSerciceImpl;
import service.shop.impl.ShopServiceImpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商家点店铺流水
 */
@RestController
@RequestMapping("shopProfit")
public class ShopProfitControllerImpl {
    private Logger log = LoggerFactory.getLogger(ShopProfitControllerImpl.class);
    @Autowired
    private ShopProfitSerciceImpl bll;
    @Autowired
    private ShopServiceImpl shopService;

    /**
     * 商家提现
     *
     * @param shopProfit
     * @return
     */
    @PostMapping("shopCashMoney")
    public AjaxResult shopCashMoney(@RequestBody ShopProfit shopProfit) {
        Shop shop = shopService.getShopByUser();
        if (shop == null) {
            return AjaxResult.build("0", "该用户未开通店铺");
        }
        if (StringUtils.objIsNull(shopProfit)) {
            return AjaxResult.build("0", "对象不能为空！");
        }

        return bll.save(shopProfit);
    }

    /**
     * 商铺流水查询
     *
     * @param shopProfit
     * @return
     */
    @PostMapping(value = "findShopProfit")
    public AjaxResult findShopProfit(@RequestBody ShopProfit shopProfit) {
        if (StringUtils.objIsNull(shopProfit)) {
            return AjaxResult.build("0", "参数错误");
        }
        log.info("商铺流水查询 findShopProfit");
        //设置查找条件
        Map map = new HashMap();
        map.put("id", shopProfit.getId());
        return bll.select(map);
    }

    /**
     * 查询店铺的账户余额
     *
     * @return
     */
    @PostMapping("findShopMoney")
    public AjaxResult findShopMoney() {
        Shop shop = shopService.getShopByUser();
        if (shop == null) {
            return AjaxResult.build("0", "该用户未开通店铺");
        }
        Double money = shop.getMoney();
        return AjaxResult.build("1", "查询成功！", money);
    }

    /**
     * 查询店铺的账单
     *
     * @return
     */
    @PostMapping("findShopBill")
    public AjaxResult findShopBill() {
        Shop shop = shopService.getShopByUser();
        if (shop == null) {
            return AjaxResult.build("0", "该用户未开通店铺");
        }
        Map map=new HashMap();
        map.put("shopId",shop.getId());
        return bll.select(map);
    }


    /**
     * 商铺流水提现查询
     *
     * @param
     * @return
     */
    @PostMapping(value = "findShopProfitByStatus")
    public AjaxResult findShopProfitByStatus() {

        Shop shop = shopService.getShopByUser();
        if (shop == null) {
            return AjaxResult.build("0", "该用户未开通店铺");
        }
        log.info("商铺流水查询 findShopProfit");
        //设置查找条件
        Map map = new HashMap();
        map.put("shopId", shop.getId());
        map.put("type", 2);
        List<ShopProfit> shopProfitList = (List<ShopProfit>) bll.select(map).getObj();
        return AjaxResult.build("1", "查询成功", shopProfitList);
    }

}
