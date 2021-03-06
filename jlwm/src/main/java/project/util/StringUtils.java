package project.util;


import org.apache.commons.lang3.reflect.FieldUtils;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * String的相关操作工具
 */
public class StringUtils extends org.apache.commons.lang.StringUtils {
    /*判断对象组是否为空，如果任何一个为空，返回true，否则返回FALSE*/
    public static boolean IsBlank(Object... objects) {
        Boolean result = false;
        for (Object object : objects) {
            if (null == object || "".equals(object.toString().trim())
                    || "null".equals(object.toString().trim())) {
                result = true;
                break;
            }
        }
        return result;
    }

    /*判断对象属性是否全为空，如果全为空，返回true，否则返回false*/
    public static boolean objIsNull(Object obj) {
        Class stuCla = (Class) obj.getClass();// 得到类对象
        List<Field> fs = FieldUtils.getAllFieldsList(stuCla);//得到属性集合
        boolean flag = true;
        try {
            for (Field f : fs) {//遍历属性
                f.setAccessible(true); // 设置属性是可以访问的(私有的也可以)
                Object val = null;// 得到此属性的值
                val = f.get(obj);
                if (val != null) {//只要有1个属性不为空,那么就不是所有的属性值都为空
                    flag = false;
                    break;
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return flag;
    }

    /*根据参数大小产生随机的字符串*/
    public static String GetRandom(int length) {
        String val = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            // 输出字母还是数字
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            // 字符串
            if ("char".equalsIgnoreCase(charOrNum)) {
                // 取得大写字母还是小写字母
                int choice = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char) (choice + random.nextInt(26));
            } else if ("num".equalsIgnoreCase(charOrNum)) { // 数字
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val.toLowerCase();
    }

    /*判断对象组不能空，如果都不为空返回true，否则返回false*/
    public static boolean IsNotBlank(Object... objects) {
        return !IsBlank(objects);
    }

    public static boolean IsBlank(String... objects) {
        Object[] object = objects;
        return IsBlank(object);
    }

    public static boolean IsNotBlank(String... objects) {
        Object[] object = objects;
        return !IsBlank(object);
    }

    public static boolean IsBlank(String str) {
        Object object = str;
        return IsBlank(object);
    }

    public static boolean IsNotBlank(String str) {
        Object object = str;
        return !IsBlank(object);
    }

    public static String TrimToEmpty(Object str) {
        return (IsBlank(str) ? "" : str.toString().trim());
    }

    /**
     * 转换成Unicode
     */
    public static String ToUnicode(String str) {
        String as[] = new String[str.length()];
        String s1 = "";
        for (int i = 0; i < str.length(); i++) {
            int v = str.charAt(i);
            if (v >= 19968 && v <= 171941) {
                as[i] = Integer.toHexString(str.charAt(i) & 0xffff);
                s1 = s1 + "\\u" + as[i];
            } else {
                s1 = s1 + str.charAt(i);
            }
        }
        return s1;
    }

    /**
     * 判断字符串是否包含汉字
     */
    public static Boolean IsContainsCHN(String txt) {
        if (isBlank(txt)) {
            return false;
        }
        for (int i = 0; i < txt.length(); i++) {

            String bb = txt.substring(i, i + 1);

            boolean cc = Pattern.matches("[\u4E00-\u9FA5]", bb);
            if (cc)
                return cc;
        }
        return false;
    }

    /**
     * 去掉HTML代码
     */
    public static String RemoveHtml(String news) {
        String s = news.replaceAll("amp;", "").replaceAll("<", "<").replaceAll(">", ">");

        Pattern pattern = Pattern.compile("<(span)?\\sstyle.*?style>|(span)?\\sstyle=.*?>", Pattern.DOTALL);
        Matcher matcher = pattern.matcher(s);
        String str = matcher.replaceAll("");

        Pattern pattern2 = Pattern.compile("(<[^>]+>)", Pattern.DOTALL);
        Matcher matcher2 = pattern2.matcher(str);
        String strhttp = matcher2.replaceAll(" ");


        String regEx = "(((http|https|ftp)(\\s)*((\\:)|：))(\\s)*(//|//)(\\s)*)?"
                + "([\\sa-zA-Z0-9(\\.|．)(\\s)*\\-]+((\\:)|(:)[\\sa-zA-Z0-9(\\.|．)&%\\$\\-]+)*@(\\s)*)?"
                + "("
                + "(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])"
                + "(\\.|．)(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)"
                + "(\\.|．)(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)"
                + "(\\.|．)(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])"
                + "|([\\sa-zA-Z0-9\\-]+(\\.|．)(\\s)*)*[\\sa-zA-Z0-9\\-]+(\\.|．)(\\s)*[\\sa-zA-Z]*"
                + ")"
                + "((\\s)*(\\:)|(：)(\\s)*[0-9]+)?"
                + "(/(\\s)*[^/][\\sa-zA-Z0-9\\.\\,\\?\\'\\\\/\\+&%\\$\\=~_\\-@]*)*";
        Pattern p1 = Pattern.compile(regEx, Pattern.DOTALL);
        Matcher matchhttp = p1.matcher(strhttp);
        String strnew = matchhttp.replaceAll("").replaceAll("(if[\\s]*\\(|else|elseif[\\s]*\\().*?;", " ");


        Pattern patterncomma = Pattern.compile("(&[^;]+;)", Pattern.DOTALL);
        Matcher matchercomma = patterncomma.matcher(strnew);
        String strout = matchercomma.replaceAll(" ");
        String answer = strout.replaceAll("[\\pP‘’“”]", " ")
                .replaceAll("\r", " ").replaceAll("\n", " ")
                .replaceAll("\\s", " ").replaceAll("　", "");


        return answer;
    }

    /**
     * 将字符串数组转成List,去掉数组中的空字符串
     */
    public static List<String> Array2ListFilterBlank(String[] array) {
        List<String> list = new ArrayList<String>();
        for (String string : array) {
            if (StringUtils.isNotBlank(string)) {
                list.add(string);
            }
        }
        return list;
    }

    /**
     * 把数组转换成set
     */
    public static Set<?> Array2Set(Object[] array) {
        Set<Object> set = new TreeSet<Object>();
        for (Object obj : array) {
            if (null != obj) {
                set.add(obj);
            }
        }
        return set;
    }

    public static Set<String> Array2Set(String... array) {
        Set<String> set = new TreeSet<String>();
        for (String obj : array) {
            if (null != obj) {
                set.add(obj);
            }
        }
        return set;
    }

    /**
     * serializable toString
     */
    public static String ToString(Serializable serializable) {
        if (null == serializable) {
            return null;
        }
        try {
            return (String) serializable;
        } catch (Exception e) {
            return serializable.toString();
        }
    }

    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 生成唯一订单号
     * 高并发性下，确保订单的唯一性，可以把用户id加进去
     *
     * @param id
     * @return
     */
    public static String getOrderIdByTime(String id) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();
        for (int i = 0; i < 3; i++) {
            result += random.nextInt(10);
        }
        return newDate + result + id;
    }

    /**
     * 将时间格式化
     *
     * @param date
     * @return
     */
    public static String dateToString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);

    }

