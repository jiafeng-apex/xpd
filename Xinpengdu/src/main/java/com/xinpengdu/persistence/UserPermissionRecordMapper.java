package com.xinpengdu.persistence;


import com.xinpengdu.entity.access.UserPermissionRecord;

import java.util.List;
import java.util.Map;

/**
 * 菜单权限持久化服务类
 */
public interface UserPermissionRecordMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<UserPermissionRecord> query(Object value);

    void save(UserPermissionRecord userPermissionRecord);

    UserPermissionRecord get(String id);

    List<Map<String,Object>> getPermissionListByUserId(Map<String, Object> params);

    List<Map<String,Object>> getDistinctPermissionListByUserId(long userId);

    UserPermissionRecord getUserPermissionRecordEditInfo(Map<String, Object> params);

    void update(UserPermissionRecord userPermissionRecord);

    void deleteById(String id);

    void deleteByUserId(Long userId);
}
