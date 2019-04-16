package project.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HTTP;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;

/**
 * Created by wph-pc on 2018/5/11.
 */
public class RemoteRequestUtil {
    private String url = "";         //被调用接口的url
    private String usernmae = "";  //用户名
    private String password = "";  //密码
    private int port = 0;            //端口号
    private String protocol = "http";//协议

    public JsonNode httpRequestPost(String JsonParams, String apiUrl) throws Exception {

        HttpHost targetHost = new HttpHost(url, port, protocol);

        DefaultHttpClient httpclient = new DefaultHttpClient();
        //设置httpclient的重试次数，默认是3次，当前是禁用掉的（如果项目量不到，这个默认即可！）
        int SO_TIMEOUT = 60 * 1000;//设置等待数据超过时间为60秒，这里是连上别人的接口，但是迟迟不返回数据（堵塞的异常处理）

        HttpParams params = new BasicHttpParams();
        params.setIntParameter(CoreConnectionPNames.SO_TIMEOUT, SO_TIMEOUT);
        httpclient.setDefaultHttpParams(params);

        //此用户名和密码上生产前需要修改为自己的账户
        httpclient.getCredentialsProvider().setCredentials(
                new AuthScope(targetHost.getHostName(), targetHost.getPort()),
                new UsernamePasswordCredentials(usernmae, password));

        AuthCache authCache = new BasicAuthCache();
        BasicScheme basicAuth = new BasicScheme();
        authCache.put(targetHost, basicAuth);

        BasicHttpContext localcontext = new BasicHttpContext();
        localcontext.setAttribute(ClientContext.AUTH_CACHE, authCache);
        String url = protocol + "://" + this.url + ":" + port + apiUrl;

        HttpPost httpPost = new HttpPost(url);

        StringEntity stringEntity = new StringEntity(JsonParams, HTTP.UTF_8);

        httpPost.setHeader("Content-Type", "application/json");
        httpPost.setHeader("accept", "application/json");

        httpPost.setEntity(stringEntity);

        HttpResponse response = httpclient.execute(targetHost, httpPost, localcontext);

        HttpEntity entity = response.getEntity();

        System.out.println("StatusCode:" + response.getStatusLine().getStatusCode());

        BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent(), "utf-8"));//防止乱码
        String buffer = "";
        StringBuffer sb = new StringBuffer();
        while ((buffer = reader.readLine()) != null) {
            sb.append(buffer);
        }
        reader.close();
        httpPost.releaseConnection();
        System.out.println("entity:" + sb.toString());
        httpclient.getConnectionManager().shutdown();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(sb.toString());
        return jsonNode;

    }

    /**
     * rest get 方式调用itil接口
     *
     * @param apiUrl api接口地址,参数直接拼在地址后面
     * @return json字符串格式的返回结果 其中ReturnCode为0表示请求成功
     * @throws Exception
     */
    public JsonNode httpRequestGet(HashMap<String, Object> content, String apiUrl) throws Exception {

        HttpHost targetHost = new HttpHost(url, port, protocol);

        DefaultHttpClient httpclient = new DefaultHttpClient();

        //此用户名和密码上生产前需要修改为自己的账户
        httpclient.getCredentialsProvider().setCredentials(
                new AuthScope(targetHost.getHostName(), targetHost.getPort()),
                new UsernamePasswordCredentials(usernmae, password));

        AuthCache authCache = new BasicAuthCache();
        BasicScheme basicAuth = new BasicScheme();
        authCache.put(targetHost, basicAuth);

        BasicHttpContext localcontext = new BasicHttpContext();
        localcontext.setAttribute(ClientContext.AUTH_CACHE, authCache);
        String url = protocol + "://" + this.url + ":" + port + apiUrl;

        HttpGet httpGet = new HttpGet(url);

        httpGet.setHeader("Content-Type", "application/json");
        httpGet.setHeader("accept", "application/json");

        HttpResponse response = httpclient.execute(targetHost, httpGet, localcontext);

        HttpEntity entity = response.getEntity();

        System.out.println("StatusCode:" + response.getStatusLine().getStatusCode());

        BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent()));
        String buffer = "";
        StringBuffer sb = new StringBuffer();
        while ((buffer = reader.readLine()) != null) {
            sb.append(buffer);
        }
        reader.close();
        httpGet.releaseConnection();
        System.out.println("entity:" + sb.toString());
        httpclient.getConnectionManager().shutdown();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(sb.toString());
        return jsonNode;

    }
}
