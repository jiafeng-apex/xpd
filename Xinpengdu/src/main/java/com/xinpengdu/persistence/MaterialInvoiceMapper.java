package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.MaterialInvoice;

import java.util.List;
import java.util.Map;

/**
 * 材料发票服务类
 */
public interface MaterialInvoiceMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<MaterialInvoice> query(Object value);

    void save(MaterialInvoice materialInvoice);

    MaterialInvoice get(String id);

    MaterialInvoice getMaterialInvoiceEditInfo(Map<String, Object> params);

    void update(MaterialInvoice materialInvoice);

    void deleteById(String id);

    List<MaterialInvoice> getNeedSyncList(Map<String, Object> params);

    List<MaterialInvoice> getChooseSyncList(Map<String, Object> params);

    void updateByExternalInvoiceId(String externalInvoiceId);
}
