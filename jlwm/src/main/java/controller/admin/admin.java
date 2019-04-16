package controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("admin")
@Controller
public class admin {

    @RequestMapping("/login")
    public String login(){
        return "admin/login";
    }
}
