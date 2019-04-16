package project.constant;

import java.util.HashSet;
import java.util.Set;

/**
 * @author 张家健
 * @version V1.0
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: 项目常量配置
 * @date ${date} ${time}
 */

/*****
 * 项目基础配置类
 ****/
public class ProjectConfig {


    /**********************************************
     *                  项目配置
     * *******************************************/
    public static final String PROJECT_NAME="rest";
    public static final String TOKEN_NAME="token";

    public static final String UPLOAD_FILE_DIRECTORY="uploadFiles";
    public static final Set<String>PUBLIC_URI=new HashSet<>();
    public static final Set<String>UPLOAD_FILE_TYPE=new HashSet<>();
    static {
        PUBLIC_URI.add("/"+PROJECT_NAME+"/"+"login");

//        图片类型
        UPLOAD_FILE_TYPE.add(".png");
        UPLOAD_FILE_TYPE.add(".jpg");
        UPLOAD_FILE_TYPE.add(".jpeg");
        UPLOAD_FILE_TYPE.add(".gif");
//        文本类型
        UPLOAD_FILE_TYPE.add(".pdf");
        UPLOAD_FILE_TYPE.add(".doc");
        UPLOAD_FILE_TYPE.add(".xls");
        UPLOAD_FILE_TYPE.add(".txt");
//        媒体类型
//        音频格式
        UPLOAD_FILE_TYPE.add(".mp3");
//        视频格式
        UPLOAD_FILE_TYPE.add(".mp4");
        UPLOAD_FILE_TYPE.add(".3gp");
        UPLOAD_FILE_TYPE.add(".MOV");
        UPLOAD_FILE_TYPE.add(".RMVB");
        UPLOAD_FILE_TYPE.add(".avi");

    }
    /**********************************************
     *              redis 缓存配置
     * *******************************************/

    /**********************************************
     *              SSO token 缓存配置
     * *******************************************/
    public static final String lOGIN_TOKEN_USER_PREFIX="sys:token_user:";
    //     key: sys:token_user:token
//     value: userId
    public static final String lOGIN_USER_TOKEN_PREFIX="sys:user_token:";
    //      key: sys:user_token:uid
//      value: token
    public static final String lOGIN_USER_INFO_PREFIX="sys:user_info:";
//      key:  sys:user_info:uid
//      value: user json
    /***********************************************
     *      商城项目配置
     ***********************************************/
    public static final String SHOP_INFO="shop_info:";
//  redis 缓存中 店铺信息的存储方式  如 shop_info:shopId

    public static final int SHOP_INFO_CACHE_TIME=60*60*24;
//    默认 一天

    /****************************************************
     *  REDIS SSO key 存活时间配置
     ***************************************************/
    public static final int REDIS_TIME_TO_LIVE=60*30;
    //redis缓存数据的存活时间
    public static final long REFLESH_TIME_TO_LIVE=600;
    //  key的存活时间低于这个阙值的时候 就重新给他赋予存活时间


    /**********************************************
     *              远程用户中心
     * *******************************************/

    public static final String BASE_URL="http://127.0.0.1:8080/";
    public static final String USER_LOGIN_URL=BASE_URL+"rest/user/login";
    public static final String VALIDATE_USER_TOKEN_URL=BASE_URL+"rest/user/validateToken";
}
