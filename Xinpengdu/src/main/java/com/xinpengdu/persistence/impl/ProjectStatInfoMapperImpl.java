package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.ProjectStatInfo;
import com.xinpengdu.persistence.ProjectStatInfoMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 项目统计信息服务持久化实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:31
 */
@Repository
public class ProjectStatInfoMapperImpl extends MybatisRepositorySupport<String, ProjectStatInfo> implements ProjectStatInfoMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.ProjectStatInfoMapper";
    }

    @Override
    public Map<String, Object> getProjectStatInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getProjectInfoStat"), params);
    }

    @Override
    public String getPmTotalAmount(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getPmTotalAmount"), params);
    }

    @Override
    public ProjectStatInfo getInvoiceAmountStat(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getInvoiceAmountStat"), params);
    }

    @Override
    public String getReceiptAmountStat(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getReceiptAmountStat"), params);
    }

    @Override
    public List<Map<String, Object>> getInvoiceTaxBillStat(Map<String, Object> params){
        return getSqlSession().selectList(getNamespace().concat(".getInvoiceTaxBillStat"), params);
    }

    @Override
    public Map<String, Object> getInvoiceStat(Map<String, Object> params){
        return getSqlSession().selectOne(getNamespace().concat(".getInvoiceStat"), params);
    }

    @Override
    public int getContractAmountTotalOfLabourserviceinvoice(Map<String, Object> params){
        return getSqlSession().selectOne(getNamespace().concat(".getContractAmountTotalOfLabourserviceinvoice"), params);
    }

    @Override
    public int getPayAmountTotalOfLabourserviceinvoice(Map<String, Object> params){
        return getSqlSession().selectOne(getNamespace().concat(".getPayAmountTotalOfLabourserviceinvoice"), params);
    }

    @Override
    public List<Map<String, Object>> getLabourserviceinvoiceStat(Map<String, Object> params){
        return getSqlSession().selectList(getNamespace().concat(".getLabourserviceinvoiceStat"), params);
    }

    @Override
    public int getContractAmountTotalOfMaterialContract(Map<String, Object> params){
        return getSqlSession().selectOne(getNamespace().concat(".getContractAmountTotalOfMaterialContract"), params);
    }

    @Override
    public int getPayAmountTotalOfMaterialContract(Map<String, Object> params){
        return getSqlSession().selectOne(getNamespace().concat(".getPayAmountTotalOfMaterialContract"), params);
    }

    @Override
    public List<Map<String, Object>> getMaterialContractStat(Map<String, Object> params){
        return getSqlSession().selectList(getNamespace().concat(".getMaterialContractStat"), params);
    }

}
