package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.MaterialGeld;
import com.xinpengdu.persistence.MaterialGeldMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 材料支付款持久化服务实现类
 */
@Repository
public class MaterialGeldMapperImpl extends MybatisRepositorySupport<String, MaterialGeld> implements MaterialGeldMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.MaterialGeldMapper";
    }

    @Override
    public MaterialGeld getMaterialGeldEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public void updates(Map<String, Object> params){
        this.getSqlSession().update(this.getNamespace() + ".updates", params);
    }
}
