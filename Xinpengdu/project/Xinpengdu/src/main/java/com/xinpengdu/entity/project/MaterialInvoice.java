package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 材料发票
 * Created by jiafeng on 17/7/14.
 */
public class MaterialInvoice implements Serializable {
    private static final long serialVersionUID = 1L;

    private String materialInvoiceId;               // 材料发票主键
    private String projectId;                       // 项目Id
    private String materialContractId;              // 材料合同Id

    private String invoiceNumber;                   // 发票号
    private String registrationDate;                // 登记日期
    private String summary;                         // 摘要
    private String invoiceDate;                     // 发票填开日期
    private String amount;                          // 金额
    private String taxRate;                         // 税率
    private String taxAmount;                       // 税额
    private String taxPrice;                        // 税价合计
    private String goodsName;                       // 货物名称
    private String invoiceType;                     // 发票类型（普通发票|专用发票）
    private String remark;                          // 备注
    private String externalInvoiceId;               // 关联发票id 发票转入使用
    private String createDate;                      // 创建时间
    private String lastUpdateDate;                  // 最后更新时间

    public String getMaterialInvoiceId() {
        return materialInvoiceId;
    }

    public void setMaterialInvoiceId(String materialInvoiceId) {
        this.materialInvoiceId = materialInvoiceId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getMaterialContractId() {
        return materialContractId;
    }

    public void setMaterialContractId(String materialContractId) {
        this.materialContractId = materialContractId;
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

    public String getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(String taxRate) {
        this.taxRate = taxRate;
    }

    public String getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(String taxAmount) {
        this.taxAmount = taxAmount;
    }

    public String getTaxPrice() {
        return taxPrice;
    }

    public void setTaxPrice(String taxPrice) {
        this.taxPrice = taxPrice;
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
