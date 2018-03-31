package com.xinpengdu.common.tool;

import com.thoughtworks.xstream.XStream;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.http.util.TextUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;
import sun.misc.BASE64Decoder;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public final class Tool {

    private static final SimpleDateFormat monthDateFormat = new SimpleDateFormat("yyyy-MM");

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    private static final SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    private static final SimpleDateFormat noSymbolDateTimeFormat = new SimpleDateFormat("yyyyMMddHHmmss");

    private static final SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

    private static final SimpleDateFormat minuteFormat = new SimpleDateFormat("mm分");

    private static final SimpleDateFormat timeMillis = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    private static final Random random = new Random();

//	private static final String key = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * 创建一个uuid
     *
     * @return
     */
    public static String createUuid() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 得到资源文件的根路径
     *
     * @return
     */
    public static String getResourceRoot() {
        return System.getProperty("user.home") + "/";
    }

    /**
     * 根据图片完整URL或名称获取图片扩展名
     *
     * @param path
     * @return
     */
    public static String getImageExtension(String path) {
        int lastIndex = path.lastIndexOf(".");
        if (lastIndex > 0 && lastIndex > path.lastIndexOf("/")) {
            String extension = path.substring(lastIndex).toLowerCase();
            if (".jpg".equals(extension) || ".jpeg".equals(extension) || ".png".equals(extension) || ".gif".equals(extension) || ".bmp".contains(extension)) {
                return extension;
            }
        }
        return ".jpg";
    }

    /**
     * 解析yyyy-MM-dd格式或yyyy_MM_dd格式的日期字串
     *
     * @param dateText
     * @return
     */
    public static Date parseDate(String dateText) {
        try {
            return isEmpty(dateText) ? null : dateFormat.parse(dateText.replace("_", "-"));
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 解析yyyy-MM-dd HH:mm:ss格式的日期时间字串
     *
     * @param datetimeText
     * @return
     */
    public static Date parseDatetime(String datetimeText) {
        try {
            return isEmpty(datetimeText) ? null : dateTimeFormat.parse(datetimeText);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 解析无符号的yyyyMMddHHmmss格式的日期时间字串
     *
     * @param noSymbolDatetimeText
     * @return
     */
    public static Date parseNoSymbolDatetime(String noSymbolDatetimeText) {
        try {
            return isEmpty(noSymbolDatetimeText) ? null : noSymbolDateTimeFormat.parse(noSymbolDatetimeText);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将Date日期格式化成yyyy-MM格式
     *
     * @param date
     * @return
     */
    public static String formatMonthDate(Date date) {
        return monthDateFormat.format(date);
    }

    /**
     * 将Date日期格式化成yyyy-MM-dd格式
     *
     * @param date
     * @return
     */
    public static String formatDate(Date date) {
        return dateFormat.format(date);
    }

    /**
     * 将Date日期格式化成yyyy-MM-dd HH:mm:ss格式
     *
     * @param date
     * @return
     */
    public static String formatDateTime(Date date) {
        return dateTimeFormat.format(date);
    }

    /**
     * 将Date日期格式化成yyyyMMddHHmmss格式
     *
     * @param date
     * @return
     */
    public static String formatNoSymbolDateTime(Date date) {
        return noSymbolDateTimeFormat.format(date);
    }

    public static String showDate(Date date) {
        return date != null ? Tool.formatDate(date) : "";
    }

    public static String showDateTime(Date date) {
        return date != null ? Tool.formatDateTime(date) : "";
    }

    /**
     * 将带有时区信息的时间字符串转换为无符号的当地时间
     *
     * @param timeZoneDateString 带有时区信息的时间字符串
     * @return
     */
    public static String convertTimezoneDateToLocalDateTime4NoSymbol(String timeZoneDateString) {
        DateTimeFormatter formatter = ISODateTimeFormat.dateTimeParser();
        DateTime dateTime = formatter.parseDateTime(timeZoneDateString);
        return dateTime.toString("yyyyMMddHHmmss");
    }

    /**
     * 将带有时区信息的时间字符串转换为Date
     *
     * @param timeZoneDateString
     * @return
     */
    public static Date convertTimezoneDateToLocalDate(String timeZoneDateString) {
        DateTimeFormatter formatter = ISODateTimeFormat.dateTimeParser();
        DateTime dateTime = formatter.parseDateTime(timeZoneDateString);
        return dateTime.toDate();
    }

    /**
     * 将Date时间格式化成HH:mm:ss格式
     *
     * @param date
     * @return
     */
    public static String formatTime(Date date) {
        return timeFormat.format(date);
    }

    /**
     * 将Date时间格式化成mm:ss格式
     *
     * @param date
     * @return
     */
    public static String formatMinute(Date date) {
        return minuteFormat.format(date);
    }

    /**
     * 获取当前时间前几个月的日期或者后几个月的日期
     *
     * @param date             指定日期
     * @param number           指定日期之前的，该值为负数，制定日期之后的，该值为正数
     * @param simpleDateFormat
     * @return
     */
    public static String getOneMonthDate(Date date, int number, SimpleDateFormat simpleDateFormat) {
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.add(Calendar.MONTH, number);
        Date lastMonth = ca.getTime();
        return simpleDateFormat.format(lastMonth);
    }

    /**
     * 检测字符串是否为空
     *
     * @param obj
     * @return
     */
    public static boolean isEmpty(String obj) {
        if (obj == null || "".equals(obj.trim())) {
            return true;
        }
        return false;
    }

    public static float formatFloat(float data, int digits) {
        return Float.valueOf(formatData(data, digits)).floatValue();
    }

    /**
     * 格式化float数据,保留一位小数
     *
     * @param data
     * @return
     */
    public static float formatFloat(float data) {
        return formatFloat(data, 1);
    }

    public static String formatData(double data) {
        return formatData(data, 1);
    }

    public static String formatData(double data, int digits) {
        NumberFormat nf = NumberFormat.getInstance(Locale.CHINA);
        nf.setGroupingUsed(false);
        nf.setMaximumFractionDigits(digits);
        return nf.format(data);
    }

    /**
     * 当前线程休眠
     *
     * @param seconds 秒
     */
    public static void delay(long seconds) {
        try {
            Thread.sleep(seconds * 1000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 将Boolean值转换成js可用判断
     *
     * @param result
     * @return
     */
    public static String toJsBoolean(boolean result) {
        return result ? "true" : "";
    }

    /**
     * 返回easyui的datagrid组建无数据Json返回值
     *
     * @return
     */
    public static String getJsonNoDataGridDataReturn() {
        return "{\"total\":0,\"rows\":[]}";
    }

    /**
     * 返回成功Json返回值
     *
     * @return
     */
    public static JSONObject getSuccessReturnJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("result", true);
        return obj;
    }

    /**
     * 返回Json返回值
     *
     * @return
     */
    public static JSONObject getFailureReturnJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("result", false);
        return obj;
    }

    /**
     * 获取一个success为true的JSONObject对象
     *
     * @return
     */
    public static JSONObject getAppSuccessReturnJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("result", true);
        return obj;
    }

    /**
     * 获取一个Json回复（带msg）
     *
     * @param success
     * @param msg
     * @return
     */
    public static String getJsonMsgReturn(boolean success, String msg) {
        JSONObject obj = new JSONObject();
        obj.put("result", success);
        obj.put("msg", msg);
        return obj.toString();
    }

    /**
     * 过滤文字中的大于号跟小于号、双引号
     *
     * @param showText
     * @return
     */
    public static String filterShowText(String showText) {
        if (Tool.isEmpty(showText)) {
            return showText;
        }
        return showText.replace("<", "").replace(">", "").replace("\"", "").replace("\'", "");
    }

    /**
     * 将int数字转换成对应ASCII字符
     *
     * @param data
     * @return
     */
    public static String getStringFromHex(long data) {
        return new Character((char) data).toString();
    }

    /**
     * 转换字符串为容易阅读的16进制数据
     *
     * @param command
     * @return
     */
    public static String showData(String command) {
        String str = "";
        for (char c : command.toCharArray()) {
            String hexString = Integer.toHexString(c);
            if (hexString.length() == 1) {
                hexString = "0" + hexString;
            }
            str += hexString + " ";
        }
        return str.trim();
    }

    /**
     * 获取高四位
     *
     * @param data
     * @return 16进制字符串
     */
    public static String getHeight4(int data) {
        int height = ((data & 0xf0) >> 4);
        return Integer.toHexString(height);
    }

    /**
     * 获取低四位
     *
     * @param data
     * @return 16进制字符串
     */
    public static String getLow4(int data) {
        int low = (data & 0x0f);
        return Integer.toHexString(low);
    }

    /**
     * 创建6位随机数字验证码
     *
     * @return
     */
    public static String createRendomVerifyCode() {
        String verifyCode = "";
        for (int i = 0; i < 6; i++) {
            verifyCode += random.nextInt(10);
        }
        return verifyCode;
    }

    /**
     * 配置Token在4小时之后过期
     *
     * @return
     */
    public static synchronized boolean isTokenTimeout(Date tokenCreateTime) {
        Calendar now = Calendar.getInstance();
        // 用户token有效期改为一周
        now.add(Calendar.DATE, -7);
        return now.getTime().after(tokenCreateTime);
    }

    /**
     * 获取token过期时间戳
     *
     * @param createDatetime
     * @return
     */
    public static long getTokenTimelimit(Date createDatetime) {
        Calendar createDate = Calendar.getInstance();
        createDate.setTime(createDatetime);
        createDate.add(Calendar.DATE, +7);
        return createDate.getTimeInMillis() / 1000;
    }

    /**
     * 校验1分钟内是否执行或超时订单扫描清理工作
     *
     * @param latestExecutionTime 上次扫描时间
     * @return
     */
    public static boolean isExecuted(String latestExecutionTime, int period) {
        if (TextUtils.isBlank(latestExecutionTime)) {
            return true;
        } else {
            Date latestDate = Tool.parseDatetime(latestExecutionTime);
            Calendar now = Calendar.getInstance();
            now.add(Calendar.MINUTE, period);
            return now.getTime().after(latestDate);
        }
    }

    /**
     * 解码BASEd64加密的内容
     *
     * @return
     */
    public static String decodeBase64(String text) {
        BASE64Decoder decode = new BASE64Decoder();
        try {
            return new String(decode.decodeBuffer(text));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 递归删除目录下的所有文件及子目录下所有文件
     *
     * @param dir 将要删除的文件目录
     * @return boolean Returns "true" if all deletions were successful.
     * If a deletion fails, the method stops attempting to
     * delete and returns "false".
     */
    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            //递归删除目录中的子目录下
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }

    /**
     * 从通讯数据中获取设备时间
     *
     * @param timeText
     * @return
     */
    public static Calendar getDeviceCalendar(String timeText) {
        Calendar deviceCalendar = Calendar.getInstance();
        deviceCalendar.set(Calendar.YEAR, timeText.charAt(0) + 2000);
        deviceCalendar.set(Calendar.MONTH, timeText.charAt(1) - 1);
        deviceCalendar.set(Calendar.DAY_OF_MONTH, timeText.charAt(2));
        deviceCalendar.set(Calendar.HOUR_OF_DAY, timeText.charAt(3));
        deviceCalendar.set(Calendar.MINUTE, timeText.charAt(4));
        deviceCalendar.set(Calendar.SECOND, timeText.charAt(5));
        deviceCalendar.set(Calendar.MILLISECOND, 0);
        return deviceCalendar;
    }


    /**
     * 从惠程协议的通讯数据中获取设备时间
     *
     * @param timeText
     * @return
     */
    public static Calendar getHCDeviceCalendar(String timeText) {
        Calendar deviceCalendar = Calendar.getInstance();
        deviceCalendar.set(Calendar.YEAR, Integer.parseInt(Integer.toHexString(timeText.charAt(0)) + Integer.toHexString(timeText.charAt(1))));
        deviceCalendar.set(Calendar.MONTH, Integer.parseInt(Integer.toHexString(timeText.charAt(2))));
        deviceCalendar.set(Calendar.DAY_OF_MONTH, Integer.parseInt(Integer.toHexString(timeText.charAt(3))));
        deviceCalendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(Integer.toHexString(timeText.charAt(4))));
        deviceCalendar.set(Calendar.MINUTE, Integer.parseInt(Integer.toHexString(timeText.charAt(5))));
        deviceCalendar.set(Calendar.SECOND, Integer.parseInt(Integer.toHexString(timeText.charAt(6))));
        deviceCalendar.set(Calendar.MILLISECOND, 0);
        return deviceCalendar;
    }

    /**
     * MD5加密
     *
     * @param password
     * @return
     */
    public static String md5(String password) {
        if (isEmpty(password)) {
            return "";
        }
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte b[] = md.digest();

            int i;

            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            return buf.toString();
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 生成指定长度的随机字符串（包含大小写字母、数字）
     *
     * @param length 表示生成字符串的长度
     * @return 返回字符串类型结果
     */
    public static String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * 生成指定长度的随机数字字符串
     *
     * @param length 表示生成字符串的长度
     * @return 返回字符串类型结果
     */
    public static String getRandomInt(int length) {
        String base = "1234567890";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public static String getStringFromMap(Map<String, Object> map, String key, String defaultValue) {
        if (key == "" || key == null) {
            return defaultValue;
        }
        String result = (String) map.get(key);
        if (result == null) {
            return defaultValue;
        } else {
            return result;
        }
    }

    public static int getIntFromMap(Map<String, Object> map, String key) {
        if (key == "" || key == null) {
            return 0;
        }
        if (map.get(key) == null) {
            return 0;
        }
        return Integer.parseInt((String) map.get(key));
    }

    public static InputStream getStringStream(String sInputString) {
        ByteArrayInputStream tInputStringStream = null;
        if (sInputString != null && !sInputString.trim().equals("")) {
            tInputStringStream = new ByteArrayInputStream(sInputString.getBytes());
        }
        return tInputStringStream;
    }

    public static String generateTradeNo() {
        String time = timeMillis.format(new Date());
        time += getRandomInt(3);
        return time;
    }

    /**
     * 获取一个0到max-1之间的随机整数
     *
     * @param max
     * @return
     */
    public static int nextInt(int max) {
        return random.nextInt(max);
    }

    @SuppressWarnings("rawtypes")
    public static Object getObjectFromXML(String xml, Class clazz) {
        //将从API返回的XML数据映射到Java对象
        XStream xStreamForResponseData = new XStream();
        xStreamForResponseData.alias("xml", clazz);
        xStreamForResponseData.ignoreUnknownElements();//暂时忽略掉一些新增的字段
        return xStreamForResponseData.fromXML(xml);
    }

    /**
     * 检测序列号是否合法（不存在低于0x30的数据为合法数据）
     *
     * @param serialNum
     * @return
     */
    public static boolean checkSerialNumValid(String serialNum) {
        for (int i = 0; i < serialNum.length(); i++) {
            if (serialNum.charAt(i) < 0x30) {
                return false;
            }
        }
        return true;
    }

    /**
     * 检查app上传的坐标参数是否需要计算距离
     * 为空不计算、为零不计算
     *
     * @param lonLat
     * @return
     */
    public static boolean checkLonLat(String lonLat) {
        if (!TextUtils.isBlank(lonLat) && !",".equals(lonLat)) {
            String gps[] = lonLat.split(",");
            Double lon = Double.parseDouble(gps[0]);
            Double lat = Double.parseDouble(gps[1]);

            if (lon > 0 || lat > 0) {
                return true;
            }
        }

        return false;
    }

    public static String convertCardNum(String cardNum) {
        String fixCardNum = "";
        for (int i = 0; i < 16 - cardNum.length(); i++) {
            fixCardNum += "0";
        }

        fixCardNum += cardNum;
        String data = "";
        for (int i = 1; i <= fixCardNum.length(); i++) {
            if (i % 2 == 1) {
                data += Tool.getStringFromHex((Integer.parseInt(fixCardNum.substring(i - 1, i)) << 4) + Integer.parseInt(fixCardNum.substring(i, i + 1)));
            }
        }

        return data;
    }

    /**
     * 高位补零
     *
     * @param number
     * @param length
     * @return
     */
    public static String fillZeros(int number, int length) {
        String text = String.valueOf(number);
        return fillZeros(text, length);
    }

    /**
     * 高位补零
     *
     * @param number
     * @param length 需要补多少位
     * @return
     */
    public static String fillZeros(String number, int length) {
        while (number.length() < length) {
            number = "0" + number;
        }
        return number;
    }

    /**
     * get version numbers
     *
     * @param version
     * @return
     */
    public static int getVersionNumber(final String version) {
        if (isEmpty(version)) {
            return 0;
        }

        String versionText = version;

        versionText = versionText.replace(".", "");
        try {
            return Integer.parseInt(versionText);
        } catch (NumberFormatException e) {
        }
        return 0;
    }

    /**
     * 格式化秒数为“天-时-分”的格式
     *
     * @param totalSeconds
     * @return
     */
    public static String formatSeconds(long totalSeconds) {
        String result = "";
        if (0L == totalSeconds) {
            return "0分钟";
        }

        long hours = totalSeconds / 3600;
        if (0L != hours) {
            result += hours + "小时";
        }

        long minutes = (totalSeconds - hours * 3600) / 60;
        if (0L != minutes) {
            result += minutes + "分钟";
        } else {
            result += "0分钟";
        }

        return result;
    }

    /**
     * 判断是否是正整数
     *
     * @param text
     * @return
     */
    public static boolean isPositiveNumber(String text) {
        String reg = "[1-9]\\d*";
        return text.matches(reg);
    }

    public static List<Long> changeListTypeToLong(List<String> stringList) {
        List<Long> resultList = new ArrayList<>();
        for (String str : stringList) {
            resultList.add(Long.parseLong(str));
        }

        return resultList;
    }

    /**
     * 检查时间是否已经到过期时间
     *
     * @param expiresDate
     * @return
     */
    public static boolean isExpired(Date expiresDate) {
        DateTime expireTime = new DateTime(expiresDate);
        return expireTime.isBeforeNow();
    }

    /**
     * 获取字符串中判断某个字符出现的次数
     *
     * @param str        源字符串
     * @param includeStr 包含的字符
     * @return
     */
    public static int getStrNum(String str, String includeStr) {
        int x = 0;
        //遍历数组的每个元素
        for (int i = 0; i <= str.length() - 1; i++) {
            String getstr = str.substring(i, i + 1);
            if (getstr.equals(includeStr)) {
                x++;
            }
        }
        return x;
    }

    // Bean --> Map 1: 利用Introspector和PropertyDescriptor 将Bean --> Map
    public static Map<String, Object> transBean2Map(Object obj) throws Exception {
        if (obj == null) {
            return null;
        }
        Map<String, Object> map = new HashMap<>();
        BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
        for (PropertyDescriptor property : propertyDescriptors) {
            String key = property.getName();
            // 过滤class属性
            if (!key.equals("class")) {
                // 得到property对应的getter方法
                Method getter = property.getReadMethod();
                Object value = getter.invoke(obj);

                map.put(key, value);
            }
        }
        return map;
    }

    public static JSONObject getJsonDataReturn(long total, List<Map<String, Object>> dataList) throws Exception {
        JSONObject resultObj = new JSONObject();
        resultObj.put("total", total);
        JSONArray array = new JSONArray();
        if (dataList != null && dataList.size() > 0) {
            for (Map<String, Object> data : dataList) {
                JSONObject obj = new JSONObject();
                for (Map.Entry<String, Object> entry : data.entrySet()) {
                    obj.put(entry.getKey(), entry.getValue());
                }
                array.add(obj);
            }
        }
        resultObj.put("rows", array);
        return resultObj;
    }


}
