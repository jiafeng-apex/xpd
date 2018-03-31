package com.xinpengdu.persistence;


import com.xinpengdu.entity.project.Evection;

import java.util.List;
import java.util.Map;

/**
 * 外出证信息持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface EvectionMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Evection> query(Object value);

    void save(Evection evection);

    Evection get(String id);

    Evection getEvectionEditInfo(Map<String, Object> params);

    void update(Evection evection);

    void deleteById(String id);

}
