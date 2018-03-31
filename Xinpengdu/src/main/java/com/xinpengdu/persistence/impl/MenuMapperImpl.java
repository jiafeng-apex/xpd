package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.access.Menu;
import com.xinpengdu.persistence.MenuMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 菜单持久化服务实现类
 */
@Repository
public class MenuMapperImpl extends MybatisRepositorySupport<String, Menu> implements MenuMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.MenuMapper";
    }

    @Override
    public Menu getMenuEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
