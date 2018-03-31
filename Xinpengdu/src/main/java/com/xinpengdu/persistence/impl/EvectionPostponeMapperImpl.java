package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.EvectionPostpone;
import com.xinpengdu.persistence.EvectionPostponeMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 外出证延期信息持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午9:57:08
 */
@Repository
public class EvectionPostponeMapperImpl extends MybatisRepositorySupport<String, EvectionPostpone> implements EvectionPostponeMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.EvectionPostponeMapper";
    }

    @Override
    public EvectionPostpone getEvectionPostponeEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
