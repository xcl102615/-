package controller.deliveryOrder.impl;


import model.deliveryOrder.DeliveryMoney;
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
import service.deliveryOrder.impl.DeliveryMoneyServiceImpl;

import java.util.HashMap;
import java.util.Map;

@RequestMapping(value = "deliveryMoney")
@RestController
public class DeliveryMoneyController implements controller.deliveryOrder.DeliveryMoneyController {

    private Logger log = LoggerFactory.getLogger(DeliveryMoneyController.class);

    @Autowired
    private DeliveryMoneyServiceImpl bll;


    /**
     * 骑手资金流水记录查询
     *
     * @return
     */
    @PostMapping(value = "findDeliveryMoney")
    public AjaxResult findDeliveryMoney() {
        log.info("骑手提现记录查询 findDeliveryMoney");
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return AjaxResult.build("0", "用户未登录");
        }
        //设置查找条件
        Map map = new HashMap();
        map.put("user", user);
        return bll.select(map);
    }


    /**
     * 骑手流水删除
     *
     * @param deliveryMoney
     * @return
     */
    @PostMapping(value = "delDeliveryMoney")
    public AjaxResult delDeliveryMoney(@RequestBody DeliveryMoney deliveryMoney) {
        if (StringUtils.objIsNull(deliveryMoney)) {
            return AjaxResult.build("0", "参数错误");
        }
        log.info("进入骑手流水删除 delDeliveryMoney");
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return AjaxResult.build("0", "用户未登录");
        }
        deliveryMoney.setUser(user);
        return bll.delete(deliveryMoney);
    }

    /**
     * 获取骑手余额
     * @return
     */
    @PostMapping(value ="findBalance")
    public AjaxResult findBalance(){
        log.info("获取骑手余额 findBalance");
        return bll.selectMoney();
    }

    /**
     * 骑手提现
     * @return
     */
    @PostMapping(value = "cashWithdrawal")
    public AjaxResult cashWithdrawal(@RequestBody DeliveryMoney deliveryMoney) throws Exception {
        if (StringUtils.objIsNull(deliveryMoney)) {
            return AjaxResult.build("0", "参数错误");
        }
        log.info("骑手提现金额："+deliveryMoney.getMoney());
        return bll.cashWithdrawal(deliveryMoney);

    }

}
