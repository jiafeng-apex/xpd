package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 工程基本信息
 *
 * @author Sunjf
 *         <p/>
 *         2015-12-30 下午9:14:43
 */
public class ProjectInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    private String projectId;                   // 编号
    private String projectRateId;               // 工程费率
    private String pmId;                        // 项目经理
    private String pmName;                      // 项目经理名称

    private String tellPhone;                   // 联系电话
    private String partyName;                   // 甲方名称
    private String projectName;                 // 项目名称
    private String isFinish;                    // 是否完工
    private String addValueTaxType;             // 增值税类型 （简易增收/一般计征）
    private String invoiceSyncDate;             // 发票同步时间
    private String isAddBankInfo;               // 是否添加银行
    private String signedDate;                  // 签订日期
    private String contractAcount;              // 合同金额
    private String clearingAcount;              // 结算金额
    private String projectType;                 // 工程类型
    private String projectTypeName;             // 工程类型名称
    private String projectAddr;                 // 工程地址
    private String remarkOne;                   // 备注1
    private String remarkTwo;                   // 备注2
    private String isSaveProjectRate;           // 页面是否有修改工程费率

    private String projectRate;                 // 工程费率数据

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    public String getAddValueTaxType() {
        return addValueTaxType;
    }

    public void setAddValueTaxType(String addValueTaxType) {
        this.addValueTaxType = addValueTaxType;
    }

    public String getInvoiceSyncDate() {
        return invoiceSyncDate;
    }

    public void setInvoiceSyncDate(String invoiceSyncDate) {
        this.invoiceSyncDate = invoiceSyncDate;
    }

    public String getIsAddBankInfo() {
        return isAddBankInfo;
    }

    public void setIsAddBankInfo(String isAddBankInfo) {
        this.isAddBankInfo = isAddBankInfo;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getPmId() {
        return pmId;
    }

    public void setPmId(String pmId) {
        this.pmId = pmId;
    }

    public String getTellPhone() {
        return tellPhone;
    }

    public void setTellPhone(String tellPhone) {
        this.tellPhone = tellPhone;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(String isFinish) {
        this.isFinish = isFinish;
    }

    public String getSignedDate() {
        return signedDate;
    }

    public void setSignedDate(String signedDate) {
        this.signedDate = signedDate;
    }

    public String getContractAcount() {
        return contractAcount;
    }

    public void setContractAcount(String contractAcount) {
        this.contractAcount = contractAcount;
    }

    public String getClearingAcount() {
        return clearingAcount;
    }

    public void setClearingAcount(String clearingAcount) {
        this.clearingAcount = clearingAcount;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    public String getProjectAddr() {
        return projectAddr;
    }

    public void setProjectAddr(String projectAddr) {
        this.projectAddr = projectAddr;
    }

    public String getProjectRateId() {
        return projectRateId;
    }

    public void setProjectRateId(String projectRateId) {
        this.projectRateId = projectRateId;
    }

    public String getRemarkOne() {
        return remarkOne;
    }

    public void setRemarkOne(String remarkOne) {
        this.remarkOne = remarkOne;
    }

    public String getRemarkTwo() {
        return remarkTwo;
    }

    public void setRemarkTwo(String remarkTwo) {
        this.remarkTwo = remarkTwo;
    }

    public String getProjectTypeName() {
        return projectTypeName;
    }

    public void setProjectTypeName(String projectTypeName) {
        this.projectTypeName = projectTypeName;
    }

    public String getPmName() {
        return pmName;
    }

    public void setPmName(String pmName) {
        this.pmName = pmName;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(String lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getProjectRate() {
        return projectRate;
    }

    public void setProjectRate(String projectRate) {
        this.projectRate = projectRate;
    }

    public String getIsSaveProjectRate() {
        return isSaveProjectRate;
    }

    public void setIsSaveProjectRate(String isSaveProjectRate) {
        this.isSaveProjectRate = isSaveProjectRate;
    }
}
