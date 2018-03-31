package com.xinpengdu.entity.access;


/**
 * 角色权限关联信息
 */
public class UserPermissionRecord {

    private Long recordId;                            //关联记录ID
    private Long userId;                            //用户ID
    private Long menuId;                            //菜单ID
    private String permissionCode;                  //权限编码

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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
