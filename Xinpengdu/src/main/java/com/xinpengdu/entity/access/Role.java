package com.xinpengdu.entity.access;

import com.xinpengdu.common.enums.access.USER_TYPE;

/**
 * 角色信息
 */
public class Role {

    private Long roleId;                            //角色ID
    private String roleName;                        //角色名称, VARCHAR(30)
    private USER_TYPE requiredUserType;        //可使用的最低用户类型
    private String description;                        //角色描述, VARCHAR(255)
    private boolean editable;                        //是否可编辑

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public USER_TYPE getRequiredUserType() {
        return requiredUserType;
    }

    public void setRequiredUserType(USER_TYPE requiredUserType) {
        this.requiredUserType = requiredUserType;
    }

    public boolean isEditable() {
        return editable;
    }

    public void setEditable(boolean editable) {
        this.editable = editable;
    }
}
