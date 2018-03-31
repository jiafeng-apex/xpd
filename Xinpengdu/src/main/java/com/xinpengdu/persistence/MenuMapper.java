package com.xinpengdu.persistence;


import com.xinpengdu.entity.access.Menu;

import java.util.List;
import java.util.Map;

/**
 * 菜单持久化服务类
 */
public interface MenuMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Menu> query(Object value);

    void save(Menu menu);

    Menu get(String id);

    Menu getMenuEditInfo(Map<String, Object> params);

    void update(Menu menu);

    void deleteById(String id);

}
