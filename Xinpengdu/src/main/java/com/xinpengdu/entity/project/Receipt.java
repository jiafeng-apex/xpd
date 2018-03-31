package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 收据
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午9:09:00
 */
public class Receipt implements Serializable {
    private static final long serialVersionUID = 1L;

    private String receiptId; // 编号
    private String projectId;   // 项目编号
    private String receiptDate; // 日期
    private String receiptNO; // 收据号
    private String receiptAmount; // 收据金额
    private String remark; // 备注
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间

    public String getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId;
    }

    public String getReceiptAmount() {
        return receiptAmount;
    }

    public void setReceiptAmount(String receiptAmount) {
        this.receiptAmount = receiptAmount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(String receiptDate) {
        this.receiptDate = receiptDate;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getReceiptNO() {
        return receiptNO;
    }

    public void setReceiptNO(String receiptNO) {
        this.receiptNO = receiptNO;
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
