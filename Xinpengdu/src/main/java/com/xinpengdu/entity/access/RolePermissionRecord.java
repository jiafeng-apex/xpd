package com.xinpengdu.entity.access;


import com.xinpengdu.common.enums.access.PERMISSION;

/**
 * 角色权限关联信息
 */
public class RolePermissionRecord {

    private Long recordId;                            //关联记录ID
    private Long roleId;                            //角色ID
    private PERMISSION permission;                    //权限枚举，VARCHAR(100)
    private Long menuId;                            //菜单ID
    private String permissionCode;                  //权限编码

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public PERMISSION getPermission() {
        return permission;
    }

    public void setPermission(PERMISSION permission) {
        this.permission = permission;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public String getPermissionCode() {
        return permissionCode;
    }

    public void setPermissionCode(String permissionCode) {
        this.permissionCode = permissionCode;
    }
}
