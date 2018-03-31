package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.access.Role;
import com.xinpengdu.persistence.RoleMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 权限持久化服务实现类
 */
@Repository
public class RoleMapperImpl extends MybatisRepositorySupport<String, Role> implements RoleMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.RoleMapper";
    }

    @Override
    public Role getRoleEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
