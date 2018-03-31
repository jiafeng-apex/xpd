package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.Invoice;
import com.xinpengdu.persistence.InvoiceMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 发票信息持久化服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午9:57:08
 */
@Repository
public class InvoiceMapperImpl extends MybatisRepositorySupport<String, Invoice> implements InvoiceMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.InvoiceMapper";
    }

    @Override
    public Invoice getInvoiceEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public void deleteByExternalInvoiceId(String id) {
        this.getSqlSession().delete(this.getNamespace() + ".deleteByExternalInvoiceId", id);
    }

    @Override
    public Invoice getNewestInvoiceInfo(String projectId) {
        return getSqlSession().selectOne(getNamespace().concat(".getNewestInvoiceInfo"), projectId);
    }
}
