package project.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 张家健
 * @version V1.0
 * @Project: store
 * @Package shiro.util
 * @Description: Ajax 工具
 * @date 2019/1/11
 */
public class AjaxUtil {
    public static boolean isAjaxRequest(HttpServletRequest request){
        String header = request.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(header) ? true:false;
        return isAjax;
    }
}
