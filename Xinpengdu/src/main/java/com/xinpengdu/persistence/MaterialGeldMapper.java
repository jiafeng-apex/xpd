package com.xinpengdu.persistence;


import com.xinpengdu.entity.project.MaterialGeld;

import java.util.List;
import java.util.Map;

/**
 * 材料支付款持久化服务类
 */
public interface MaterialGeldMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<MaterialGeld> query(Object value);

    void save(MaterialGeld materialGeld);

    MaterialGeld get(String id);

    MaterialGeld getMaterialGeldEditInfo(Map<String, Object> params);

    void update(MaterialGeld materialGeld);

    void deleteById(String id);

    void updates(Map<String, Object> params);
}
