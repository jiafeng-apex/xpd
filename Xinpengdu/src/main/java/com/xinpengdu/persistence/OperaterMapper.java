package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.Operater;

import java.util.List;
import java.util.Map;

/**
 * 操作用户持久化服务类
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午9:06:34
 */
public interface OperaterMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    void save(Operater operater);

    Operater get(String id);

    Operater getOperaterEditInfo(Map<String, Object> params);

    Operater checkOperater(Map<String, Object> params);

    void update(Operater operater);

    void deleteById(String id);

    Operater getOperaterByLoginName(Map<String, Object> params);

}
