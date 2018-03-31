package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 外出证延期信息
 *
 * @author Sunjf
 *         <p/>
 *         2015-12-30 下午9:14:43
 */
public class EvectionPostpone implements Serializable {
    private static final long serialVersionUID = 1L;

    private String postponeId;  // 外出证延期Id
    private String evectionId;  // 外出证Id
    private String postponeNumber; // 外出证延期号码
    private String postponeStartDate; // 外出证延期日期
    private String postponeEndDate; // 外出证延期后到期日期
    private String postponeAmount; // 延期后外出证金额
    private String remark; // 备注
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间

    public String getPostponeId() {
        return postponeId;
    }

    public void setPostponeId(String postponeId) {
        this.postponeId = postponeId;
    }

    public String getPostponeNumber() {
        return postponeNumber;
    }

    public void setPostponeNumber(String postponeNumber) {
        this.postponeNumber = postponeNumber;
    }

    public String getPostponeStartDate() {
        return postponeStartDate;
    }

    public void setPostponeStartDate(String postponeStartDate) {
        this.postponeStartDate = postponeStartDate;
    }

    public String getPostponeEndDate() {
        return postponeEndDate;
    }

    public void setPostponeEndDate(String postponeEndDate) {
        this.postponeEndDate = postponeEndDate;
    }

    public String getPostponeAmount() {
        return postponeAmount;
    }

    public void setPostponeAmount(String postponeAmount) {
        this.postponeAmount = postponeAmount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getEvectionId() {
        return evectionId;
    }

    public void setEvectionId(String evectionId) {
        this.evectionId = evectionId;
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
