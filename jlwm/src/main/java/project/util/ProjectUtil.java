package project.util;

import com.alibaba.fastjson.JSON;
import model.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import project.constant.ProjectConfig;
import redis.clients.jedis.Jedis;

/**
 * @author 张家健
 * @version V1.0
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: 项目中使用的工具
 * @date ${date} ${time}
 */
public class ProjectUtil {

    private static Logger log= LoggerFactory.getLogger(ProjectUtil.class);
    /***
     * 用户登陆后，将信息存入缓存中
     * @param user
     * @throws Exception 如果在业务层中使用，将异常交由 spring 管理
     */
    public static String saveUserStatus(User user) throws Exception {
        if (user==null){
            log.info("用户信息为空!");
            throw new Exception("用户信息不能为空！");
        }
//        重新获取一次连接，不使用上面代码。避免重复获取资源浪费性能
        Jedis jedis=RedisUtil.getJedis();
//      获取一个UUID作为唯一标识
        String token= StringUtils.getUUID();
        try {
            jedis.setex(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+user.getId(), ProjectConfig.REDIS_TIME_TO_LIVE,token);
            jedis.setex(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token, ProjectConfig.REDIS_TIME_TO_LIVE,user.getId());
            jedis.setex(ProjectConfig.lOGIN_USER_INFO_PREFIX+user.getId(), ProjectConfig.REDIS_TIME_TO_LIVE, JSON.toJSONString(user));
            return token;
        }catch (Exception e){
            log.error("缓存用户信息时出现异常,原因是:"+e.getMessage());
            log.error("清理用户登录缓存..");
//         设置失败情况下删除缓存
            jedis.del(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+user.getId());
            jedis.del(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
            jedis.del(ProjectConfig.lOGIN_USER_INFO_PREFIX+user.getId());
            throw e;
        }finally {
            jedis.close();
        }
    }

    /***
     * 如果存在 token 则返回true 当存活时间低于阙值的时候就刷新存活时间
     * @param token
     * @return
     */
    public static boolean existsToken(String token){
        Jedis jedis= null;
        try {
            jedis=RedisUtil.getJedis();
            boolean flag=jedis.exists(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
            if (flag){
                if (jedis.ttl(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token)< ProjectConfig.REFLESH_TIME_TO_LIVE){
                    //          通过token 获取用户的id
                    String uid=jedis.get(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
                    jedis.expire(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token, ProjectConfig.REDIS_TIME_TO_LIVE);
                    jedis.expire(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+uid, ProjectConfig.REDIS_TIME_TO_LIVE);
                    jedis.expire(ProjectConfig.lOGIN_USER_INFO_PREFIX+uid, ProjectConfig.REDIS_TIME_TO_LIVE);
                    return true;
                }
                return true;
            }
        }catch (Exception e){
            log.info(e.getMessage());
            throw e;
        }finally {
            jedis.close();
        }
        return false;
    }

    /***
     * 清除用户缓存信息
     * @param token
     */
    public static void logout(String token){
        Jedis jedis=null;
        try {
            jedis=RedisUtil.getJedis();
            boolean flag=jedis.exists(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
            if (flag){
                    log.info("删除用户登录信息..");
                    //          通过token 获取用户的id
                    String uid=jedis.get(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
                    jedis.del(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
                    jedis.del(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+uid);
                    jedis.del(ProjectConfig.lOGIN_USER_INFO_PREFIX+uid);
            }
        }catch (Exception e){
            log.info(e.getMessage());
        }finally {
            jedis.close();
        }
    }

    /***
     * 判断用户是否在其他地方登陆 是的话 将前一个登陆信息移除
     * @param user
     * @return
     */
    public static boolean existsUserAndUpdateUserStatus(User user){
        Jedis jedis=null;
        try {
            jedis=RedisUtil.getJedis();
            boolean flag=jedis.exists(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+user.getId());
            if (flag){
                log.warn("用户["+user.getId()+"]在其他地点登录！删除用户登录信息..");
                //          通过token 获取用户的id
                String token=jedis.get(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+user.getId());
                jedis.del(ProjectConfig.lOGIN_TOKEN_USER_PREFIX+token);
                jedis.del(ProjectConfig.lOGIN_USER_TOKEN_PREFIX+user.getId());
                jedis.del(ProjectConfig.lOGIN_USER_INFO_PREFIX+user.getId());
                return true;
            }
        }catch (Exception e){
            log.info(e.getMessage());
        }finally {
            jedis.close();
        }
        return false;
    }
}
