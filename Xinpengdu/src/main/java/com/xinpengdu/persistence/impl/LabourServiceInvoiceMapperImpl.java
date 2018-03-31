package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.LabourServiceInvoice;
import com.xinpengdu.persistence.LabourServiceInvoiceMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 劳务费发票持久化服务实现类
 */
@Repository
public class LabourServiceInvoiceMapperImpl extends MybatisRepositorySupport<String, LabourServiceInvoice> implements LabourServiceInvoiceMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.LabourServiceInvoiceMapper";
    }

    @Override
    public LabourServiceInvoice getLabourServiceInvoiceEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }


    @Override
    public List<LabourServiceInvoice> getNeedSyncList(Map<String, Object> params){
        return getSqlSession().selectList(getNamespace().concat(".getNeedSyncList"), params);
    }

    @Override
    public List<LabourServiceInvoice> getChooseSyncList(Map<String, Object> params) {
        return getSqlSession().selectList(getNamespace().concat(".getChooseSyncList"), params);
    }

    @Override
    public void updateByExternalInvoiceId(String externalInvoiceId) {
        getSqlSession().update(getNamespace().concat(".updateByExternalInvoiceId"), externalInvoiceId);
    }
}
