package test;

import com.sun.deploy.net.URLEncoder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

public class convertAddress {
    public static String convertAddress(String address, String ak) {
        URL url = null;
        HttpURLConnection urlConnection = null;
        BufferedReader rd = null;
        Double lng = null;
        Double lat = null;
        Map<String, Object> map = null;
        Map<String, Object> result = null;
        Map<String, Object> location = null;
        address = address.trim();
        address = address.replaceAll("\\\\", "");
        String regEx = "[`~!@#$%^&*()\\-+={}':;,\\[\\].<>/?￥%…（）_+|【】‘；：”“’。，、？\\s]";
        address = address.replaceAll(regEx, "").trim();
        if (address.length() >= 25) address = address.substring(0, 25);
        String urlString = new StringBuilder().append("http://api.map.baidu.com/geocoder/v2/?").append("address=").append(address).append("&output=json").append("&ak=").append(ak).toString();
        StringBuffer sb = null;
        try {
            URLEncoder.encode(urlString, "UTF-8");
            url = new URL(urlString);
            urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            urlConnection.setDoInput(true);
            urlConnection.setDoOutput(true);
            rd = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
            sb = new StringBuffer();
            String data = null;
            while ((data = rd.readLine()) != null) {
                sb.append(data);
            }
            System.out.println(sb);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            urlConnection.disconnect();
            try {
                rd.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();

    }

    public static void main(String[] args) {
        convertAddress("江西省萍乡市莲花县莲花广场","Xh47SMkNGsLQXGo5giNPaM7Dn3pD6fHI");
    }


}
