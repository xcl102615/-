package service.shop.impl;

import model.shop.Shop;
import model.shop.ShopProfit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import project.dao.BaseDao;
import project.model.AjaxResult;
import project.service.BaseService;
import project.util.PublicAddress;
import project.util.StringUtils;
import service.shop.ShopProfitService;

import java.util.Date;

@Service
public class ShopProfitSerciceImpl extends BaseService implements ShopProfitService {

    private Logger log = LoggerFactory.getLogger(ShopProfitSerciceImpl.class);
    @Autowired
    private dao.shop.ShopProfit dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
    @Autowired
    private ShopServiceImpl shopService;


    public AjaxResult save(ShopProfit shopProfit) {
        Shop shop = shopService.getShopByUser();
        if (shop == null) {
            return AjaxResult.build("0", "该用户未开通店铺");
        }
        if(shopProfit.getMoney()>shop.getMoney()){
            return AjaxResult.build("0","提现失败：当前提现金额大于账户余额！");
        }
        log.info("提现金额："+shopProfit.getMoney()+"-------------------"+"账户余额："+shop.getMoney());
        shopProfit.setId(StringUtils.getUUID());
        shopProfit.setType(2);
        shopProfit.setShopId(shop.getId());
        shopProfit.setCreateDate(new Date());
        shopProfit.setName("店家提现");
        shopProfit.setStatus("待审核");
        shopProfit.setDescription("支出");
        double beforeRealMoney=StringUtils.mul(shopProfit.getMoney(),PublicAddress.percentagePoint);//商家实际到账金额（即扣除平台费用）
        shopProfit.setRealMoney(StringUtils.getCeilDown(beforeRealMoney,2));//小数点后两位向下取整
        int number=dao.save(shopProfit);
        if(number>0){
            Shop newShop=new Shop();
            newShop.setId(shop.getId());
            newShop.setUser(shop.getUser());
            //商户余额
            newShop.setMoney(StringUtils.sub(shop.getMoney(),shopProfit.getMoney()));
            shopService.update(newShop);
            return AjaxResult.build("1","提现成功！");
        }
        else
            return AjaxResult.build("0","提现失败");
    }
}
