package com.xinpengdu;

import com.xinpengdu.entity.project.Invoice;
import net.sf.json.JSONObject;

/**
 * Created by jiafeng on 17/8/13.
 */
public class Test {
    public static void main(String[] args) {
     String data =  "{\"projectId\":\"bd27ab03-1f59-4505-b67b-7e1aeb0cdb93\",\"invoiceId\":\"\",\"businessTax\":\"12,111.00\",\"invoiceDate\":\"2017-08-13\"," +
             "\"constructionTax\":\"1.00\",\"invoiceNumber\":\"2\",\"educationalSurtax\":\"13.00\",\"invoiceAmount\":\"4.00\",\"areaEducationalSurtax\":\"5" +
             ".00\",\"billNo\":\"6\",\"corporateIncomeTax\":\"7.00\",\"tax\":\"8.00\",\"individualIncomeTax\":\"9.00\",\"taxPaymentPlace\":\"19\"," +
             "\"stampDuty\":\"11.00\",\"otherTax\":\"12.00\",\"remark\":\"13\"}";
        System.out.println(data);
        Invoice invoice = (Invoice) JSONObject.toBean(JSONObject.fromObject(data),Invoice.class);

//        Invoice invoice = (Invoice) JSONObject.toBean(JSONObject.fromObject(data));
        System.out.println(invoice.toString());

        String str = "{\"order_no\":\"KZ1549170813973\",\"device_sn\":\"1712710000090024\",\"interface_code\":\"00\",\"user_id\":\"13613510992\"," +
                "\"user_type\":\"0\",\"qty\":16.95,\"money\":13.56,\"service_money\":0.0,\"charge_time\":1464,\"voltage\":233,\"current\":59,\"soc\":0.0," +
                "\"status\":2}";

        ChargeRealTimeData s1 = (ChargeRealTimeData) JSONObject.toBean(JSONObject.fromObject(str),ChargeRealTimeData.class);
        System.out.println(s1.toString());
//        ChargeRealTimeData chargeRealTimeData = (ChargeRealTimeData) JSONObject.toBean(JSONObject.fromObject(str));
//        System.out.println(chargeRealTimeData.toString());



    }
}
