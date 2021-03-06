package service.shop.impl;

import model.shop.Shop;
import model.user.Role;
import model.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.model.AjaxResult;
import project.service.BaseService;
import project.util.ShiroUtil;
import project.util.StringUtils;
import service.shop.ShopService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ShopServiceImpl extends BaseService implements ShopService {
    @Autowired
    private dao.shop.ShopMapper dao;

    @Autowired
    private dao.user.UserMapper userMapper;

    @Override
    protected BaseDao getDao() {
        return dao;
    }
    /**
     * 商铺新增
     * @param shop
     * @return
     */
    public AjaxResult addShop(Shop shop) throws ParseException {
        Shop s=new Shop();
        s.setPhone(shop.getPhone());
        if(dao.selectOne(s)!=null){
            return AjaxResult.build("0","该手机号已存在商铺!");
        }
        User user =new User();
        user.setPhone(shop.getPhone());
        user=userMapper.selectOne(user);
        if(user==null){
            return AjaxResult.build("0","请先注册为用户");
        }
        shop.setId(StringUtils.getUUID());//创建id
        shop.setCreateDate(new Date());//创建时间
        shop.setUser(user);
        shop.setStatus("0");//0待审核1审核通过2审核不通过
        shop.setDescription("店铺注册");
        shop.setOpen(false);
        shop.setMoney(0d);
        shop.setCanUse(true);
        shop.setSpecialTime(new SimpleDateFormat("HH:mm:ss").parse("20:00:00"));
        return super.save(shop);

    }

    /**
     * 通过用户登录状态获取商铺信息
     * @return
     */
    public Shop getShopByUser(){
        User user = ShiroUtil.getCurrentUser(new User());
        if (user == null) {
            return null;
        }
        Shop shop=new Shop();
        shop.setUser(user);
        shop=dao.selectOne(shop);
        if(shop==null){
            return null;
        }
        shop.getUser().setName(user.getName());
        return shop;
    }
    public AjaxResult findShopByType(String typeId){
        return AjaxResult.build("1","系统响应了你的请求",dao.findShopByType(typeId));
    }

    @Override
    public AjaxResult select(Map map) {
        List<Object> list=dao.select(map);
        if (list.size()==0){
            return AjaxResult.build("0","未查询到数据");
        }
        for (Object o:list
             ) {
            Shop shop=(Shop)o;
            shop.getUser().setName(StringUtils.unicodeStr2String(shop.getUser().getName()));
        }
        return AjaxResult.build("1","已查询到数据",list);
    }

    public  int updateShop(Boolean flag){
        return dao.updateShop(flag);
    }
    /**
     * 管理端审核商户
     * @param shop
     * @return
     */
    public AjaxResult toExamine(Shop shop) throws Exception {
        String status=shop.getStatus();
        String description=shop.getDescription();
        shop= (Shop) dao.selectOneById(shop.getId());
        if(shop==null){
            return AjaxResult.build("0","未查询到该商铺");
        }
        shop.setStatus(status);
        shop.setDescription(description);
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        shop.setSpecialTime(df.parse("20:00:00"));
        int i=dao.update(shop);
        if(i<=0){
            throw new Exception("修改商铺失败");
        }
        if(status.equals("1")){
            //审核通过
            Map map=new HashMap();
            map.put("user",shop.getUser().getId());
            map.put("role","3");
            i=userMapper.addRole(map);
            if(i<=0){
                throw new Exception("新增角色失败");
            }
        }
        return AjaxResult.build("1","修改商铺成功");
    }

    public AjaxResult shopSwitch(Shop shop) throws Exception {

        int i=dao.shopSwitch(shop);
        if (i<=0){
            throw new Exception();
        }
        return AjaxResult.build("1","更改状态成功");
    }
    //updateAutoReceiving  商户是否自动接单
    public AjaxResult updateAutoReceiving(Shop shop){
        return AjaxResult.build(String.valueOf(dao.updateAutoReceiving(shop)),"系统已响应您的请求");
    }
}
