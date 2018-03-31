package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 发票
 *
 * @author jiafeng
 * @create 2017-08-25 16:43
 **/
public class Invoice implements Serializable {
    private static final long serialVersionUID = 1L;

    private String invoiceId;                   // 编号
    private String projectId;                   // 项目编号
    private String externalInvoiceId;           // 外部Id （ 材料发票Id / 劳务费发票Id）

    private String invoiceNumber;               // 发票号
    private String invoiceDate;                 // 日期
    private String summary;                     // 摘要
    private String taxRate;                     // 税率
    private String invoiceAmount;               // 金额
    private String taxTotal;                    // 税价合计
    private String tax;                         // 税额
    private String invoiceType;                 // 发票类型
    private String incomeTaxCalcType;           // 所得税计算类型(外地开出去发票的时候 需要有选择 1：按税价合计 2：按金额 默认税价合计)
    private String remark;                      // 备注

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    private String invoiceTaxBill;
    private String invoiceTaxBill_1;
    private String invoiceTaxBill_2;


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

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(String taxRate) {
        this.taxRate = taxRate;
    }

    public String getInvoiceAmount() {
        return invoiceAmount;
    }

    public void setInvoiceAmount(String invoiceAmount) {
        this.invoiceAmount = invoiceAmount;
    }

    public String getTaxTotal() {
        return taxTotal;
    }

    public void setTaxTotal(String taxTotal) {
        this.taxTotal = taxTotal;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
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

    public String getIncomeTaxCalcType() {
        return incomeTaxCalcType;
    }

    public void setIncomeTaxCalcType(String incomeTaxCalcType) {
        this.incomeTaxCalcType = incomeTaxCalcType;
    }

    public String getInvoiceTaxBill() {
        return invoiceTaxBill;
    }

    public void setInvoiceTaxBill(String invoiceTaxBill) {
        this.invoiceTaxBill = invoiceTaxBill;
    }

    public String getInvoiceTaxBill_1() {
        return invoiceTaxBill_1;
    }

    public void setInvoiceTaxBill_1(String invoiceTaxBill_1) {
        this.invoiceTaxBill_1 = invoiceTaxBill_1;
    }

    public String getInvoiceTaxBill_2() {
        return invoiceTaxBill_2;
    }

    public void setInvoiceTaxBill_2(String invoiceTaxBill_2) {
        this.invoiceTaxBill_2 = invoiceTaxBill_2;
    }

    public String getExternalInvoiceId() {
        return externalInvoiceId;
    }

    public void setExternalInvoiceId(String externalInvoiceId) {
        this.externalInvoiceId = externalInvoiceId;
    }
}
