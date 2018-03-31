package com.xinpengdu.entity.project;

import java.io.Serializable;
import java.util.List;

/**
 * 外出证管理
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午9:07:29
 */
public class Evection implements Serializable {
    private static final long serialVersionUID = 1L;

    private String evectionId; // 编号
    private String projectId;   // 项目编号
    private String evectionNO; // 外出证号
    private String startDate; // 外出证开出日期
    private String endDate; // 外出证到期日期
    private String evectionAmount; // 外出证金额
    private String remark; // 备注
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间
    private List<EvectionPostpone> postponeList;   // 外出证延期集合

    public String getEvectionId() {
        return evectionId;
    }

    public void setEvectionId(String evectionId) {
        this.evectionId = evectionId;
    }

    public String getEvectionNO() {
        return evectionNO;
    }

    public void setEvectionNO(String evectionNO) {
        this.evectionNO = evectionNO;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getEvectionAmount() {
        return evectionAmount;
    }

    public void setEvectionAmount(String evectionAmount) {
        this.evectionAmount = evectionAmount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<EvectionPostpone> getPostponeList() {
        return postponeList;
    }

    public void setPostponeList(List<EvectionPostpone> postponeList) {
        this.postponeList = postponeList;
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
