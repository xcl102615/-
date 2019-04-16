package service.delivery;

import model.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.model.AjaxResult;
import project.util.ShiroUtil;
import service.deliveryOrder.impl.DeliveryOrderServiceImpl;

import java.util.HashMap;
import java.util.Map;

@Service
public class DeliveryService {
    @Autowired
    private DeliveryOrderServiceImpl deliveryOrderService;

    public AjaxResult getDeliveryOrders(){
        User user= ShiroUtil.getCurrentUser(new User());
        if (user==null){
            return AjaxResult.build("-1","用户未登录");
        }
        Map param=new HashMap();
        param.put("user",user);
        return deliveryOrderService.select(param);
    }
}
