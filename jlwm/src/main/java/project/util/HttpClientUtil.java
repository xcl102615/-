package project.util;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wph-pc on 2018/5/25.
 */
@SuppressWarnings("deprecation")
public class HttpClientUtil {
    private static List<NameValuePair> SetParams(Map<String, Object> params) {
        //拼接参数
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            String key = entry.getKey().toString();
            String value = entry.getValue().toString();
            System.out.println("key=" + key + " value=" + value);
            NameValuePair pair = new BasicNameValuePair(key, value);
            list.add(pair);
        }
        return list;
    }

    /**
     * post请求
     *
     * @param url
     * @return
     * @throws IOException
     */
    public static JSONObject PostJsonData(String url, Map<String, Object> params) {
        CloseableHttpClient httpclient = HttpClientUtil.createDefault();
        HttpPost httpPost = new HttpPost(url);
        //拼接参数
        List<NameValuePair> list = SetParams(params);

        CloseableHttpResponse response = null;
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(list));
            response = httpclient.execute(httpPost);
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return GetResponseData(response);
    }

    /**
     * 创建httpClient对象
     */
    private static CloseableHttpClient createDefault() {
        return HttpClientBuilder.create().build();
    }

    private static JSONObject GetResponseData(HttpResponse response) {
        /**请求发送成功，并得到响应**/
        JSONObject jsonObject = null;
        if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
            HttpEntity httpEntity = response.getEntity();
            String result = null;
            try {
                result = EntityUtils.toString(httpEntity);
            } catch (ParseException e) {
                e.printStackTrace();
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }// 返回json格式：
            jsonObject = JSONObject.parseObject(result);
        }
        return jsonObject;
    }

    /**
     * http发送post请求
     *
     * @param url
     * @param params
     * @return
     */
    @SuppressWarnings({"resource"})
    public static JSONObject SendPost(String url, Map<String, Object> params) {
        DefaultHttpClient client = new DefaultHttpClient();


        JSONObject jsonObject = new JSONObject();
        jsonObject.putAll(params);
        StringEntity entity = new StringEntity(jsonObject.toString(), "utf-8");//解决中文乱码问题
        /**设置编码 **/
        entity.setContentEncoding("UTF-8");
        entity.setContentType("application/json");

        /**新建一个post请求**/
        HttpPost post = new HttpPost(url);
        post.setEntity(entity);
        HttpResponse response = null;
        try {
            /**客服端向服务器发送请求**/
            response = client.execute(post);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return GetResponseData(response);
    }

    public static String GetServiceData(String url, Map<String, Object> params) {
        DefaultHttpClient client = new DefaultHttpClient();
        /**NameValuePair是传送给服务器的请求参数    param.get("name") **/
        List<NameValuePair> list = SetParams(params);
        UrlEncodedFormEntity entity = null;
        try {
            /**设置编码 **/
            entity = new UrlEncodedFormEntity(list, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        /**新建一个post请求**/
        HttpPost post = new HttpPost(url);
        post.setEntity(entity);
        HttpResponse response = null;
        try {
            /**客服端向服务器发送请求**/
            response = client.execute(post);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
            HttpEntity httpEntity = response.getEntity();
            try {
                return EntityUtils.toString(httpEntity);
            } catch (ParseException e) {
                e.printStackTrace();
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}
