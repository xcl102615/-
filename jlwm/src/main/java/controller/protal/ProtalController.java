package controller.protal;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import project.model.AjaxResult;
import project.util.LocationUtil;
import service.protal.ProtalService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
public class ProtalController {
    @Autowired
    private ProtalService service;

    /***
     * 获取首页的相关信息
     * @return
     */
    @RequestMapping("index")
    public AjaxResult index(){
        return service.getIndexInfo();
    }

    /***
     * 通过平台的类型查找食品
     * @param id
     * @return
     */
    @RequestMapping("findByType")
    public AjaxResult findByType(@RequestParam("id")String id){
        return service.selectFoodsByType(id);
    }

    @RequestMapping("findShopByName")
    public AjaxResult findByName(@RequestBody Map map){
        if (!map.containsKey("name")){
            return AjaxResult.build("-1","参数错误");
        }
        return service.findShopByName(map);
    }

    /***
     *
     * @param map page 第几页
     *            pageSize 大小
     *            orderBy 字段排序
     *            sort 排序方式 desc asc
     * @return
     */
    @RequestMapping("findByPage")
    public AjaxResult findByPage(@RequestBody Map map){
        return service.selectFoodByOrderBy(map);
    }

    /***
     * 获取用户订单信息
     * @return
     */
    @RequestMapping("getUserOrders")
    public AjaxResult getUserOrder(){
        return service.findUserOrder();
    }

    /***
     * 获取用户的地址信息
     * @return
     */
    @RequestMapping("getUserAddress")
    public AjaxResult findUserAddress(){
        return service.findUserAddress();
    }
    @RequestMapping("findShopByType")
    public AjaxResult findShopByType(@RequestBody Map map){
        if (!map.containsKey("type")){
            return AjaxResult.build("-1","参数错误");
        }
        return service.findShopByType(map.get("type").toString());
    }
    @PostMapping("getInstance")
    public AjaxResult getInstance(@RequestBody Map map){
//        @RequestBody Map map
        String longitude=map.get("longitude").toString();
        String latitude=map.get("latitude").toString();
        System.out.println("=============================");
        System.out.println(longitude+"--->"+latitude);
        System.out.println("=============================");
        Map back=new HashedMap();
        back.put("baseDistance",2.5);
//        基础的配送距离
//        超出距离每一公里增加配送费
//        莲花广场经纬度
        final double lon_=113.961846;
        final double lat_=27.134073;
        final double perKMprice=2.0;
        back.put("ooDistancePerKm",perKMprice);
        double money=3.0;
        back.put("baseMoney",3.0);
//        基础配送费
        // TODO: 2019/3/20
        double km=LocationUtil.getDistance(Double.parseDouble(longitude),Double.parseDouble(latitude),lon_,lat_);
        double temp=km-2.5;
        back.put("ooDistance",temp>0?temp:0);
//            超出距离
        back.put("isOoDistance",false);
        back.put("ooMoney",0);
        if (temp>0){
            back.put("isOoDistance",true);
            double rs=Math.round(temp);
            double ooprice=((int)rs+0.5)*perKMprice;
            money+=ooprice;
            back.put("ooMoney",ooprice);
        }
        back.put("totalMoney",money);
        return AjaxResult.build("1","系统响应了你的请求",back);
    }
}
