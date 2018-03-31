package com.xinpengdu.persistence;


import com.xinpengdu.entity.project.InvoiceTaxBill;

import java.util.List;
import java.util.Map;

/**
 * 发票税单持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface InvoiceTaxBillMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Map<String, Object>> query(Object value);

    void save(InvoiceTaxBill invoiceTaxBill);

    InvoiceTaxBill get(String id);

    InvoiceTaxBill getInvoiceTaxBillEditInfo(Map<String, Object> params);

    void update(InvoiceTaxBill invoiceTaxBill);

    void deleteById(String id);

}
