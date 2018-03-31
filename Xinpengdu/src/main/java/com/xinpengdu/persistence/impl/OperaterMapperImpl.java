package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.Operater;
import com.xinpengdu.persistence.OperaterMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 操作用户持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午9:06:34
 */
@Repository
public class OperaterMapperImpl extends MybatisRepositorySupport<String, Operater> implements OperaterMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.OperaterMapper";
    }

    @Override
    public Operater getOperaterEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public Operater checkOperater(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".checkOperater"), params);
    }

    @Override
    public Operater getOperaterByLoginName(Map<String, Object> params){
        return getSqlSession().selectOne(getNamespace().concat(".getOperaterByLoginName"), params);
    }

}
