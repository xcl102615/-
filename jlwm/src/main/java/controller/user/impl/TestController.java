package controller.user.impl;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import project.util.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@RestController
public class TestController {
    @GetMapping(value = "test")
    @RequiresRoles("member")
    public Object testCookies(HttpServletResponse response){
        return "123";
    }

}
