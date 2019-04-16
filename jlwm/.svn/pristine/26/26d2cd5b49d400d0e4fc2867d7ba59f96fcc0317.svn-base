package project.util;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;

public class ShiroUtil {
    private static Logger log= Logger.getLogger(ShiroUtil.class);
    /***
     *
     * @return  会话对象
     */
  public static Session getSession(){
      return SecurityUtils.getSubject().getSession();
  }

  public static <T> T getCurrentUser(T user){
     if (user==null){
         return null;
     }
      user= (T) SecurityUtils.getSubject().getSession().getAttribute("user");
      return user;
  }

    /***
     *
     * @param userName 用户名
     * @param password 密码
     * @throws Exception
     */
  public static void login(String userName,String password,boolean rememberMe){
      if (userName ==null ||password==null||userName.trim().equals("")||password.trim().equals("")){
          return;
      }else{
          UsernamePasswordToken token=new UsernamePasswordToken();
          token.setUsername(userName.trim());
          token.setPassword(password.trim().toCharArray());
          token.setRememberMe(rememberMe);
          SecurityUtils.getSubject().login(token);
      }
  }

    /***
     * 向 session中插入一条记录
     * @param key
     * @param value
     */
  public static void setAttribute(Object key,Object value){
      getSession().setAttribute(key,value);
  }

    /***
     * 从session中移除一个key
     * @param key
     */
  public static void removeAttribute(Object key){
      getSession().removeAttribute(key);
  }
    /***
     * 用户注销,执行后释放
     */
  public static void invalidate(){
      log.info("用户注销登录..");
      SecurityUtils.getSubject().logout();
  }
}
