package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.Evection;
import com.xinpengdu.persistence.EvectionMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 外出证信息持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午9:57:08
 */
@Repository
public class EvectionMapperImpl extends MybatisRepositorySupport<String, Evection> implements EvectionMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.EvectionMapper";
    }

    @Override
    public Evection getEvectionEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
