package service.admin;
import dao.user.UserMapper;
import model.carousel.Carousel;
import model.deliveryOrder.DeliveryMoney;
import model.order.Order;
import model.shop.Shop;
import model.shop.ShopProfit;
import model.user.Role;
import model.user.User;
import org.apache.commons.collections.map.HashedMap;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import project.model.AjaxResult;
import project.util.StringUtils;
import service.carousel.impl.CarouselServiceImpl;
import service.deliveryOrder.impl.DeliveryMoneyServiceImpl;
import service.deliveryOrder.impl.DeliveryOrderServiceImpl;
import service.food.impl.FoodServiceImpl;
import service.order.impl.OrderServiceImpl;
import service.shop.impl.ShopProfitSerciceImpl;
import service.shop.impl.ShopServiceImpl;
import service.type.impl.TypeServiceImpl;
import service.user.impl.UserServiceImpl;

import java.util.*;

@Service
public class AdminService {
    @Autowired
    private  UserMapper userDao;
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private ShopServiceImpl shopService;
    @Autowired
    private OrderServiceImpl orderService;
    @Autowired
    private FoodServiceImpl foodService;
    @Autowired
    private TypeServiceImpl typeService;
    @Autowired
    private CarouselServiceImpl carouselService;
    @Autowired
    private ShopProfitSerciceImpl shopProfitSercice;
    @Autowired
    private DeliveryOrderServiceImpl deliveryOrderService;
    @Autowired
    private DeliveryMoneyServiceImpl deliveryMoneyService;
    /***
     * 获取所有的店家
     * @return
     */
    public AjaxResult getAllShopUser(){
        List<User>users= (List<User>) userService.selectAll().getObj();
        List<User>shops=new ArrayList<>();
        for (User t:users) {
            for (Role role:t.getRoles()) {
                if (role.getName().equals("shop")){
                    shops.add(t);
                }
            }
        }
        return AjaxResult.build("1","系统响应了你的请求",shops);
    }

    /***
     * 获取所有的骑手
     * @return
     */
    public AjaxResult getAllDelivery() {
        Map map =new HashMap();
        map.put("status","3");
        List<User> users = (List<User>) userService.select(map).getObj();
        List<User> newUserList=new ArrayList<>();
        for(User userList:users){
            userList.setDescription(String.valueOf(deliveryMoneyService.selectDeliveryMoney(userList).getObj()));;
            userList.setName(StringUtils.unicodeStr2String(userList.getName()));
            newUserList.add(userList);
        }
        return AjaxResult.build("1", "系统响应了你的请求", newUserList);
    }

    public AjaxResult updateShopApply(String id) {
        ShopProfit shopProfit=new ShopProfit();
        shopProfit.setId(id);
        shopProfit.setStatus("已到账");
        shopProfit.setFinishTime(new Date());
        return AjaxResult.build("1", "系统响应了你的请求", shopProfitSercice.update(shopProfit));
    }
    public AjaxResult updateDeliveryApply(String id) {
        DeliveryMoney deliveryMoney=new DeliveryMoney();
        deliveryMoney.setId(id);
        deliveryMoney.setStatus("已完成");
        return AjaxResult.build("1", "系统响应了你的请求", deliveryMoneyService.update(deliveryMoney));
    }
    /***
     * 获取所有待审核的骑手
     * @return
     */
    public AjaxResult getAllDeliveryToexamine() {
        Map map =new HashMap();
        map.put("status","2");
        List<User> users = (List<User>) userService.select(map).getObj();
        List<User> newUserList=new ArrayList<>();
        for(User userList:users){
            userList.setName(StringUtils.unicodeStr2String(userList.getName()));
            newUserList.add(userList);
        }
        return AjaxResult.build("1", "系统响应了你的请求", newUserList);
    }

    /**
     * 审核通过骑手注册并添加角色
     * @param user
     * @return
     */
    public AjaxResult auditedRider(User user) throws Exception {
        Map map =new HashMap();
        map.put("user",user.getId());
        map.put("role","4");
        int i=userDao.addRole(map);
        if(i>0){
           int j= Integer.parseInt(userService.update(user).getCode());
            if(j>0){
                int k= Integer.parseInt(deliveryMoneyService.insertMoney(user).getCode());//给骑手添加一条余额记录
                if(k>0){
                    return AjaxResult.build("1","审核通过");
                }
                throw new Exception("审核失败");
            }
            throw new Exception("审核失败");
        }
        return AjaxResult.build("0","审核失败");
    }




    /***
     * 获取所有的订单
     * @return
     */
    public AjaxResult getAllOrders(){
        return orderService.selectAll();
    }

    /***
     * 获取所有的订单
     * @return
     */
    public AjaxResult getOrderDetails(String id){
        return orderService.selectOneById(id);
    }
    public AjaxResult deleteOrder(String id){
        Order order=new Order();
        order.setId(id);
        return orderService.delete(order);
    }

