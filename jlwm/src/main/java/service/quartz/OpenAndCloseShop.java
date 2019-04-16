package service.quartz;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import service.shop.impl.ShopServiceImpl;

/***
 * 任务调度 执行开关店铺
 */
@Service
public class OpenAndCloseShop {

    private Logger logger= LoggerFactory.getLogger(OpenAndCloseShop.class);
    @Autowired
    private ShopServiceImpl shopService;
    //关闭店铺
    @Scheduled(cron = "0 0 20 * * ?")
    public void closeShop(){
        logger.info("执行任务调度..");
        logger.info("关闭店铺-->");
        shopService.updateShop(false);
    }
    //  开启店铺
    @Scheduled(cron = "0 30 7 * * ?")
    public void openShop(){
        logger.info("执行任务调度..");
        logger.info("开启店铺-->");
        shopService.updateShop(true);
    }
}
