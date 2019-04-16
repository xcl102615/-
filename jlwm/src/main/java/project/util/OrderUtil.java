package project.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

public final class OrderUtil {

    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    private static final AtomicInteger atomicInteger = new AtomicInteger(1000000);

    /**
     * 创建不连续的订单号
     *
     * @param userId
     *            数据中心编号
     * @return 唯一的、不连续订单号
     */
    public static  String getOrderuserIdByUUID(String userId) {
        Integer uuidHashCode = UUID.randomUUID().toString().hashCode();
        if (uuidHashCode < 0) {
            uuidHashCode = uuidHashCode * (-1);
        }
        String date = simpleDateFormat.format(new Date());
        return userId + date + uuidHashCode;
    }

    /**
     * 获取同一秒钟 生成的订单号连续
     *
     * @param userId
     *            数据中心编号
     * @return 同一秒内订单连续的编号
     */
    public static synchronized String getOrderuserIdByAtomic(String userId) {
        atomicInteger.getAndIncrement();
        int i = atomicInteger.get();
        String date = simpleDateFormat.format(new Date());
        return userId + date + i ;
    }

    public static void main(String[] args) {
        System.out.println(OrderUtil.getOrderuserIdByUUID(StringUtils.getUUID()));
        System.out.println(OrderUtil.getOrderuserIdByUUID(StringUtils.getUUID()));
        System.out.println(OrderUtil.getOrderuserIdByUUID(StringUtils.getUUID()));
    }
}