    public AjaxResult getOrdersByStatus(int status){
        Order order=null;
        switch (status){
            case 1:{
                return orderService.getAccessible();
            }
            case 2:{
                  order=new Order();
                  order.setUserStatus(2);
                  order.setShopStatus(2);
                  order.setDeliveryStatus(4);
                return orderService.getAllOrdersByStatus(order);
            }
            case 3:{
                order=new Order();
                order.setUserStatus(2);
                order.setShopStatus(2);
                order.setDeliveryStatus(5);
                return orderService.getAllOrdersByStatus(order);
            }
        }
        return null;
    }

    /***
     * 获取所有的食品
     * @return
     */
    public AjaxResult getAllFood(){
        return foodService.selectAll();
    }

    /***
     * 获取所有的平台类别
     * @return
     */
    public AjaxResult getAllType(){
        return typeService.select(new HashedMap());
    }

    /***
     * 获取启用的轮播图
     * @return
     */
    public AjaxResult getAllCarousel(){
        return carouselService.selectAll();
    }

    /***
     * 确认骑手提现请求
     * @param deliveryMoney
     * @return
     */
    public AjaxResult updateDeliveryMoney(DeliveryMoney deliveryMoney){
        deliveryMoney= (DeliveryMoney) deliveryOrderService.selectOne(deliveryMoney).getObj();
        if (deliveryMoney.getStatus().equals("已提现")){
            return AjaxResult.build("-1","无效的提现请求");
        }
        deliveryMoney.setStatus("已提现");
       return deliveryOrderService.update(deliveryMoney);
    }

    /***
     * 确认店铺提现请求
     * @param shopProfit
     * @return
     */
    public AjaxResult updateShopProfit(ShopProfit shopProfit){
        shopProfit= (ShopProfit) shopProfitSercice.selectOne(shopProfit).getObj();
        if (shopProfit.getType()==1||shopProfit.getStatus().equals("已提现")){
            return AjaxResult.build("-1","无效的提现请求");
        }
        shopProfit.setStatus("已提现");
        return shopProfitSercice.update(shopProfit);
    }

    /***
     * 获取所有的店铺信息
     * @return
     */
    public AjaxResult getAllShop(){
        return shopService.selectAll();
    }

    /***
     * 查找店家的提现申请
     * @return
     */
    public  AjaxResult getAllShopApply(){
        Map param=new HashMap();
        param.put("type",2);
        param.put("status","待审核");
        List<ShopProfit>  list=(List<ShopProfit>) shopProfitSercice.select(param).getObj();
        List afterList=new ArrayList();
        for(ShopProfit newList:list){
            Shop shop=(Shop)shopService.selectOneById(newList.getShopId()).getObj();
            newList.setShopId(shop.getName());
            afterList.add(newList);
        }
        return AjaxResult.build("1","查询成功",afterList);
    }
    public AjaxResult addCarousel(Carousel carousel){
        carousel.setId(StringUtils.getUUID());
        carousel.setCreateDate(new Date());
        return carouselService.save(carousel);
    }
    public AjaxResult selectCarousel(String id){
        return carouselService.selectOneById(id);
    }
    /***
     * 查找骑手的提现申请
     * @return
     */
    public AjaxResult getAllDeliveryApply(){
        Map param=new HashMap();
        param.put("type","支出");
        param.put("status","待审核");
        List<DeliveryMoney> list=(List<DeliveryMoney>) deliveryMoneyService.select(param).getObj();
        List afterList=new ArrayList();
        for(DeliveryMoney newList:list){
            newList.getUser().setName(StringUtils.unicodeStr2String(newList.getUser().getName()));
            afterList.add(newList);
        }
        return AjaxResult.build("1","查询成功",afterList);
    }

    /***
     * 获取所有的骑手流水
     * @return
     */
    public AjaxResult getDeliveryMoney(){
        Map map =new HashMap();
        map.put("type","支出");
        List<DeliveryMoney> list=(List<DeliveryMoney>) deliveryMoneyService.select(map).getObj();
        List afterList=new ArrayList();
        for(DeliveryMoney newList:list){
            newList.getUser().setName(StringUtils.unicodeStr2String(newList.getUser().getName()));
            afterList.add(newList);
        }
        return AjaxResult.build("1","查询成功",afterList);
    }

    /***
     * 获取所有的店家流水
     * @return
     */
    public AjaxResult findAllShopProfit(){
        Map map =new HashMap();
        map.put("type",2);
         List<ShopProfit> list=(List) shopProfitSercice.select(map).getObj();
         List afterList=new ArrayList();
         for(ShopProfit newList:list){
             Shop shop=(Shop)shopService.selectOneById(newList.getShopId()).getObj();
             newList.setShopId(shop.getName());
             afterList.add(newList);
         }
         return AjaxResult.build("1","查询成功",afterList);
    }
}
