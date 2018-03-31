package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.InvoiceTaxBill;
import com.xinpengdu.persistence.InvoiceTaxBillMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 发票税单持久化服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午9:57:08
 */
@Repository
public class InvoiceTaxBillMapperImpl extends MybatisRepositorySupport<String, InvoiceTaxBill> implements InvoiceTaxBillMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.InvoiceTaxBillMapper";
    }


    public List query(Object value) {
        List<Map<String, Object>> result = this.getSqlSession().selectList(this.getNamespace() + ".query", value);
        return result;
    }

    @Override
    public InvoiceTaxBill getInvoiceTaxBillEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }
}
