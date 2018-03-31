package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.MaterialInvoice;
import com.xinpengdu.persistence.MaterialInvoiceMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 材料发票持久化服务实现类
 */
@Repository
public class MaterialInvoiceMapperImpl extends MybatisRepositorySupport<String, MaterialInvoice> implements MaterialInvoiceMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.MaterialInvoiceMapper";
    }

    @Override
    public MaterialInvoice getMaterialInvoiceEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public List<MaterialInvoice> getNeedSyncList(Map<String, Object> params) {
        return getSqlSession().selectList(getNamespace().concat(".getNeedSyncList"), params);
    }

    @Override
    public List<MaterialInvoice> getChooseSyncList(Map<String, Object> params) {
        return getSqlSession().selectList(getNamespace().concat(".getChooseSyncList"), params);
    }

    @Override
    public void updateByExternalInvoiceId(String externalInvoiceId) {
        getSqlSession().update(getNamespace().concat(".updateByExternalInvoiceId"), externalInvoiceId);
    }


}
