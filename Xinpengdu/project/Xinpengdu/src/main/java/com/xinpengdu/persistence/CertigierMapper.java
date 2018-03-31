package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.Certigier;

import java.util.List;
import java.util.Map;

/**
 * 授权人持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface CertigierMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Certigier> query(Object value);

    void save(Certigier certigier);

    Certigier get(String id);

    Certigier getCertigierEditInfo(Map<String, Object> params);

    void update(Certigier certigier);

    void deleteById(String id);

}
