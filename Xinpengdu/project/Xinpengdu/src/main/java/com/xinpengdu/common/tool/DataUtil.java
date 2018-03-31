package com.xinpengdu.common.tool;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 * 数据处理工具类
 * 
 * @author Sunjf
 * 
 *         2016-3-16 下午7:01:01
 */
public class DataUtil {

    private DataUtil() {
    }

    public static void main(String[] args) {
        String s = insertComma("5000000.2789", 2);
        System.out.println(s);
        s = delComma(s);
        System.out.println(s);
    }

    /**
     * 金额格式化
     * 
     * @param s
     *            金额
     * @param len
     *            小数位数
     * @return 格式后的金额
     */
    public static String insertComma(String s, int len) {
        if (s == null || s.length() < 1 || s.equals("0.0")) {
            return "";
        }
        NumberFormat formater = null;
        double num = Double.parseDouble(s);
        if (len == 0) {
            formater = new DecimalFormat("###,##0.00");
        } else {
            StringBuffer buff = new StringBuffer();
            buff.append("###,##0.");
            for (int i = 0; i < len; i++) {
                buff.append("0");
            }
            formater = new DecimalFormat(buff.toString());
        }
        return formater.format(num);
    }

    /**
     * 金额去掉“,”
     * 
     * @param s
     *            金额
     * @return 去掉“,”后的金额
     */
    public static String delComma(String s) {
        if(s == null || s == "" || s.equals("")){
            return "0";
        }
        String formatString = "";
        if (s != null && s.length() >= 1) {
            formatString = s.replaceAll(",", "");
        }
        return formatString;
    }

    /**
     * 计算费率
     * @param amount
     * @param rate
     * @return
     */
    public static double rateCalc(String amount, String rate) {
        if (amount == null || amount.equals("") || rate == null || rate.equals("") || rate.equals("0") || rate.equals("0.0")) {
            return 0;
        }
        // 费率需要除以100
        rate = BigDecimalUtil.div(Double.parseDouble(rate), 100) + "";
        BigDecimal b1 = new BigDecimal(delComma(amount));
        BigDecimal b2 = new BigDecimal(rate);
        return b1.multiply(b2).doubleValue();
    }

}
