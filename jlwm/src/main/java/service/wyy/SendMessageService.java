package service.wyy;

import model.user.User;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.model.AjaxResult;
import project.util.JSONAndObject;
import project.util.PublicAddress;
import project.util.ShiroUtil;
import project.util.StringUtils;
import project.util.wyy.CheckSumBuilder;
import service.user.impl.UserServiceImpl;

import java.util.*;

@Service
public class SendMessageService {
    @Autowired
    private UserServiceImpl userService;

    public AjaxResult sendMessage(String mobile)throws Exception{
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost("https://api.netease.im/sms/sendcode.action");
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        String nonce=StringUtils.getUUID();
        /*
         * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
         */
        String checkSum = CheckSumBuilder.getCheckSum(PublicAddress.AppSecret, nonce, curTime);

        // 设置请求的header
        httpPost.addHeader("AppKey", PublicAddress.AppKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        nvps.add(new BasicNameValuePair("templateid", String.valueOf(PublicAddress.templateid)));
        nvps.add(new BasicNameValuePair("mobile", mobile));
        nvps.add(new BasicNameValuePair("codeLen", String.valueOf(PublicAddress.codeLen)));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
        /*
         * 1.打印执行结果，打印结果一般会200、315、403、404、413、414、500
         * 2.具体的code有问题的可以参考官网的Code状态表
         */
        String result=EntityUtils.toString(response.getEntity(), "utf-8");
        JSONObject jsonObject=JSONAndObject.GetJSONObject(result);
        String code=jsonObject.get("code").toString();
        System.out.println("验证码"+jsonObject.get("obj"));
       if(code.equals("200")){
           ShiroUtil.setAttribute("code",jsonObject.get("obj"));//将验证码存放在session中
           return AjaxResult.build("1","发送验证码成功！",jsonObject.get("obj").toString());
       }
       return AjaxResult.build("0","发送验证码失败！");
    }
    /****手机号登陆****/
    public AjaxResult loginByPhone(Map map) throws Exception {
        if(StringUtils.objIsNull(map)){
            return AjaxResult.build("0","参数不能为空！");
        }
        String phone=map.get("phone").toString();
        String code=map.get("code").toString();
        String role=map.get("role").toString();
        String returnCode= ShiroUtil.getSession().getAttribute("code").toString();

        if(code.equals(returnCode)){
            //验证成功
            Map newmap=new HashMap();
            newmap.put("phone",phone);//////////////////手机号
            newmap.put("role",role);////////////////////角色
            User user=(User) userService.loginByPhone(newmap).getObj();
            if(user==null){
                return AjaxResult.build("0","您还没有注册过平台账号，赶快去注册吧~");
            }
            user.setName(StringUtils.unicode2String(user.getName()));
            ShiroUtil.setAttribute("user",user);
            ShiroUtil.login(user.getName(), "1212", false);
            ShiroUtil.getSession().removeAttribute("code");//移除code
            return AjaxResult.build("1","登陆成功");
        }
        return AjaxResult.build("0","验证码错误！");

    }

    public static void main(String[] args)throws Exception {
        new SendMessageService().sendMessage("15932886471");
    }
}
