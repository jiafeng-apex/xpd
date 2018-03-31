package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 工程收费
 *
 * @author Sunjf
 *         <p/>
 *         2015-12-30 下午9:17:42
 */
public class ProjectToll implements Serializable {
    private static final long serialVersionUID = 1L;

    private String projectTollId;               // 编号
    private String projectId;                   // 项目
    private String projectRateId;               // 工程费率
    private String externalGeldId;              // 外部Id （ 材料支付款Id / 劳务费支付款Id）

    private String projectTollDate;             // 日期
    private String automaticCalculation;        // 自动计算（功能）
    private String summary;                     // 摘要
    private String importAmount;                // 汇入金额
    private String exportAmount;                // 汇出金额
    private String materialGeld;                // 材料款
    private String labourServiceFee;            // 劳务费
    private String manageCost;                  // 扣管理费
    private String warrantyAmount;              // 扣质保金
    private String backWarrantyAmount;          // 已退质保金
    private String otherAmount;                 // 扣其他款
    private String vatSalesTax;                 // 增值税销项税
    private String vatIncomeTax;                // 增值税进项税
    private String cityBuildTax;                // 城市维护建设税
    private String educationSurcharge;          // 教育费附加
    private String localEducationAttached;      // 地方教育附加
    private String stampDuty;                   // 扣印花税
    private String individualIncomeTax;         // 扣个人所得税
    private String corporateIncomeTax;          // 扣企业所得税
    private String waterBuildIncome;            // 水利建设专项收入
    private String otherTax;                    // 其他税
    private String supplementaryBusinessTax;    // 扣营业税及附加税
    private String interest;                    // 扣利息
    private String companyFunds;                // 汇回公司款
    private String localBankDeposit;            // 当地银行存款(累计存款)
    private String localBankDepositBak;         // 当地银行存款(本条工程收费的存款)
    private String balance;                     // 余额(累计余额)
    private String balanceBak;                  // 余额(本条工程收费的余额)
    private String remark;                      // 备注

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    public String getProjectTollId() {
        return projectTollId;
    }

    public void setProjectTollId(String projectTollId) {
        this.projectTollId = projectTollId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectRateId() {
        return projectRateId;
    }

    public void setProjectRateId(String projectRateId) {
        this.projectRateId = projectRateId;
    }

    public String getProjectTollDate() {
        return projectTollDate;
    }

    public void setProjectTollDate(String projectTollDate) {
        this.projectTollDate = projectTollDate;
    }

    public String getAutomaticCalculation() {
        return automaticCalculation;
    }

    public void setAutomaticCalculation(String automaticCalculation) {
        this.automaticCalculation = automaticCalculation;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getImportAmount() {
        return importAmount;
    }

    public void setImportAmount(String importAmount) {
        this.importAmount = importAmount;
    }

    public String getExportAmount() {
        return exportAmount;
    }

    public void setExportAmount(String exportAmount) {
        this.exportAmount = exportAmount;
    }

    public String getMaterialGeld() {
        return materialGeld;
    }

    public void setMaterialGeld(String materialGeld) {
        this.materialGeld = materialGeld;
    }

    public String getLabourServiceFee() {
        return labourServiceFee;
    }

    public void setLabourServiceFee(String labourServiceFee) {
        this.labourServiceFee = labourServiceFee;
    }

    public String getManageCost() {
        return manageCost;
    }

    public void setManageCost(String manageCost) {
        this.manageCost = manageCost;
    }

    public String getWarrantyAmount() {
        return warrantyAmount;
    }

    public void setWarrantyAmount(String warrantyAmount) {
        this.warrantyAmount = warrantyAmount;
    }

    public String getBackWarrantyAmount() {
        return backWarrantyAmount;
    }

    public void setBackWarrantyAmount(String backWarrantyAmount) {
        this.backWarrantyAmount = backWarrantyAmount;
    }

    public String getOtherAmount() {
        return otherAmount;
    }

    public void setOtherAmount(String otherAmount) {
        this.otherAmount = otherAmount;
    }

    public String getVatSalesTax() {
        return vatSalesTax;
    }

    public void setVatSalesTax(String vatSalesTax) {
        this.vatSalesTax = vatSalesTax;
    }

    public String getVatIncomeTax() {
        return vatIncomeTax;
    }

    public void setVatIncomeTax(String vatIncomeTax) {
        this.vatIncomeTax = vatIncomeTax;
    }

    public String getCityBuildTax() {
        return cityBuildTax;
    }

    public void setCityBuildTax(String cityBuildTax) {
        this.cityBuildTax = cityBuildTax;
    }

    public String getEducationSurcharge() {
        return educationSurcharge;
    }

    public void setEducationSurcharge(String educationSurcharge) {
        this.educationSurcharge = educationSurcharge;
    }

    public String getLocalEducationAttached() {
        return localEducationAttached;
    }

    public void setLocalEducationAttached(String localEducationAttached) {
        this.localEducationAttached = localEducationAttached;
    }

    public String getStampDuty() {
        return stampDuty;
    }

    public void setStampDuty(String stampDuty) {
        this.stampDuty = stampDuty;
    }

    public String getIndividualIncomeTax() {
        return individualIncomeTax;
    }

    public void setIndividualIncomeTax(String individualIncomeTax) {
        this.individualIncomeTax = individualIncomeTax;
    }

    public String getCorporateIncomeTax() {
        return corporateIncomeTax;
    }

    public void setCorporateIncomeTax(String corporateIncomeTax) {
        this.corporateIncomeTax = corporateIncomeTax;
    }

    public String getWaterBuildIncome() {
        return waterBuildIncome;
    }

    public void setWaterBuildIncome(String waterBuildIncome) {
        this.waterBuildIncome = waterBuildIncome;
    }

    public String getOtherTax() {
        return otherTax;
    }

    public void setOtherTax(String otherTax) {
        this.otherTax = otherTax;
    }

    public String getSupplementaryBusinessTax() {
        return supplementaryBusinessTax;
    }

    public void setSupplementaryBusinessTax(String supplementaryBusinessTax) {
        this.supplementaryBusinessTax = supplementaryBusinessTax;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getCompanyFunds() {
        return companyFunds;
    }

    public void setCompanyFunds(String companyFunds) {
        this.companyFunds = companyFunds;
    }

    public String getLocalBankDeposit() {
        return localBankDeposit;
    }

    public void setLocalBankDeposit(String localBankDeposit) {
        this.localBankDeposit = localBankDeposit;
    }

    public String getLocalBankDepositBak() {
        return localBankDepositBak;
    }

    public void setLocalBankDepositBak(String localBankDepositBak) {
        this.localBankDepositBak = localBankDepositBak;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getExternalGeldId() {
        return externalGeldId;
    }

    public void setExternalGeldId(String externalGeldId) {
        this.externalGeldId = externalGeldId;
    }

    public String getBalanceBak() {
        return balanceBak;
    }

    public void setBalanceBak(String balanceBak) {
        this.balanceBak = balanceBak;
    }
}