    /**
     * unicode 转字符串
     *
     * @param unicode 全为 Unicode 的字符串
     * @return
     */
    public static String unicode2String(String unicode) {
        StringBuffer string = new StringBuffer();
        String[] hex = unicode.split("\\\\u");

        for (int i = 1; i < hex.length; i++) {
            // 转换出每一个代码点
            int data = Integer.parseInt(hex[i], 16);
            // 追加成string
            string.append((char) data);
        }

        return string.toString();
    }

    /**
     * 含有unicode 的字符串转一般字符串
     *
     * @param unicodeStr 混有 Unicode 的字符串
     * @return
     */
    public static String unicodeStr2String(String unicodeStr) {
        int length = unicodeStr.length();
        String str=unicodeStr;//暂时保存原数据
        int count = 0;
        //正则匹配条件，可匹配“\\u”1到4位，一般是4位可直接使用 String regex = "\\\\u[a-f0-9A-F]{4}";
        String regex = "\\\\u[a-f0-9A-F]{1,4}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(unicodeStr);
        StringBuffer sb = new StringBuffer();

        while (matcher.find()) {
            String oldChar = matcher.group();//原本的Unicode字符
            String newChar = unicode2String(oldChar);//转换为普通字符
            int index = unicodeStr.indexOf(oldChar);

            sb.append(unicodeStr.substring(0,index));//添加前面不是unicode的字符
            sb.append(newChar);//添加转换后的字符
            count = index + oldChar.length()+count;//统计下标移动的位置
            unicodeStr=unicodeStr.substring(index + oldChar.length());
        }
        sb.append(str.substring(count, length));//添加末尾不是Unicode的字符
        return sb.toString();
    }

    public static void main(String[] arges) {
        String str=StringUtils.ToUnicode("A农家土特产\uD83D\uDC8B\uD83D\uDC492号线");
        System.out.println(str);
        str= unicodeStr2String("A\\u519c\\u5bb6\\u571f\\u7279\\u4ea7\\ud83d\\udc8b\\ud83d\\udc492\\u53f7\\u7ebf");
        System.out.println(str);
    }

    public static int compare_date(String DATE1, String DATE2) {


        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            if (dt1.getTime() > dt2.getTime()) {
                System.out.println("dt1比dt2大");
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                System.out.println("dt1比dt2小");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }

    /**
     * 加法运算
     *
     * @param m1
     * @param m2
     * @return
     */
    public static double add(double m1, double m2) {
        BigDecimal p1 = new BigDecimal(Double.toString(m1));
        BigDecimal p2 = new BigDecimal(Double.toString(m2));
        return p1.add(p2).doubleValue();
    }

    /**
     * 减法运算
     *
     * @param m1
     * @param m2
     * @return
     */
    public static double sub(double m1, double m2) {
        BigDecimal p1 = new BigDecimal(Double.toString(m1));
        BigDecimal p2 = new BigDecimal(Double.toString(m2));
        return p1.subtract(p2).doubleValue();
    }

    /**
     * 乘法运算
     *
     * @param m1
     * @param m2
     * @return
     */
    public static double mul(double m1, double m2) {
        BigDecimal p1 = new BigDecimal(Double.toString(m1));
        BigDecimal p2 = new BigDecimal(Double.toString(m2));
        return p1.multiply(p2).doubleValue();
    }


    /**
     * 除法运算
     *
     * @param m1
     * @param m2
     * @param scale
     * @return
     */
    public static double div(double m1, double m2, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("Parameter error");
        }
        BigDecimal p1 = new BigDecimal(Double.toString(m1));
        BigDecimal p2 = new BigDecimal(Double.toString(m2));
        return p1.divide(p2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * double类型数据向下取整  如：0.065 取整后0.06（此案例设置了长度为2）
     * @param d
     * @param n
     * @return
     */
    public static double getCeilDown(double d,int n){
        BigDecimal b = new BigDecimal(String.valueOf(d));
        b = b.divide(BigDecimal.ONE,n,BigDecimal.ROUND_DOWN);
        return b.doubleValue();
    }
}
