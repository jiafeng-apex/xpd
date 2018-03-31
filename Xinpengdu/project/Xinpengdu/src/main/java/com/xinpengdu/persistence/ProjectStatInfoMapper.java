package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.ProjectStatInfo;

import java.util.List;
import java.util.Map;

/**
 * 项目统计信息服务持久化类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface ProjectStatInfoMapper {

    int count(Map<String, Object> params);

    Map<String, Object> getProjectStatInfo(Map<String, Object> params);

    String getPmTotalAmount(Map<String, Object> params);

    ProjectStatInfo getInvoiceAmountStat(Map<String, Object> params);

    String getReceiptAmountStat(Map<String, Object> params);

    Map<String, Object> getInvoiceStat(Map<String, Object> params);

    List<Map<String, Object>> getInvoiceTaxBillStat(Map<String, Object> params);

    int getContractAmountTotalOfLabourserviceinvoice(Map<String, Object> params);

    int getPayAmountTotalOfLabourserviceinvoice(Map<String, Object> params);

    List<Map<String, Object>> getLabourserviceinvoiceStat(Map<String, Object> params);

    int getContractAmountTotalOfMaterialContract(Map<String, Object> params);

    int getPayAmountTotalOfMaterialContract(Map<String, Object> params);

    List<Map<String, Object>> getMaterialContractStat(Map<String, Object> params);

}
