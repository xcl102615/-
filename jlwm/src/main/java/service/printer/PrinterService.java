package service.printer;

import dao.printer.PrinterMapper;
import model.order.Order;
import model.printer.Printer;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.model.AjaxResult;
import project.service.BaseService;
import project.util.Api_java_demo;
import project.util.JSONAndObject;
import project.util.StringUtils;

import java.util.Date;
import java.util.Map;

@Service
public class PrinterService extends BaseService {
    private Logger log = LoggerFactory.getLogger(PrinterService.class);

    @Autowired
    private PrinterMapper dao;

    @Autowired
    private service.order.impl.OrderServiceImpl orderService;

    @Override
    protected BaseDao getDao() {
        return dao;
    }

    public AjaxResult addPrinter(Printer printer) {
        String snlist = printer.getSn() + "#" + printer.getUkey() + "#" + printer.getRemarks();
        String result = Api_java_demo.addprinter(snlist);
        log.info("绑定打印机结果：" + result);
        JSONObject jsonObject = JSONAndObject.GetJSONObject(result);
        jsonObject = (JSONObject) jsonObject.get("data");
        if (jsonObject == null) {
            return AjaxResult.build("0", "绑定打印机失败", result);
        }
        JSONArray obj = (JSONArray) jsonObject.get("ok");
        if (obj.length() == 0) {
            return AjaxResult.build("0", "绑定打印机失败");
        }
        printer.setId(StringUtils.getUUID());
        printer.setCreateTime(new Date());
        //  将数据存入数据库
        int i = dao.save(printer);
        if (i <= 0) {
            return AjaxResult.build("0", "绑定打印机失败");
        }
        return AjaxResult.build("1", "绑定打印机成功", result);

    }

    public AjaxResult print(Map map) {
        String orderId = (String) map.get("orderId");
        Object object = orderService.selectOneById(orderId).getObj();
        if (object == null) {
            return AjaxResult.build("0", "未查找到订单");
        }
        String result = Api_java_demo.print(map.get("sn").toString(), (Order) object, map.get("times").toString());

        String orderid = JSONAndObject.GetStringFromJSON(result,"data");//打印机订单号
        log.info("打印机订单号orderid:"+orderid);
        result = Api_java_demo.queryOrderState(orderid);//查询打印状态
        log.info("查询打印状态:" + result);
        Boolean str= Boolean.valueOf(JSONAndObject.GetStringFromJSON(result,"data"));
        log.info("是否打印成功："+str.toString());
        //todo 打印结果存在问题
       /* if (result == null || str!=true) {
            return AjaxResult.build("0", "打印失败");
        }*/
        return AjaxResult.build("1", "打印成功", result);
    }

}
