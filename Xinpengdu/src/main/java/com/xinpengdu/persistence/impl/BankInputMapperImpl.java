package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.BankInput;
import com.xinpengdu.persistence.BankInputMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 银行录入持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午9:57:08
 */
@Repository
public class BankInputMapperImpl extends MybatisRepositorySupport<String, BankInput> implements BankInputMapper {
    
    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.BankInputMapper";
    }

    @Override
    public BankInput getBankInputEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
