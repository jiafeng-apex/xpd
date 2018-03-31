package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 项目合计信息
 *
 * @author Sunjf
 *         <p/>
 *         2016-3-3 下午8:30:07
 */
public class ProjectStatInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    private String pmTotalAmount; // 项目经理总余额
    private String manageRateStat; // 管理费率
    private String warrantyRateStat; // 质保金率
    private String supplementaryBusinessTaxStat; // 营业税及附加
    private String corporateIncomeTaxStat; // 企业所得税
    private String individualIncomeTaxStat; // 个人所得税
    private String stampDutyRateStat; // 印花税税率
    private String otherTaxRateStat; // 其他税率
    private String importAmountStat; // 本项目汇入金额
    private String exportAmountStat; // 本项目汇出金额
    private String backWarrantyAmountStat; // 已退质保金
    private String interestStat; // 本项目总利息
    private String invoiceAmountStat; // 发票税额总金额
    private String taxStat; // 发票税额总金额
    private String receiptAmountStat; // 收据总金额
    private String localBankDepositStat; // 本地银行存款总金额
    private String companyFundsStat; // 汇回公司总金额
    private String projectTotalBalance; // 本项目余额

    private String vatSalesTaxStat;//增值税销项税
    private String educationSurchargeStat;//教育费附加
    private String localEducationAttachedStat;//地方教育费附加
    private String vatIncomeTaxStat;//增值税进项税
    private String materialGeldStat;//材料款
    private String cityBuildTaxStat;//城建税
    private String labourServiceFeeStat;//劳务费


    public String getPmTotalAmount() {
        return pmTotalAmount;
    }

    public void setPmTotalAmount(String pmTotalAmount) {
        this.pmTotalAmount = pmTotalAmount;
    }

    public String getManageRateStat() {
        return manageRateStat;
    }

    public void setManageRateStat(String manageRateStat) {
        this.manageRateStat = manageRateStat;
    }

    public String getWarrantyRateStat() {
        return warrantyRateStat;
    }

    public void setWarrantyRateStat(String warrantyRateStat) {
        this.warrantyRateStat = warrantyRateStat;
    }

    public String getSupplementaryBusinessTaxStat() {
        return supplementaryBusinessTaxStat;
    }

    public void setSupplementaryBusinessTaxStat(String supplementaryBusinessTaxStat) {
        this.supplementaryBusinessTaxStat = supplementaryBusinessTaxStat;
    }

    public String getCorporateIncomeTaxStat() {
        return corporateIncomeTaxStat;
    }

    public void setCorporateIncomeTaxStat(String corporateIncomeTaxStat) {
        this.corporateIncomeTaxStat = corporateIncomeTaxStat;
    }

    public String getIndividualIncomeTaxStat() {
        return individualIncomeTaxStat;
    }

    public void setIndividualIncomeTaxStat(String individualIncomeTaxStat) {
        this.individualIncomeTaxStat = individualIncomeTaxStat;
    }

    public String getStampDutyRateStat() {
        return stampDutyRateStat;
    }

    public void setStampDutyRateStat(String stampDutyRateStat) {
        this.stampDutyRateStat = stampDutyRateStat;
    }

    public String getOtherTaxRateStat() {
        return otherTaxRateStat;
    }

    public void setOtherTaxRateStat(String otherTaxRateStat) {
        this.otherTaxRateStat = otherTaxRateStat;
    }

    public String getProjectTotalBalance() {
        return projectTotalBalance;
    }

    public void setProjectTotalBalance(String projectTotalBalance) {
        this.projectTotalBalance = projectTotalBalance;
    }

    public String getImportAmountStat() {
        return importAmountStat;
    }

    public void setImportAmountStat(String importAmountStat) {
        this.importAmountStat = importAmountStat;
    }

    public String getExportAmountStat() {
        return exportAmountStat;
    }

    public void setExportAmountStat(String exportAmountStat) {
        this.exportAmountStat = exportAmountStat;
    }

    public String getBackWarrantyAmountStat() {
        return backWarrantyAmountStat;
    }

    public void setBackWarrantyAmountStat(String backWarrantyAmountStat) {
        this.backWarrantyAmountStat = backWarrantyAmountStat;
    }

    public String getInterestStat() {
        return interestStat;
    }

    public void setInterestStat(String interestStat) {
        this.interestStat = interestStat;
    }

    public String getInvoiceAmountStat() {
        return invoiceAmountStat;
    }

    public void setInvoiceAmountStat(String invoiceAmountStat) {
        this.invoiceAmountStat = invoiceAmountStat;
    }

    public String getReceiptAmountStat() {
        return receiptAmountStat;
    }

    public void setReceiptAmountStat(String receiptAmountStat) {
        this.receiptAmountStat = receiptAmountStat;
    }

    public String getLocalBankDepositStat() {
        return localBankDepositStat;
    }

    public void setLocalBankDepositStat(String localBankDepositStat) {
        this.localBankDepositStat = localBankDepositStat;
    }

    public String getCompanyFundsStat() {
        return companyFundsStat;
    }

    public void setCompanyFundsStat(String companyFundsStat) {
        this.companyFundsStat = companyFundsStat;
    }

    public String getTaxStat() {
        return taxStat;
    }

    public void setTaxStat(String taxStat) {
        this.taxStat = taxStat;
    }

    public String getVatSalesTaxStat() {
        return vatSalesTaxStat;
    }

    public void setVatSalesTaxStat(String vatSalesTaxStat) {
        this.vatSalesTaxStat = vatSalesTaxStat;
    }

    public String getEducationSurchargeStat() {
        return educationSurchargeStat;
    }

    public void setEducationSurchargeStat(String educationSurchargeStat) {
        this.educationSurchargeStat = educationSurchargeStat;
    }

    public String getLocalEducationAttachedStat() {
        return localEducationAttachedStat;
    }

    public void setLocalEducationAttachedStat(String localEducationAttachedStat) {
        this.localEducationAttachedStat = localEducationAttachedStat;
    }

    public String getVatIncomeTaxStat() {
        return vatIncomeTaxStat;
    }

    public void setVatIncomeTaxStat(String vatIncomeTaxStat) {
        this.vatIncomeTaxStat = vatIncomeTaxStat;
    }

    public String getMaterialGeldStat() {
        return materialGeldStat;
    }

    public void setMaterialGeldStat(String materialGeldStat) {
        this.materialGeldStat = materialGeldStat;
    }

    public String getCityBuildTaxStat() {
        return cityBuildTaxStat;
    }

    public void setCityBuildTaxStat(String cityBuildTaxStat) {
        this.cityBuildTaxStat = cityBuildTaxStat;
    }

    public String getLabourServiceFeeStat() {
        return labourServiceFeeStat;
    }

    public void setLabourServiceFeeStat(String labourServiceFeeStat) {
        this.labourServiceFeeStat = labourServiceFeeStat;
    }
}
