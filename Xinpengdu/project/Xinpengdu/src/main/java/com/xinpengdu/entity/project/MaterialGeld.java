package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 材料支付款
 * Created by jiafeng on 17/7/14.
 */
public class MaterialGeld implements Serializable {
    private static final long serialVersionUID = 1L;

    private String materialGeldId;              // 材料支付款主键
    private String projectId;                   // 项目Id
    private String materialContractId;          // 材料合同Id

    private String summary;                     // 摘要
    private String payDate;                     // 支付日期
    private String payAmount;                   // 支付金额
    private String cumulativePayAmount;         // 累计支付金额
    private String noPayAmount;                 // 未付款金额
    private String isAutoTransfer;              // 是否自动转入，默认转入
    private String remark;                      // 备注

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    public String getMaterialGeldId() {
        return materialGeldId;
    }

    public void setMaterialGeldId(String materialGeldId) {
        this.materialGeldId = materialGeldId;
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
}
