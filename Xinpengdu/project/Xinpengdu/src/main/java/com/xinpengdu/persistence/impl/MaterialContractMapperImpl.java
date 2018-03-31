package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.MaterialContract;
import com.xinpengdu.persistence.MaterialContractMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 材料合同持久化服务实现类
 */
@Repository
public class MaterialContractMapperImpl extends MybatisRepositorySupport<String, MaterialContract> implements MaterialContractMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.MaterialContractMapper";
    }

    @Override
    public MaterialContract getMaterialContractEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
