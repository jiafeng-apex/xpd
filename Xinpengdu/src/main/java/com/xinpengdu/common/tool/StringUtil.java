package com.xinpengdu.common.tool;

import org.apache.commons.lang.StringUtils;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @description: 字符工具类
 * @author Sunjf
 * @date 2016-1-4 下午6:28:42
 */
public final class StringUtil {

    private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
    private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
    private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
    private static final String regEx_space = "\\s*|\t|\r|\n";// 定义空格回车换行符

    private StringUtil() {
    }

    public static String suffix(String filename) {
        if (isBlank(filename)) {
            return "";
        }
        int dotIndex = filename.lastIndexOf('.');
        if (dotIndex == -1) {
            return "";
        }
        return filename.substring(dotIndex + 1);
    }

    public static boolean isBlank(String text) {
        if (isEmpty(text)) {
            return true;
        }
        int length = text.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isWhitespace(text.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    /**
     * eg : null => true eg : "" => true
     * 
     * @param text
     * @return
     */
    public static boolean isEmpty(String text) {
        if (null != text && !"".equals(text.trim())) {
            return false;
        }
        return true;
    }

    public static boolean isNotEmpty(String s) {
        return s != null && (s.trim().length() > 0);
    }

    /**
     * 首字母大写
     * 
     * @return String
     */
    public static String headUpperCase(String str) {
        if (str.length() >= 1) {
            str = str.replaceFirst(str.substring(0, 1), str.substring(0, 1).toUpperCase());
        }
        return str;
    }

    /**
     * 
     * @Description: 将Object转成String
     * @param object
     * @return
     * @return String
     */
    public static String parString(Object object) {
        if (object == null) {
            return null;
        } else {
            return object.toString();
        }

    }

    /**
     * @description 对字符乱码的转换
     * @param obj
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String convert(Object obj) throws UnsupportedEncodingException {
        if (obj != null) {
            return new String(obj.toString().getBytes("ISO-8859-1"), "UTF-8");
        } else {
            return "";
        }
    }

    /**
     * 
     * @description 转换数组，如果为null返回空，如果子集有空值去掉
     * @param array
     * @return
     */
    public static String[] convertArray(String[] array) {
        if (array == null) {
            return new String[] {};
        } else if (array.length == 0) {
            return array;
        } else {
            List<String> list = new ArrayList<String>();
            for (String str : array) {
                if (StringUtils.isNotBlank(str)) {
                    list.add(str);
                }
            }
            return (String[]) list.toArray(new String[list.size()]);
        }
    }

    /**
     * 
     * @description 如果是null值返回空字符串
     * @param obj
     * @return
     */
    public static String removeNull(Object obj) {
        if (obj == null) {
            return "";
        }
        return obj.toString();
    }

    /**
     * 
     * @description 删除Html标签
     * @param htmlStr
     * @return
     */
    public static String delHTMLTag(String htmlStr) {
        if (StringUtils.isBlank(htmlStr)) {
            return "";
        }
        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
        Matcher m_script = p_script.matcher(htmlStr);
        htmlStr = m_script.replaceAll(""); // 过滤script标签

        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
        Matcher m_style = p_style.matcher(htmlStr);
        htmlStr = m_style.replaceAll(""); // 过滤style标签

        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
        Matcher m_html = p_html.matcher(htmlStr);
        htmlStr = m_html.replaceAll(""); // 过滤html标签

        Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);
        Matcher m_space = p_space.matcher(htmlStr);
        htmlStr = m_space.replaceAll("");
        htmlStr = htmlStr.replaceAll("&nbsp;", "");
        return htmlStr.trim(); // 返回文本字符串
    }

    /**
     * 
     * @description 截取40个字符
     * @param content
     * @return
     */
    public static String getBrief(String content) {
        content = delHTMLTag(content);
        if (content.length() > 40) {
            return content.substring(0, 40);
        } else {
            return content.substring(0, content.length());
        }
    }

    /**
     * 模糊查询时通配符过滤 输入时 wk
     * 
     * @param str
     * @return
     */
    public static String sqlMarkFilterInput(String str) {
        str = str.replace("_", "/_");
        str = str.replace("%", "/%");
        return str;
    }

    /**
     * 模糊查询时通配符过滤 页面显示要还原 wk
     * 
     * @param str
     * @return
     */
    public static String sqlMarkFilterOut(String str) {
        str = str.replace("/_", "_");
        str = str.replace("/%", "%");
        return str;
    }

    /**
     * 判断字符串是否为数字
     * 
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }
}
