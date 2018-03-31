package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.LabourServiceInvoice;

import java.util.List;
import java.util.Map;

/**
 * 劳务费发票持久化服务类
 */
public interface LabourServiceInvoiceMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<LabourServiceInvoice> query(Object value);

    void save(LabourServiceInvoice labourServiceInvoice);

    LabourServiceInvoice get(String id);

    LabourServiceInvoice getLabourServiceInvoiceEditInfo(Map<String, Object> params);

    void update(LabourServiceInvoice labourServiceInvoice);

    void deleteById(String id);

    List<LabourServiceInvoice> getNeedSyncList(Map<String, Object> params);

    List<LabourServiceInvoice> getChooseSyncList(Map<String, Object> params);

    void updateByExternalInvoiceId(String externalInvoiceId);
}
