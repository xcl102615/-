package test;

import model.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.LocationUtil;
import project.util.StringUtils;
import service.user.impl.UserServiceImpl;

import javax.swing.*;
import java.math.BigDecimal;
import java.util.*;

public class Test {

@Autowired
private UserServiceImpl userService;
    public List user() {
        Map map =new HashMap();
         List<User> userList =( List<User>) userService.select(map).getObj();
         List userInfo=new ArrayList();
         for(User user:userList){
            String info=("微信昵称："+StringUtils.unicodeStr2String(user.getName())+"——手机号："+user.getPhone());
            userInfo.add(info);
         }
         return userInfo;
    }

    public static void main(String[] args) {
        new Test().user();
    }
}
