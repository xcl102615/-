package project.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.*;

/**
 * @author 张家健
 * @version V1.0
 * @Project: store
 * @Package util
 * @Description: redis util
 * @date 2019/1/16
 */

/*******************************************************
 *                  Redis util
 * 1.获取的连接使用后需要关闭
 * 2.如果在业务层使用jedis,操作时出现异常,捕捉异常可能会导致事务失效,这里
 *   把异常继续抛出,将事务交给 spring
 *******************************************************/
public class RedisUtil {

    private static final JedisPool jedisPool= (JedisPool) SpringUtil.getBean(JedisPool.class);
    private static Logger log=Logger.getLogger(RedisUtil.class);
    /***
     * 获取一个jedis 对象
     * @return  jedis
     */
    public static Jedis getJedis(){
        try {
            return jedisPool.getResource();
        }catch (Exception e){
            log.error("获取redis连接失败:["+e.getMessage()+"]");
            return null;
        }
    }

    /***
     * 将key存入缓存
     * @param key key
     * @param value 值
     */
    public static void set(String key,String value){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            jedis.set(key,value);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }

    /***
     * 获取key保存的value
     * @param key
     * @return value
     */
    public static String get(String key){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            return jedis.get(key);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }

    /***
     * 判断缓存中是否存在key
     * @param key
     * @return true|false
     */
    public static boolean exists(String key){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            return jedis.exists(key);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }

    /***
     * 原子操作 用于对 key的更新赋值
     * @param key key
     * @param value value
     * @param ttl time to live
     */
    public static void setEx(String key,String value,int ttl){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            jedis.setex(key,ttl,value);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }
    /***
     * 移除一个Key
     * @param key
     */
    public static void del(String key){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            jedis.del(key);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }
    public static void expire(String key,int ttl){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            jedis.expire(key,ttl);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }
    public static long ttl(String key){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            return jedis.ttl(key);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }
    public static Long hset(String root,String key,String value){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            return jedis.hset(root,key,value);
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }
    /***
     * 从hash 中获取一个 key的value
     * @param root
     * @param key
     * @return
     */
    public static String hget(String root,String key){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            String rs=jedis.hget(root,key);
            return rs.equalsIgnoreCase("nil")?null:rs;
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }

    /***
     * 获取 redis 中的hash的所有 kv 以map的形式返回
     * @param key
     * @return
     */
    public static Map hgetAll(String key){
        Jedis jedis=null;
        try{
            jedis = jedis = getJedis();
            Map map=jedis.hgetAll(key);
            Iterator iterator = map.entrySet().iterator();
            StringBuilder stringBuilder=null;
            while (iterator.hasNext()){
                Map.Entry<String,Object>entry = (Map.Entry<String, Object>) iterator.next();
                stringBuilder=new StringBuilder(entry.getValue().toString());
                try {
                    JSONArray array=JSON.parseArray(stringBuilder.toString());
                    List<Object>list =JSONArray.parseArray(stringBuilder.toString(),Object.class);
                    map.put(entry.getKey(),list);
                }catch (Exception e){
                    map.put(entry.getKey(),entry.getValue());
                }
            }
            return map;
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }

    /****
     *  往缓存中 写入一个 hash
     * @param key
     * @param map
     */
    public static void hsetKeys(String key,Map<String,Object>map){
        Jedis jedis=null;
        try{
            jedis=getJedis();
            Iterator iterator = map.entrySet().iterator();
            while (iterator.hasNext()){
                Map.Entry<String,Object>entry = (Map.Entry<String, Object>) iterator.next();
                jedis.hset(key,entry.getKey(),entry.getValue()instanceof String?entry.getValue().toString():JSON.toJSONString(entry.getValue()));
            }
        }catch (Exception e){
            log.error(e);
            throw e;
        }finally {
            jedis.close();
        }
    }
}
