package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.Certigier;
import com.xinpengdu.persistence.CertigierMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 授权人持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:31
 */
@Repository
public class CertigierMapperImpl extends MybatisRepositorySupport<String, Certigier> implements CertigierMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.CertigierMapper";
    }

    @Override
    public Certigier getCertigierEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
