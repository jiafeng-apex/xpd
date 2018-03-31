package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 劳务发票
 * Created by jiafeng on 17/7/14.
 */
public class LabourServiceInvoice implements Serializable {
    private static final long serialVersionUID = 1L;

    private String labourServiceInvoiceId;          // 劳务发票主键Id
    private String projectId;                       // 项目Id
    private String labourServiceFeeId;              // 劳务费Id

    private String invoiceNumber;                   // 发票号
    private String registrationDate;                // 登记日期
    private String summary;                         // 摘要
    private String invoiceDate;                     // 发票填开日期
    private String amount;                          // 金额
    private String taxRates;                        // 税率
    private String taxAmount;                       // 税额
    private String taxPriceAmount;                  // 税价合计
    private String goodsName;                       // 货物名称
    private String invoiceType;                     // 发票类型，（普通发票|专用发票）
    private String remark;                          // 备注
    private String externalInvoiceId;               //关联发票id 发票转入使用
    private String createDate;                      // 创建时间
    private String lastUpdateDate;                  // 最后更新时间

    public String getLabourServiceInvoiceId() {
        return labourServiceInvoiceId;
    }

    public void setLabourServiceInvoiceId(String labourServiceInvoiceId) {
        this.labourServiceInvoiceId = labourServiceInvoiceId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getLabourServiceFeeId() {
        return labourServiceFeeId;
    }

    public void setLabourServiceFeeId(String labourServiceFeeId) {
        this.labourServiceFeeId = labourServiceFeeId;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTaxRates() {
        return taxRates;
    }

    public void setTaxRates(String taxRates) {
        this.taxRates = taxRates;
    }

    public String getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(String taxAmount) {
        this.taxAmount = taxAmount;
    }

    public String getTaxPriceAmount() {
        return taxPriceAmount;
    }

    public void setTaxPriceAmount(String taxPriceAmount) {
        this.taxPriceAmount = taxPriceAmount;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
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

    public String getExternalInvoiceId() {
        return externalInvoiceId;
    }

    public void setExternalInvoiceId(String externalInvoiceId) {
        this.externalInvoiceId = externalInvoiceId;
    }
}
