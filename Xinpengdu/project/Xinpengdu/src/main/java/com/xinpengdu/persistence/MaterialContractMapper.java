package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.MaterialContract;

import java.util.List;
import java.util.Map;

/**
 * 材料合同持久化服务类
 */
public interface MaterialContractMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<MaterialContract> query(Object value);

    void save(MaterialContract materialContract);

    MaterialContract get(String id);

    MaterialContract getMaterialContractEditInfo(Map<String, Object> params);

    void update(MaterialContract materialContract);

    void deleteById(String id);

}
