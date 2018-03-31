package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.LabourServiceFee;
import com.xinpengdu.persistence.LabourServiceFeeMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 劳务费持久化服务实现类
 */
@Repository
public class LabourServiceFeeMapperImpl extends MybatisRepositorySupport<String, LabourServiceFee> implements LabourServiceFeeMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.LabourServiceFeeMapper";
    }

    @Override
    public LabourServiceFee getLabourServiceFeeEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
