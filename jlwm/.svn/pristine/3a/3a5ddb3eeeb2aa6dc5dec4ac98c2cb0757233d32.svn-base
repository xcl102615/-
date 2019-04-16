package project.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import project.constant.ProjectConfig;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*****
 *
 * 未完成
 */
public class UserLoginStatusFilter implements Filter {
    private Logger log= LoggerFactory.getLogger(UserLoginStatusFilter.class);

    public void destroy() {
    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        log.info("执行用户登录状态校验...");
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;

        Cookie []cookies=request.getCookies();
//      获取所有的cookie
        boolean hasToken=false;
        String token="";
        for (Cookie cookie:cookies
             ) {
            if (cookie.getName().equals(ProjectConfig.TOKEN_NAME)){
                hasToken=true;
                token=cookie.getValue();
                break;
            }
        }
        if (hasToken){
            //      进行远程 校验
            RestTemplate restTemplate=new RestTemplate();
            log.info("从远程服务器校验用户登录状态..");
            MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
            params.add("token",token);
            boolean result=restTemplate.postForObject(ProjectConfig.VALIDATE_USER_TOKEN_URL,params,Boolean.class);
            log.info("是否登录:"+result);
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
