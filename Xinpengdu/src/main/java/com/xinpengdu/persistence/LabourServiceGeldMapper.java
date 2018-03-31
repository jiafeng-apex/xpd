package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.LabourServiceGeld;

import java.util.List;
import java.util.Map;

/**
 * 劳务费支付款持久化服务类
 */
public interface LabourServiceGeldMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<LabourServiceGeld> query(Object value);

    void save(LabourServiceGeld labourServiceGeld);

    LabourServiceGeld get(String id);

    LabourServiceGeld getLabourServiceGeldEditInfo(Map<String, Object> params);

    void update(LabourServiceGeld labourServiceGeld);

    void deleteById(String id);

    void updates(Map<String, Object> params);
}
