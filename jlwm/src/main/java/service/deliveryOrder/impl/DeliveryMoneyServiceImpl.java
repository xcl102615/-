package service.deliveryOrder.impl;

import model.deliveryOrder.DeliveryMoney;
import model.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.model.AjaxResult;
import project.service.BaseService;
import project.util.ShiroUtil;
import project.util.StringUtils;
import service.deliveryOrder.DeliveryMoneyService;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Service
public class DeliveryMoneyServiceImpl extends BaseService implements DeliveryMoneyService {

    private Logger log = LoggerFactory.getLogger(DeliveryMoneyServiceImpl.class);
    @Autowired
    private dao.deliveryOrder.DeliveryMoneyMapper dao;

    @Override
    protected BaseDao getDao() {
        return dao;
    }

    public AjaxResult cashWithdrawal(DeliveryMoney deliveryMoney) throws Exception {
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return AjaxResult.build("0", "用户未登录");
        }
        //获取用户余额
        double balance=dao.selectMoney(user.getId());
        if(deliveryMoney.getMoney()>balance||deliveryMoney.getMoney()<=0){
            return AjaxResult.build("0","提现金额错误");
        }
        deliveryMoney.setId(StringUtils.getUUID());
        deliveryMoney.setCreateDate(new Date());
        deliveryMoney.setType("支出");
        deliveryMoney.setStatus("待审核");
        deliveryMoney.setUser(user);
        deliveryMoney.setDescription("骑手提现");
        int i=dao.save(deliveryMoney);
        if(i<=0){
            throw new Exception("骑手提现失败");
        }
        //重新设置总金额
        Double price=dao.selectMoney(user.getId());
        Map map=new HashMap();
        map.put("money",StringUtils.sub(price,deliveryMoney.getMoney()));
        map.put("user",user);
        i=dao.updateMoney(map);
        if(i<=0){
            throw new Exception("重新设置总金额失败");
        }
        return AjaxResult.build("1","申请提现成功");

    }
    public AjaxResult selectMoney(){
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return AjaxResult.build("0", "用户未登录");
        }
        return AjaxResult.build("1","系统响应了你的请求",dao.selectMoney(user.getId()));
    }

    /**
     * 查询骑手账                                                                                          户余额
     * @return
     */
    public AjaxResult selectDeliveryMoney(User user){
        if (StringUtils.objIsNull(user)) {
            return AjaxResult.build("0", "user不能为空！");
        }
        return AjaxResult.build("1","系统响应了你的请求",dao.selectMoney(user.getId()));
    }
    public AjaxResult insertMoney(User user){
        Map map=new HashMap();
        map.put("user",user);
        map.put("money",0);
        int i=dao.insertMoney(map);
        return AjaxResult.build(String.valueOf(i),"系统响应了你的请求");
    }
    public AjaxResult updateMoney(Map map){
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return AjaxResult.build("0", "用户未登录");
        }
        map.put("user",user);
        return AjaxResult.build("1","系统响应了你的请求",dao.updateMoney(map));
    }
}
