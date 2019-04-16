package project.util.wx;

import org.apache.commons.codec.digest.DigestUtils;


import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * 微信支付工具类
 * @author 27418
 *
 */
public class PayUtil {

    public static void main(String[] args) {
        String str="<xml><URL><![CDATA[http://47.107.114.13/jl_wm/wechat/wx]]></URL><ToUserName><![CDATA[wxid_1ugj42zfhi3521]]></ToUserName><FromUserName><![CDATA[oAr-B53Oc6-qjzGxLQ74E-wP5P-U]]></FromUserName><CreateTime>1234</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><Latitude></Latitude><Longitude></Longitude><Precision></Precision><MsgId>1111111111111111111111111111111111111111111111111111111111111</MsgId></xml>";
        try {
           Map map= doXMLParse(str);
           String event=map.get("Event").toString();
            System.out.println(event);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 签名字符串
     *
     * @param text
     *            需要签名的字符串
     * @param key
     *            秘钥
     * @param input_charset
     *            编码格式
     * @return 签名结果
     */
    public static String sign(String text, String key, String input_charset) {

        text = text + "&key=" + key;

        return DigestUtils.md5Hex(getContentBytes(text, input_charset));

    }

    /**
     * 签名字符串
     *
     * @param text
     *            需要签名的字符串
     * @param sign
     *            签名结果
     * @param key
     *            秘钥
     * @param input_charset
     *            编码格式
     * @return 签名结果
     */
    public static boolean verify(String text, String sign, String key, String input_charset) {

        text = text + key;
        String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
        if (mysign.equals(sign)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     *
     * @param content
     *            需要签名的字符串
     * @param charset
     *            编码格式
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException
     */
    private static byte[] getContentBytes(String content, String charset) {

        if (charset == null && "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }

    public static boolean isValidChar(char ch) {
        if ((ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z'))
            return true;
        if ((ch >= 0x4e00 && ch <= 0x7fff) || (ch >= 0x8000 && ch <= 0x952f))
            return true;
        // 简体中文汉字编码
        return false;
    }

    /**
     * 除去数组中的空值和签名参数
     *
     * @param sArray
     *            签名参数组
     * @return 去掉空值与签名参数后的新签名参数组
     */
    public static Map<String, String> paraFilter(Map<String, String> sArray) {

        Map<String, String> result = new HashMap<String, String>();
        if (sArray == null || sArray.size() <= 0) {
            return result;
        }
        for (String key : sArray.keySet()) {
            String value = sArray.get(key);
            if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                    || key.equalsIgnoreCase("sign_type")) {
                continue;
            }
            result.put(key, value);
        }
        return result;
    }

    /**
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     *
     * @param params
     *            需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    public static String createLinkString(Map<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);
        String preStr = "";
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);
            if (i == keys.size() - 1) {// 拼接时，不包括最后一个&字符
                preStr = preStr + key + "=" + value;
            } else {
                preStr = preStr + key + "=" + value + "&";
            }
        }
        return preStr;
    }

    /**
     * @param requestUrl
     *            请求地址
     * @param requestMethod
     *            请求方法
     * @param outStr
     *            参数
     */
    public static String httpRequest(String requestUrl, String requestMethod, String outStr) {

        // 创建SSLContext
        StringBuffer buffer = null;
        try {
            URL url = new URL(requestUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod(requestMethod);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.connect();
            // 往服务器 端写内容
            if (outStr != null) {
                OutputStream os = conn.getOutputStream();
                os.write(outStr.getBytes("UTF-8"));
                os.close();
            }
            // 读取服务器端返回的内容
            InputStream is = conn.getInputStream();
            InputStreamReader isr = new InputStreamReader(is, "utf-8");
            BufferedReader br = new BufferedReader(isr);
            buffer = new StringBuffer();
            String line = null;
            while ((line = br.readLine()) != null) {
                buffer.append(line);
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return buffer.toString();

    }

    public static String urlEncodeUTF8(String source) {
        String result = source;
        try {
            result = java.net.URLEncoder.encode(source, "UTF-8");
        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();
        }
        return result;
    }

    /**
     * 解析xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。
     *
     * @param strxml
     * @return
     * @throws Exception
     * @throws IOException
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public static Map doXMLParse(String strxml) throws Exception {

        if (null == strxml || "".equals(strxml)) {
            return null;
        }
        Map m = new HashMap();
        InputStream in = String2InputStream(strxml);
        SAXBuilder builder = new SAXBuilder();
        Document doc = builder.build(in);
        Element root = doc.getRootElement();
        List list = root.getChildren();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            Element e = (Element) it.next();
            String k = e.getName();
            String v = "";
            List children = e.getChildren();
            if (children != null) {
                v = e.getTextNormalize();
            } else {
                v = getChildrenText(children);
            }
            m.put(k, v);

        }
        in.close();
        return m;
    }

    /**
     * 获取子结点的xml
     *
     * @param children
     * @return String
     */
    @SuppressWarnings("rawtypes")
    private static String getChildrenText(List children) {
        StringBuffer sb = new StringBuffer();
        if (!children.isEmpty()) {
            Iterator it = children.iterator();
            while (it.hasNext()) {
                Element e = (Element) it.next();
                String name = e.getName();
                String value = e.getTextNormalize();
                List list = e.getChildren();
                sb.append("<" + name + ">");
                if (!list.isEmpty()) {
                    sb.append(getChildrenText(list));
                }
                sb.append(value);
                sb.append("</" + name + ">");
            }
        }
        return sb.toString();

    }

    private static InputStream String2InputStream(String str) {

        return new ByteArrayInputStream(str.getBytes());

    }

    /**
     * map转换成XML对象
     * @param param
     * @return
     */
    public static String GetMapToXML(Map<String, String> param) {
        StringBuffer sb = new StringBuffer();
        sb.append("<xml>");
        for (Map.Entry<String, String> entry : param.entrySet()) {
            sb.append("<" + entry.getKey() + ">");
            sb.append(entry.getValue());
            sb.append("</" + entry.getKey() + ">");
        }
        sb.append("</xml>");
        return sb.toString();
    }

}
