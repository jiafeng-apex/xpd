package com.xinpengdu.persistence;


import com.xinpengdu.entity.access.RolePermissionRecord;

import java.util.List;
import java.util.Map;

/**
 * 菜单权限持久化服务类
 */
public interface RolePermissionRecordMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<RolePermissionRecord> query(Object value);

    void save(RolePermissionRecord rolePermissionRecord);

    RolePermissionRecord get(String id);

    List<Map<String,Object>> getPermissionListByRoleId(long roleId);

    List<Map<String,Object>> getDistinctPermissionListByRoleId(long roleId);

    RolePermissionRecord getRolePermissionRecordEditInfo(Map<String, Object> params);

    void update(RolePermissionRecord rolePermissionRecord);

    void deleteById(String id);

}
