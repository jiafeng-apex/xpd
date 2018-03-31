package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 发票税单
 *
 * @author jiafeng
 * @create 2017-08-25 16:43
 **/
public class InvoiceTaxBill implements Serializable {
    private static final long serialVersionUID = 1L;

    private String invoiceTaxBillId;            // 发票税单编号
    private String invoiceId;                   // 发票编号
    private String projectId;                   // 项目编号

    private String tollageType;                 // 交税类型，1为税单，2为深圳交税，3为本地交税
    private String addedValueTax;               // 增值税
    private String addedValueTaxValue;          // 增值税-值
    private String constructionTax;             // 城建税
    private String constructionTaxValue;        // 城建税-值
    private String areaEducationalSurtax;       // 地方教育附加费
    private String areaEducationalSurtaxValue;  // 地方教育附加费-值
    private String educationalSurtax;           // 教育费附加
    private String educationalSurtaxValue;      // 教育费附加-值
    private String individualIncomeTax;         // 个人所得税
    private String individualIncomeTaxValue;    // 个人所得税-值
    private String corporateIncomeTax;          // 企业所得税
    private String corporateIncomeTaxValue;     // 企业所得税-值
    private String otherTax;                    // 其他税
    private String otherTaxValue;               // 其他税-值
    private String stampDuty;                   // 印花税
    private String stampDutyValue;              // 印花税-值
    private String waterBuildTax;               // 水利建设税
    private String waterBuildTaxValue;          // 水利建设税-值
    private String taxPeriod;                   // 税款所属期
    private String taxBillTotal;                // 税单合计
    private String szSubtotal;                  // 深圳小计
    private String localSubtotal;               // 当地小计
    private String nationalTaxBillNo;           // 国税税单号
    private String landTaxNo;                   // 地税税单号
    private String remark;                      // 备注

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    public String getInvoiceTaxBillId() {
        return invoiceTaxBillId;
    }

    public void setInvoiceTaxBillId(String invoiceTaxBillId) {
        this.invoiceTaxBillId = invoiceTaxBillId;
    }

    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getAddedValueTax() {
        return addedValueTax;
    }

    public void setAddedValueTax(String addedValueTax) {
        this.addedValueTax = addedValueTax;
    }

    public String getConstructionTax() {
        return constructionTax;
    }

    public void setConstructionTax(String constructionTax) {
        this.constructionTax = constructionTax;
    }

    public String getAreaEducationalSurtax() {
        return areaEducationalSurtax;
    }

    public void setAreaEducationalSurtax(String areaEducationalSurtax) {
        this.areaEducationalSurtax = areaEducationalSurtax;
    }

    public String getEducationalSurtax() {
        return educationalSurtax;
    }

    public void setEducationalSurtax(String educationalSurtax) {
        this.educationalSurtax = educationalSurtax;
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

    public String getOtherTax() {
        return otherTax;
    }

    public void setOtherTax(String otherTax) {
        this.otherTax = otherTax;
    }

    public String getStampDuty() {
        return stampDuty;
    }

    public void setStampDuty(String stampDuty) {
        this.stampDuty = stampDuty;
    }

    public String getTaxPeriod() {
        return taxPeriod;
    }

    public void setTaxPeriod(String taxPeriod) {
        this.taxPeriod = taxPeriod;
    }

    public String getWaterBuildTax() {
        return waterBuildTax;
    }

    public void setWaterBuildTax(String waterBuildTax) {
        this.waterBuildTax = waterBuildTax;
    }

    public String getTaxBillTotal() {
        return taxBillTotal;
    }

    public void setTaxBillTotal(String taxBillTotal) {
        this.taxBillTotal = taxBillTotal;
    }

    public String getSzSubtotal() {
        return szSubtotal;
    }

    public void setSzSubtotal(String szSubtotal) {
        this.szSubtotal = szSubtotal;
    }

    public String getNationalTaxBillNo() {
        return nationalTaxBillNo;
    }

    public void setNationalTaxBillNo(String nationalTaxBillNo) {
        this.nationalTaxBillNo = nationalTaxBillNo;
    }

    public String getLandTaxNo() {
        return landTaxNo;
    }

    public void setLandTaxNo(String landTaxNo) {
        this.landTaxNo = landTaxNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public String getTollageType() {
        return tollageType;
    }

    public void setTollageType(String tollageType) {
        this.tollageType = tollageType;
    }

    public String getLocalSubtotal() {
        return localSubtotal;
    }

    public void setLocalSubtotal(String localSubtotal) {
        this.localSubtotal = localSubtotal;
    }

    public String getAddedValueTaxValue() {
        return addedValueTaxValue;
    }

    public void setAddedValueTaxValue(String addedValueTaxValue) {
        this.addedValueTaxValue = addedValueTaxValue;
    }

    public String getConstructionTaxValue() {
        return constructionTaxValue;
    }

    public void setConstructionTaxValue(String constructionTaxValue) {
        this.constructionTaxValue = constructionTaxValue;
    }

    public String getAreaEducationalSurtaxValue() {
        return areaEducationalSurtaxValue;
    }

    public void setAreaEducationalSurtaxValue(String areaEducationalSurtaxValue) {
        this.areaEducationalSurtaxValue = areaEducationalSurtaxValue;
    }

    public String getEducationalSurtaxValue() {
        return educationalSurtaxValue;
    }

    public void setEducationalSurtaxValue(String educationalSurtaxValue) {
        this.educationalSurtaxValue = educationalSurtaxValue;
    }

    public String getIndividualIncomeTaxValue() {
        return individualIncomeTaxValue;
    }

    public void setIndividualIncomeTaxValue(String individualIncomeTaxValue) {
        this.individualIncomeTaxValue = individualIncomeTaxValue;
    }

    public String getCorporateIncomeTaxValue() {
        return corporateIncomeTaxValue;
    }

    public void setCorporateIncomeTaxValue(String corporateIncomeTaxValue) {
        this.corporateIncomeTaxValue = corporateIncomeTaxValue;
    }

    public String getOtherTaxValue() {
        return otherTaxValue;
    }

    public void setOtherTaxValue(String otherTaxValue) {
        this.otherTaxValue = otherTaxValue;
    }

    public String getStampDutyValue() {
        return stampDutyValue;
    }

    public void setStampDutyValue(String stampDutyValue) {
        this.stampDutyValue = stampDutyValue;
    }

    public String getWaterBuildTaxValue() {
        return waterBuildTaxValue;
    }

    public void setWaterBuildTaxValue(String waterBuildTaxValue) {
        this.waterBuildTaxValue = waterBuildTaxValue;
    }
}
