package controller.delivery;

import model.user.Role;
import model.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import project.util.ShiroUtil;

@RequestMapping("delivery")
@Controller
public class delivery {

    @RequestMapping("/login")
    public String deliveryIndex() {
        return "delivery/login";
    }

    @RequestMapping("/new_account")
    public String new_account() {
        return "delivery/new_account";
    }
    @RequestMapping("/retrievePassword")
    public String retrievePassword() {
        return "delivery/retrievePassword";
    }
    @ResponseBody
    @RequestMapping("/checkPermission")
    public Object checkPermission() {
        User user= ShiroUtil.getCurrentUser(new User());
        boolean flag=false;
        for (Role role:user.getRoles()
             ) {
            if (role.getName().equals("delivery")){
                flag=true;
            }
        }
        if (!flag){
            ShiroUtil.invalidate();
        }
        return 1;
    }
}
