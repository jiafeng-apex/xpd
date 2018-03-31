package com.xinpengdu.persistence;


import com.xinpengdu.entity.access.Role;

import java.util.List;
import java.util.Map;

/**
 * 权限持久化服务类
 */
public interface RoleMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Role> query(Object value);

    void save(Role role);

    Role get(String id);

    Role getRoleEditInfo(Map<String, Object> params);

    void update(Role role);

    void deleteById(String id);

}
