package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.Receipt;
import com.xinpengdu.persistence.ReceiptMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 收据信息持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午9:57:08
 */
@Repository
public class ReceiptMapperImpl extends MybatisRepositorySupport<String, Receipt> implements ReceiptMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.ReceiptMapper";
    }

    @Override
    public Receipt getReceiptEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
