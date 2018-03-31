package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.access.RolePermissionRecord;
import com.xinpengdu.persistence.RolePermissionRecordMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 菜单权限持久化服务实现类
 */
@Repository
public class RolePermissionRecordMapperImpl extends MybatisRepositorySupport<String, RolePermissionRecord> implements RolePermissionRecordMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.RolePermissionRecordMapper";
    }

    @Override
    public List<Map<String, Object>> getPermissionListByRoleId(long roleId) {
        return getSqlSession().selectList(getNamespace().concat(".getPermissionListByRoleId"), roleId);
    }

    @Override
    public List<Map<String, Object>> getDistinctPermissionListByRoleId(long roleId) {
        return getSqlSession().selectList(getNamespace().concat(".getDistinctPermissionListByRoleId"), roleId);
    }

    @Override
    public RolePermissionRecord getRolePermissionRecordEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
