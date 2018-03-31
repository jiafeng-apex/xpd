package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 授权人信息
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午9:14:43
 */
public class Certigier implements Serializable {
    private static final long serialVersionUID = 1L;

    private String certigierId; // 授权人Id
    private String projectId;   // 项目编号
    private String certigierName; // 授权人
    private String certigierTel; // 授权人联系电话
    private String accreditStart; // 授权日期
    private String accreditEnd; // 授权到期日期
    private String remark; // 备注
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间

    public String getCertigierId() {
        return certigierId;
    }

    public void setCertigierId(String certigierId) {
        this.certigierId = certigierId;
    }

    public String getCertigierName() {
        return certigierName;
    }

    public void setCertigierName(String certigierName) {
        this.certigierName = certigierName;
    }

    public String getCertigierTel() {
        return certigierTel;
    }

    public void setCertigierTel(String certigierTel) {
        this.certigierTel = certigierTel;
    }

    public String getAccreditStart() {
        return accreditStart;
    }

    public void setAccreditStart(String accreditStart) {
        this.accreditStart = accreditStart;
    }

    public String getAccreditEnd() {
        return accreditEnd;
    }

    public void setAccreditEnd(String accreditEnd) {
        this.accreditEnd = accreditEnd;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
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
