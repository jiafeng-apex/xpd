package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 操作人员管理
 * 
 * @author Sunjf
 * 
 *         2015-12-30 下午8:59:51
 */
public class Operater implements Serializable {
    private static final long serialVersionUID = 1L;

    private String operaterId; // 员工编号
    private String loginName; // 登录名
    private String operaterName; // 姓名
    private String operaterPwd; // 密码
    private String deptName; // 部门
    private String postId; // 岗位
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间

    public String getOperaterId() {
        return operaterId;
    }

    public void setOperaterId(String operaterId) {
        this.operaterId = operaterId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getOperaterPwd() {
        return operaterPwd;
    }

    public void setOperaterPwd(String operaterPwd) {
        this.operaterPwd = operaterPwd;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getOperaterName() {
        return operaterName;
    }

    public void setOperaterName(String operaterName) {
        this.operaterName = operaterName;
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
