package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.EvectionPostpone;

import java.util.List;
import java.util.Map;

/**
 * 外出证延期持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface EvectionPostponeMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<EvectionPostpone> query(Object value);

    void save(EvectionPostpone evectionPostpone);

    EvectionPostpone get(String id);

    EvectionPostpone getEvectionPostponeEditInfo(Map<String, Object> params);

    void update(EvectionPostpone evectionPostpone);

    void deleteById(String id);

}
