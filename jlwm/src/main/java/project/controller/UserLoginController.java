package project.controller;

import com.alibaba.fastjson.JSON;
import model.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import project.constant.ProjectConfig;
import project.model.AjaxResult;
import project.util.ShiroUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

//暂不使用 sso远程登录
//@RestController
public class UserLoginController {
    @Autowired
    private RestTemplate restTemplate;
    //   日志
    private Logger log= LoggerFactory.getLogger(UserLoginController.class);

    @PostMapping(value = "login")
    public Object login(String name, String password, HttpServletResponse response){
        MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
        params.add("name",name);
        params.add("password",password);
        log.info("从远程服务器["+ ProjectConfig.USER_LOGIN_URL+"]校验用户信息..");
        String tempStr
                =restTemplate.postForObject(ProjectConfig.USER_LOGIN_URL,params,String.class);
//      处理服务器响应 返回时 text/html utf-8这里将返回的json 以字符串接收，后面将字符串转换成 对象;
        AjaxResult result=JSON.parseObject(tempStr,AjaxResult.class);
        Map map= (Map) result.getObj();
        User user= (User) map.get("user");
        if (user!=null){
            log.info("用户["+user.getName()+"]登录成功");
            ShiroUtil.login(name,password,false);
            String token= (String) map.get("token");
            Cookie cookie=new Cookie("token",token);
//            cookie.setDomain(".iooint.com");
            cookie.setMaxAge(60*60*24*7);
//            cookie的存活时间 以秒 为单位
            response.addCookie(cookie);
        }else {
            log.info("登录失败！");
        }
        return result;
    }
}