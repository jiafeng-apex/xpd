package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 项目经理
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午9:05:14
 */
public class ProjectManager implements Serializable {
    private static final long serialVersionUID = 1L;

    private String pmId; // 编号
    private String pmName; // 姓名
    private String pmSex; // 性别
    private String pmPhone; // 手机
    private String pmTelphone; // 电话
    private String pmFax; // 传真
    private String pmEmail; // 邮箱
    private String projectTotal; // 项目总余额
    private String remark; // 备注
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间

    public String getPmId() {
        return pmId;
    }

    public void setPmId(String pmId) {
        this.pmId = pmId;
    }

    public String getPmName() {
        return pmName;
    }

    public void setPmName(String pmName) {
        this.pmName = pmName;
    }

    public String getPmSex() {
        return pmSex;
    }

    public void setPmSex(String pmSex) {
        this.pmSex = pmSex;
    }

    public String getPmPhone() {
        return pmPhone;
    }

    public void setPmPhone(String pmPhone) {
        this.pmPhone = pmPhone;
    }

    public String getPmTelphone() {
        return pmTelphone;
    }

    public void setPmTelphone(String pmTelphone) {
        this.pmTelphone = pmTelphone;
    }

    public String getPmFax() {
        return pmFax;
    }

    public void setPmFax(String pmFax) {
        this.pmFax = pmFax;
    }

    public String getPmEmail() {
        return pmEmail;
    }

    public void setPmEmail(String pmEmail) {
        this.pmEmail = pmEmail;
    }

    public String getProjectTotal() {
        return projectTotal;
    }

    public void setProjectTotal(String projectTotal) {
        this.projectTotal = projectTotal;
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
