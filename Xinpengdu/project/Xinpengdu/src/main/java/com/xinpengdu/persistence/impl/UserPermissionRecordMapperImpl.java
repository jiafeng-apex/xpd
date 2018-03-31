package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.access.UserPermissionRecord;
import com.xinpengdu.persistence.UserPermissionRecordMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 菜单权限持久化服务实现类
 */
@Repository
public class UserPermissionRecordMapperImpl extends MybatisRepositorySupport<String, UserPermissionRecord> implements UserPermissionRecordMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.UserPermissionRecordMapper";
    }

    @Override
    public List<Map<String, Object>> getPermissionListByUserId(Map<String, Object> params) {
        return getSqlSession().selectList(getNamespace().concat(".getPermissionListByUserId"), params);
    }

    @Override
    public List<Map<String, Object>> getDistinctPermissionListByUserId(long userId) {
        return getSqlSession().selectList(getNamespace().concat(".getDistinctPermissionListByUserId"), userId);
    }

    @Override
    public UserPermissionRecord getUserPermissionRecordEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getUserPermissionRecordEditInfo"), params);
    }

    @Override
    public  void deleteByUserId(Long userId){
        getSqlSession().delete(getNamespace().concat(".deleteByUserId"), userId);
    }
}
