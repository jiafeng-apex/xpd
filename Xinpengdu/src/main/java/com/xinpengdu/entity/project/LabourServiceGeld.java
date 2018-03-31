package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 劳务支付款
 * Created by jiafeng on 17/7/14.
 */
public class LabourServiceGeld implements Serializable {
    private static final long serialVersionUID = 1L;

    private String labourServiceGeldId;         // 劳务支付款主键Id
    private String projectId;                   // 项目Id
    private String labourServiceFeeId;          // 劳务费Id
    private String externalInvoiceId;           // 外部Id  （ 材料发票Id / 劳务费发票Id）

    private String summary;                     // 摘要
    private String payDate;                     // 日期
    private String payAmount;                   // 支付金额
    private String cumulativePayAmount;         // 累计支付金额
    private String noPayAmount;                 // 未付款金额
    private String isAutoTransfer;              // 是否自动转入，默认转入
    private String remark;                      // 备注

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    public String getLabourServiceGeldId() {
        return labourServiceGeldId;
    }

    public void setLabourServiceGeldId(String labourServiceGeldId) {
        this.labourServiceGeldId = labourServiceGeldId;
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

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(String payAmount) {
        this.payAmount = payAmount;
    }

    public String getCumulativePayAmount() {
        return cumulativePayAmount;
    }

    public void setCumulativePayAmount(String cumulativePayAmount) {
        this.cumulativePayAmount = cumulativePayAmount;
    }

    public String getNoPayAmount() {
        return noPayAmount;
    }

    public void setNoPayAmount(String noPayAmount) {
        this.noPayAmount = noPayAmount;
    }

    public String getIsAutoTransfer() {
        return isAutoTransfer;
    }

    public void setIsAutoTransfer(String isAutoTransfer) {
        this.isAutoTransfer = isAutoTransfer;
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
