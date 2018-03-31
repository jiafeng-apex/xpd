package com.xinpengdu.service;

import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.ProjectStatInfo;
import com.xinpengdu.persistence.ProjectStatInfoMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目统计信息服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ProjectStatInfoService {

    @Autowired
    private ProjectStatInfoMapper projectStatInfoMapper;

    @Autowired
    private ProjectTollService projectTollService;

    @Autowired
    private ProjectInfoService projectInfoService;

    public String getProjectInfoStat(String projectId) throws Exception {
        Map<String, Object> params = new HashMap();
        params.put("projectId", projectId);
        Map<String, Object> projectInfo = projectInfoService.getProjectInfo(params);
        params.put("pmId", projectInfo.get("pmId"));

        //ProjectStatInfo projectStatInfo = new ProjectStatInfo();
        Map<String, Object> statMap = projectStatInfoMapper.getProjectStatInfo(params);
        if (statMap == null) {
            statMap = new HashMap();
        }

        // 项目经理总余额
        statMap.put("pmTotalAmount",projectStatInfoMapper.getPmTotalAmount(params));
        // 发票总金额
        ProjectStatInfo invoiceStatInfo = projectStatInfoMapper.getInvoiceAmountStat(params);
        if (null != invoiceStatInfo) {
            statMap.put("invoiceAmountStat",invoiceStatInfo.getInvoiceAmountStat());
            statMap.put("taxStat",invoiceStatInfo.getTaxStat());
        }
        // 收据总金额
        statMap.put("receiptAmountStat",projectStatInfoMapper.getReceiptAmountStat(params));
//        // 如果是外地工程，重新计算当地银行收费
//        if (projectInfo.get("projectType").equals("2")) {
//            String localDeposit = projectTollService.getLocalDeposit(projectId, false);
//            statMap.put("localBankDepositStat",localDeposit);
//        }
       // Map<String, Object> statMap = Tool.transBean2Map(projectStatInfo);
        JSONObject statObj = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : statMap.entrySet()) {
            statObj.put(entry.getKey(), entry.getValue());
        }
        return statObj.toString();
    }


    public String getInvoiceStat(String projectId) throws Exception {
        Map<String, Object> params = new HashMap();
        params.put("projectId", projectId);

        Map<String, Object> statMap = projectStatInfoMapper.getInvoiceStat(params);
        if (statMap == null) {
            statMap = new HashMap();
        }

        List<Map<String, Object>> statList = projectStatInfoMapper.getInvoiceTaxBillStat(params);
        if (statList == null) {
            statList = new ArrayList<Map<String, Object>>();
        }

        statMap.put("invoiceTaxBillStat",statList);

        JSONObject jsonObject = new JSONObject();
        JSONObject obj= jsonObject.fromObject(statMap);
        return obj.toString();
    }

    public String getLabourserviceinvoiceStat(String projectId) throws Exception {
        Map<String, Object> params = new HashMap();
        params.put("projectId", projectId);

        Map<String, Object> statMap = new HashMap();

        int contractAmountTotal = projectStatInfoMapper.getContractAmountTotalOfLabourserviceinvoice(params);

        int payAmountTotal = projectStatInfoMapper.getPayAmountTotalOfLabourserviceinvoice(params);

        statMap.put("payAmountTotal",payAmountTotal);
        statMap.put("noPayAmountTotal",contractAmountTotal-payAmountTotal);

        List<Map<String, Object>> statList = projectStatInfoMapper.getLabourserviceinvoiceStat(params);
        if (statList == null) {
            statList = new ArrayList<Map<String, Object>>();
        }
        statMap.put("labourserviceinvoiceStat",statList);

        JSONObject jsonObject = new JSONObject();
        JSONObject obj= jsonObject.fromObject(statMap);
        return obj.toString();
    }

    public String getMaterialContractStat(String projectId) throws Exception {
        Map<String, Object> params = new HashMap();
        params.put("projectId", projectId);

        Map<String, Object> statMap = new HashMap();

        int contractAmountTotal = projectStatInfoMapper.getContractAmountTotalOfMaterialContract(params);

        int payAmountTotal = projectStatInfoMapper.getPayAmountTotalOfMaterialContract(params);

        statMap.put("payAmountTotal",payAmountTotal);
        statMap.put("noPayAmountTotal",contractAmountTotal-payAmountTotal);

        List<Map<String, Object>> statList = projectStatInfoMapper.getMaterialContractStat(params);
        if (statList == null) {
            statList = new ArrayList<Map<String, Object>>();
        }
        statMap.put("materialContractStat",statList);

        JSONObject jsonObject = new JSONObject();
        JSONObject obj= jsonObject.fromObject(statMap);
        return obj.toString();
    }

}
