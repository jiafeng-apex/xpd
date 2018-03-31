package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 工程费率
 *
 * @author Sunjf
 *         <p/>
 *         2015-12-30 下午9:16:27
 */
public class ProjectRate implements Serializable {
    private static final long serialVersionUID = 1L;

    private String projectRateId;               // 编号
    private String projectId;                   // 项目编号
    private String projectTollId;               // 工程收费编号

    private String manageRate;                  // 管理费率
    private String warrantyRate;                // 质保金率
    private String supplementaryBusinessTax;    // 营业税及附加
    private String corporateIncomeTax;          // 企业所得税
    private String individualIncomeTax;         // 个人所得税
    private String stampDutyRate;               // 印花税税率
    private String otherTaxRate;                // 其他税率

    private String vatSalesTax;                 // 增值税销项税
    private String cityBuildTax;                // 城市维护建设税
    private String localEducationAttached;      // 地方教育附加
    private String educationSurcharge;          // 教育费附加
    private String waterBuildIncome;            // 水利建设专项收入

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间


    public String getProjectRateId() {
        return projectRateId;
    }

    public void setProjectRateId(String projectRateId) {
        this.projectRateId = projectRateId;
    }

    public String getManageRate() {
        return manageRate;
    }

    public void setManageRate(String manageRate) {
        this.manageRate = manageRate;
    }

    public String getWarrantyRate() {
        return warrantyRate;
    }

    public void setWarrantyRate(String warrantyRate) {
        this.warrantyRate = warrantyRate;
    }

    public String getSupplementaryBusinessTax() {
        return supplementaryBusinessTax;
    }

    public void setSupplementaryBusinessTax(String supplementaryBusinessTax) {
        this.supplementaryBusinessTax = supplementaryBusinessTax;
    }

    public String getCorporateIncomeTax() {
        return corporateIncomeTax;
    }

    public void setCorporateIncomeTax(String corporateIncomeTax) {
        this.corporateIncomeTax = corporateIncomeTax;
    }

    public String getIndividualIncomeTax() {
        return individualIncomeTax;
    }

    public void setIndividualIncomeTax(String individualIncomeTax) {
        this.individualIncomeTax = individualIncomeTax;
    }

    public String getStampDutyRate() {
        return stampDutyRate;
    }

    public void setStampDutyRate(String stampDutyRate) {
        this.stampDutyRate = stampDutyRate;
    }

    public String getOtherTaxRate() {
        return otherTaxRate;
    }

    public void setOtherTaxRate(String otherTaxRate) {
        this.otherTaxRate = otherTaxRate;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectTollId() {
        return projectTollId;
    }

    public void setProjectTollId(String projectTollId) {
        this.projectTollId = projectTollId;
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

    public String getVatSalesTax() {
        return vatSalesTax;
    }

    public void setVatSalesTax(String vatSalesTax) {
        this.vatSalesTax = vatSalesTax;
    }

    public String getCityBuildTax() {
        return cityBuildTax;
    }

    public void setCityBuildTax(String cityBuildTax) {
        this.cityBuildTax = cityBuildTax;
    }

    public String getLocalEducationAttached() {
        return localEducationAttached;
    }

    public void setLocalEducationAttached(String localEducationAttached) {
        this.localEducationAttached = localEducationAttached;
    }

    public String getEducationSurcharge() {
        return educationSurcharge;
    }

    public void setEducationSurcharge(String educationSurcharge) {
        this.educationSurcharge = educationSurcharge;
    }

    public String getWaterBuildIncome() {
        return waterBuildIncome;
    }

    public void setWaterBuildIncome(String waterBuildIncome) {
        this.waterBuildIncome = waterBuildIncome;
    }

}
