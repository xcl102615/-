package controller.wxController;

import model.messagePush.MessageUserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import project.model.AjaxResult;
import project.util.PublicAddress;
import service.wxService.MessagePushService;

import java.util.List;

/**
 * @author ls
 * @version 创建时间：2019年1月23日 下午8:37:36
 * @ClassName 类名称
 * @Description 类描述
 */

@RequestMapping("/MessagePushController")
@Controller
public class MessagePushController {

    @Autowired
    private MessagePushService bllMessagePush;
    /**
     * 获取UserInfo
     */

    @RequestMapping(value = "/getUserInfoByOpenId")
    @ResponseBody
    public MessageUserInfo getUserInfoByOpenId(String AccessToken, String OpendId) {
        return bllMessagePush.getUserInfoByOpenId(AccessToken, OpendId);
    }

    /**
     * 获取公众号所有关注者的openid
     */
    @RequestMapping(value = "/getOpenIds")
    @ResponseBody
    public List<String> getOpenIds(String AccessToken) {
        return bllMessagePush.getOpenIds(AccessToken);
    }

    /**
     * 根据微信id，secret获取access_token
     */

    @RequestMapping(value = "/getAccessToken")
    @ResponseBody
    public String getAccessToken() {
        return bllMessagePush.getAccessToken(PublicAddress.appId_jlkj,PublicAddress.appSecret_jlkj);
    }

    /**
     * 发送微信消息模板(商户)
     */
    @RequestMapping(value = "/sendTemplate")
    @ResponseBody
    public AjaxResult sendTemplate(String id) {
        if (id == "") {
            return AjaxResult.build("0", "id不能为空");
        }
       return bllMessagePush.sendTemplateBll(id);

    }

    /**
     * 发送微信消息模板(用户)
     */
    @RequestMapping(value = "/sendTemplateUser")
    @ResponseBody
    public AjaxResult sendTemplateUser(String id,String formId) {
        if (id == "") {
            return AjaxResult.build("0", "id不能为空");
        }
        if (formId == "") {
            return AjaxResult.build("0", "formId不能为空");
        }
        return bllMessagePush.sendTemplateBllUser(id,formId);

    }

    /**
     * 获取所有关注公众号的用户信息
     * @return
     */
    @RequestMapping("addAllUserInfo")
    @ResponseBody
    public AjaxResult getAllUserInfo(){
        return bllMessagePush.addAllUserInfo();
    }
}