package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.LabourServiceGeld;
import com.xinpengdu.persistence.LabourServiceGeldMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 劳务费支付款持久化服务实现类
 */
@Repository
public class LabourServiceGeldMapperImpl extends MybatisRepositorySupport<String, LabourServiceGeld> implements LabourServiceGeldMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.LabourServiceGeldMapper";
    }

    @Override
    public LabourServiceGeld getLabourServiceGeldEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public void updates(Map<String, Object> params){
        this.getSqlSession().update(this.getNamespace() + ".updates", params);
    }
}
