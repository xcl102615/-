package controller.wyy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.StringUtils;
import service.wyy.SendMessageService;

import java.util.Map;

@RestController
public class SendMessage {
    @Autowired
    private SendMessageService sendMessageService;

    @PostMapping("sendMessage")
    public AjaxResult sendMessage(String mobile) throws Exception {
        if (mobile==null||mobile.equals("")) {
            return AjaxResult.build("0", "手机号不能为空");
        }
        return sendMessageService.sendMessage(mobile);
    }
    /**
     * 手机号登陆
     * @param map   参数 1.phone:手机号  2.code:验证码  3.role:角色（1/2/3/4）
     * @return
     * @throws Exception
     */
    @PostMapping("loginByPhone")
    public AjaxResult loginByPhone(Map map) throws Exception {
        if(StringUtils.objIsNull(map)){
            return AjaxResult.build("0","参数不能为空！");
        }
        return sendMessageService.loginByPhone(map);
    }

}

