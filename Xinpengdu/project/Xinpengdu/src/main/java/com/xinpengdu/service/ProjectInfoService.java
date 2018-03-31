package com.xinpengdu.service;

import com.xinpengdu.common.tool.BigDecimalUtil;
import com.xinpengdu.common.tool.DataUtil;
import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.*;
import com.xinpengdu.persistence.ProjectInfoMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * 项目信息服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ProjectInfoService {

    // 项目信息
    @Autowired
    private ProjectInfoMapper projectInfoMapper;
    // 项目经理
    @Autowired
    private ProjectManagerService projectManagerService;
    // 工程费率
    @Autowired
    private ProjectRateService projectRateService;
    // 工程收费
    @Autowired
    private ProjectTollService projectTollService;
    // 授权人
    @Autowired
    private CertigierService certigierService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = projectInfoMapper.count(params);
        List<Map<String, Object>> projectInfoList = projectInfoMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, projectInfoList);
        return resultObj.toString();
    }

    public String getProjectInfoById(String projectId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("projectId", projectId);
        Map<String, Object> projectInfo = getProjectInfo(params);
        if (projectInfo != null) {
            JSONObject projectInfoObj = Tool.getSuccessReturnJSONObject();
            for (Map.Entry<String, Object> entry : projectInfo.entrySet()) {
                projectInfoObj.put(entry.getKey(), entry.getValue());
            }
            // 获得项目经理
            if (null != projectInfo.get("pmId")) {
                ProjectManager projectManager = projectManagerService.get(projectInfo.get("pmId").toString());
                projectInfoObj.put("pmName", projectManager.getPmName());
            }
            // 获得工程费率
            List<ProjectRate> projectRateList = projectRateService.query(projectId);
            if (null != projectRateList && projectRateList.size() > 0) {
                JSONObject projectRateObj = new JSONObject();
                Map<String, Object> projectRateMap = Tool.transBean2Map(projectRateList.get(0));
                for (Map.Entry<String, Object> entry : projectRateMap.entrySet()) {
                    projectRateObj.put(entry.getKey(), entry.getValue());
                }
                projectInfoObj.put("projectRate", projectRateObj);
            }
            // 获取授权人
            List<Certigier> certigierList = certigierService.query(projectId);
            if (certigierList != null && certigierList.size() > 0) {
                Certigier certigier = certigierList.get(0);
                projectInfoObj.put("certigierName", certigier.getCertigierName());
                projectInfoObj.put("accreditEnd", certigier.getAccreditEnd());
            }
            return projectInfoObj.toString();
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    public Map<String, Object> getProjectInfo(Map<String, Object> params) {
        return projectInfoMapper.getProjectInfo(params);
    }

    public ProjectInfo get(String id) {
        return projectInfoMapper.get(id);
    }

    public ProjectInfo getNewProjectInfo() {
        ProjectInfo projectInfo = new ProjectInfo();
        // 获取最新一条项目工程的Id
        String projectId = projectInfoMapper.getLatestProjectId();
        if (null != projectId) {
            List<ProjectRate> projectRateList = projectRateService.query(projectId);
            if (null != projectRateList && projectRateList.size() > 0) {
                ProjectRate projectRate = projectRateList.get(0);
                // 把项目工程Id清空
                projectRate.setProjectId(null);
                projectRate.setProjectTollId(null);
//                projectInfo.setProjectRate(projectRate);
            }
        }
        return projectInfo;
    }

    public List<ProjectInfo> getList(Map<String, Object> params) {
        return projectInfoMapper.getList(params);
    }

    public String save(String data) throws Exception {
        ProjectInfo projectInfo = (ProjectInfo) JSONObject.toBean(JSONObject.fromObject(data), ProjectInfo.class);
        String projectId = UUID.randomUUID().toString();
        String createDate = DateUtil.dateTime2String(new Date());
        projectInfo.setCreateDate(createDate);
        projectInfo.setLastUpdateDate(createDate);
        projectInfo.setProjectId(projectId);
        ProjectManager projectManager = null;
        // 判断项目经理是否存在，不存在就添加
        if (null != projectInfo.getPmName() && !projectInfo.getPmName().equals("") && null != projectInfo.getPmId() && !projectInfo.getPmId().equals("")) {
            Map<String, Object> pmParams = new HashMap<String, Object>();
            pmParams.put("pmName", projectInfo.getPmName());
            pmParams.put("pmPhone", projectInfo.getTellPhone());
            projectManager = projectManagerService.getProjectManagerEditInfo(pmParams);
        }
        if (null == projectInfo.getPmId() || projectInfo.getPmId().equals("") || null == projectManager) {
            // 如果项目经理不存在，就保存用户输入的
            projectManager = new ProjectManager();
            projectManager.setPmId(UUID.randomUUID().toString());
            projectManager.setPmName(projectInfo.getPmName());
            projectManager.setPmPhone(projectInfo.getTellPhone());
            projectManagerService.save(projectManager);
        }
        // 如果项目经理Id为空，并且保存后的项目经理不为空，就把项目经理Id设置到项目信息中去
        if (null != projectManager) {
            projectInfo.setPmId(projectManager.getPmId());
        }
        // 保存项目信息
        projectInfoMapper.save(projectInfo);

        // 保存费率
        String projectRateStr = projectInfo.getProjectRate();
        if (projectRateStr != "" && !projectRateStr.equals("")) {
            ProjectRate projectRate = (ProjectRate) JSONObject.toBean(JSONObject.fromObject(projectRateStr), ProjectRate.class);
            projectRate.setProjectId(projectId);
            projectRateService.save(projectRate);
        }
        return projectId;
    }

    public void update(String data) {
        ProjectInfo projectInfo = (ProjectInfo) JSONObject.toBean(JSONObject.fromObject(data), ProjectInfo.class);
        projectInfo.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        projectInfoMapper.update(projectInfo);
        // 如果没有修改工程费率就需要进行保存工程费率
        if(projectInfo.getIsSaveProjectRate().equals("true")){
            return;
        }
        // 更新项目工程费率
        String projectRateStr = projectInfo.getProjectRate();
        if (projectRateStr != "" && !projectRateStr.equals("")) {
            ProjectRate projectRate = (ProjectRate) JSONObject.toBean(JSONObject.fromObject(projectRateStr), ProjectRate.class);
            // 更新工程费率
            projectRateService.update(projectRate);
            String projectId = projectInfo.getProjectId();
            // 更新与该费率相关的工程收费信息
            // 先查询出所有与该费率相关的工程收费信息
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("projectId", projectId);
            List<ProjectToll> projectTollList = projectTollService.getProjectTollList(params);
            Collections.reverse(projectTollList); // 倒序排列
            for (ProjectToll pt : projectTollList) {
                double balanceBak = 0;  // 本条工程收费的余额
                double localBankDepositBak = 0; // 本条工程收费的本地银行存款
                // 如果是自动计算
                if(pt.getAutomaticCalculation().equals("1")){
                    // 增值税销项税，管理费，质保金，企业所得税，个人所得税，印花税，营业税及附加 这7个是按照汇入金额
                    // 城市维建税，地方教育附加，教育费附加，水利建设收入，其他税率 这5个是按照增值税销项税为基数
                    String importAmountStr = pt.getImportAmount();
                    double importAmount = BigDecimalUtil.formatStrToDou(importAmountStr);                                                   // 汇入金额
                    double exportAmount = BigDecimalUtil.formatStrToDou(pt.getExportAmount());                                              // 汇出金额
                    double materialGeld = BigDecimalUtil.formatStrToDou(pt.getMaterialGeld());                                              // 材料费
                    double labourServiceFee = BigDecimalUtil.formatStrToDou(pt.getLabourServiceFee());                                      // 劳务费
                    double companyFunds = BigDecimalUtil.formatStrToDou(pt.getCompanyFunds());                                              // 汇回公司款

                    double vatSalesTax = DataUtil.rateCalc(importAmountStr, projectRate.getVatSalesTax());                                  // 增值税销项税
                    double manageCost = DataUtil.rateCalc(importAmountStr, projectRate.getManageRate());                                    // 管理费
                    double warrantyAmount = DataUtil.rateCalc(importAmountStr, projectRate.getWarrantyRate());                              // 质保金
                    double corporateIncomeTax = DataUtil.rateCalc(importAmountStr, projectRate.getCorporateIncomeTax());                    // 企业所得税
                    double individualIncomeTax = DataUtil.rateCalc(importAmountStr, projectRate.getIndividualIncomeTax());                  // 个人所得税
                    double stampDuty = DataUtil.rateCalc(importAmountStr, projectRate.getStampDutyRate());                                  // 印花税
                    double supplementaryBusinessTax = DataUtil.rateCalc(importAmountStr, projectRate.getSupplementaryBusinessTax());        // 营业税及附加税

                    double cityBuildTax = DataUtil.rateCalc(String.valueOf(vatSalesTax), projectRate.getCityBuildTax());                        // 城市维护建设税
                    double localEducationAttached = DataUtil.rateCalc(String.valueOf(vatSalesTax), projectRate.getLocalEducationAttached());    // 地方教育附加
                    double educationSurcharge = DataUtil.rateCalc(String.valueOf(vatSalesTax), projectRate.getEducationSurcharge());            // 教育费附加
                        double waterBuildIncome = DataUtil.rateCalc(String.valueOf(vatSalesTax), projectRate.getWaterBuildIncome());            // 水利建设专项收入
                    double otherTax = DataUtil.rateCalc(String.valueOf(vatSalesTax), projectRate.getOtherTaxRate());                            // 其他税

                    double interest = BigDecimalUtil.formatStrToDou(pt.getInterest());                                                      // 利息
                    double otherAmount = BigDecimalUtil.formatStrToDou(pt.getOtherAmount());                                                // 其他款
                    double vatIncomeTax = BigDecimalUtil.formatStrToDou(pt.getVatIncomeTax());                                              // 增值税进项税
                    double backWarrantyAmount = BigDecimalUtil.formatStrToDou(pt.getBackWarrantyAmount());                                  // 已退质保金

                    // 本行余额= 汇入金额 - 汇出金额 - (材料费+劳务费+扣质保金+扣管理费+ 扣营业税及附加税 + 扣个人所得税+ 扣企业所得税 + 扣印花税+ 扣利息+扣其他款+增值税销项税-增值税进项税
                    // +城市维护建设税+教育费附加+地方教育附加+水利建设专项收入+其他税)+ 已退质保金
                    balanceBak = importAmount - exportAmount - materialGeld - labourServiceFee - warrantyAmount - manageCost - supplementaryBusinessTax -
                            individualIncomeTax - corporateIncomeTax - stampDuty - interest - otherAmount - vatSalesTax + vatIncomeTax - cityBuildTax -
                            educationSurcharge - localEducationAttached - waterBuildIncome - otherTax + backWarrantyAmount;
                    // 当地银行存款=汇入前当地银行存款+汇入金额-汇出金额-汇回公司款
                    localBankDepositBak = importAmount - exportAmount - companyFunds;

                    // 更新projectToll中的税值
                    pt.setManageCost(DataUtil.insertComma(manageCost + "", 2));                                 // 质保金
                    pt.setWarrantyAmount(DataUtil.insertComma(warrantyAmount + "", 2));                         // 管理费
                    pt.setSupplementaryBusinessTax(DataUtil.insertComma(supplementaryBusinessTax + "", 2));     // 营业税及附加税
                    pt.setIndividualIncomeTax(DataUtil.insertComma(individualIncomeTax + "", 2));               // 个人所得税
                    pt.setCorporateIncomeTax(DataUtil.insertComma(corporateIncomeTax + "", 2));                 // 企业所得税
                    pt.setStampDuty(DataUtil.insertComma(stampDuty + "", 2));                                   // 印花税
                    pt.setInterest(DataUtil.insertComma(interest + "", 2));                                     // 利息
                    pt.setVatSalesTax(DataUtil.insertComma(vatSalesTax + "", 2));                               // 增值税销项税
                    pt.setCityBuildTax(DataUtil.insertComma(cityBuildTax + "", 2));                             // 城市维护建设税
                    pt.setEducationSurcharge(DataUtil.insertComma(educationSurcharge + "", 2));                 // 教育费附加
                    pt.setLocalEducationAttached(DataUtil.insertComma(localEducationAttached + "", 2));         // 地方教育附加
                    pt.setWaterBuildIncome(DataUtil.insertComma(waterBuildIncome + "", 2));                     // 水利建设专项收入
                    pt.setOtherTax(DataUtil.insertComma(otherTax + "", 2));                                     // 其他税
                    pt.setBackWarrantyAmount(DataUtil.insertComma(backWarrantyAmount + "", 2));                 // 已退质保金
                    pt.setOtherAmount(DataUtil.insertComma(otherAmount + "", 2));                               // 其他款
                    pt.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));                                 // 本次工程收费的金额
                } else {
                    balanceBak = BigDecimalUtil.formatStrToDou(pt.getBalanceBak());
                    localBankDepositBak = BigDecimalUtil.formatStrToDou(pt.getLocalBankDepositBak());
                }

                String balanceStr = "0", localBankDepositStr = "0";
                // 计算余额 -- start
                Map<String, Object> queryParams = new HashMap<>();
                queryParams.put("projectId", projectId);
                queryParams.put("projectTollDate", pt.getProjectTollDate());
                queryParams.put("balance", balanceBak);
                queryParams.put("localBankDeposit", localBankDepositBak);
                queryParams.put("createDate", pt.getCreateDate());
                ProjectToll projectToll4Latest = projectTollService.getProjectTollByTime(queryParams);
                if (projectToll4Latest != null) {
                    balanceStr = projectToll4Latest.getBalance();
                    localBankDepositStr = projectToll4Latest.getLocalBankDeposit();
                }
                projectTollService.updateTollBalance(queryParams);

                double balanceBak_D = new BigDecimal(DataUtil.delComma(pt.getBalanceBak())).doubleValue();
                double balance_D = new BigDecimal(DataUtil.delComma(balanceStr)).doubleValue();
                double balance = balanceBak_D + balance_D;
                pt.setBalance(DataUtil.insertComma(balance + "", 2));
                // 计算余额 -- end

                // 计算本地银行汇款 -- start
                double localBankDepositBak_D = new BigDecimal(DataUtil.delComma(pt.getLocalBankDepositBak())).doubleValue();
                double localBankDeposit_D = new BigDecimal(DataUtil.delComma(localBankDepositStr)).doubleValue();
                double localBankDeposit = localBankDepositBak_D + localBankDeposit_D;
                pt.setLocalBankDeposit(DataUtil.insertComma(localBankDeposit + "", 2));
                // 计算本地银行汇款 -- end

                pt.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
                pt.setProjectId(projectId);
                pt.setProjectTollId(pt.getProjectTollId());
                projectTollService.update(pt);
            }
        }
    }

    public void deleteById(String id) {
        projectInfoMapper.deleteById(id);
    }

    public int getProjectCountByPmId(String pmIds) {
        List<String> list = new ArrayList<String>();
        String[] ids = pmIds.split(",");
        for (String id : ids) {
            list.add(id);
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("list", list);
        int count = projectInfoMapper.getProjectCountByPmId(params);
        return count;
    }

    //根据发票同步日期 查询项目
    public List<ProjectInfo> getListByInvoiceSyncDate(int invoiceSyncDate) {
        Map<String, Object> params = new HashMap<>();
        params.put("invoiceSyncDate", invoiceSyncDate);
        return projectInfoMapper.getListByInvoiceSyncDate(params);
    }
}
