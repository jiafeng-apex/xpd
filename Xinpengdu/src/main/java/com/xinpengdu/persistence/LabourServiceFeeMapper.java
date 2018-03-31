package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.LabourServiceFee;

import java.util.List;
import java.util.Map;

/**
 * 劳务费持久化服务类
 */
public interface LabourServiceFeeMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<LabourServiceFee> query(Object value);

    void save(LabourServiceFee labourServiceFee);

    LabourServiceFee get(String id);

    LabourServiceFee getLabourServiceFeeEditInfo(Map<String, Object> params);

    void update(LabourServiceFee labourServiceFee);

    void deleteById(String id);

}
