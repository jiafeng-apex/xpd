package com.xinpengdu.common.tool;

public class CreateSql {
    public static void main(String[] args) {

        String str = "recordId,userId,menuId,permissionCode";
        String[] strs = str.split(",");
        for (String s : strs) {
            System.out.println("<result column=\"" + s + "\" property=\"" + s + "\" jdbcType=\"VARCHAR\" />");
        }
        System.out.println("########################### --- INSET 列 --- ###########################################");
        for (String s : strs) {
            System.out.println("<if test=\"" + s + " != null\" >");
            System.out.println("\t" + s + ",");
            System.out.println("</if>");
        }
        System.out.println("########################### --- INSET 值 --- ###########################################");
        for (String s : strs) {
            System.out.println("<if test=\"" + s + " != null\" >");
            System.out.println("\t#{" + s + ",jdbcType=VARCHAR},");
            System.out.println("</if>");
        }
        System.out.println("########################### --- UPDATE --- ###########################################");
        for (String s : strs) {
            System.out.println("<if test=\"" + s + " != null\" >");
            System.out.println("\t" + s + " = #{" + s + ",jdbcType=VARCHAR},");
            System.out.println("</if>");
        }

    }
}
