package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.Invoice;

import java.util.List;
import java.util.Map;

/**
 * 发票信息持久化服务类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:42:49
 */
public interface InvoiceMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Invoice> query(Object value);

    void save(Invoice invoice);

    Invoice get(String id);

    Invoice getNewestInvoiceInfo(String projectId);

    Invoice getInvoiceEditInfo(Map<String, Object> params);

    void update(Invoice invoice);

    void deleteById(String id);

    void deleteByExternalInvoiceId(String id);

}
