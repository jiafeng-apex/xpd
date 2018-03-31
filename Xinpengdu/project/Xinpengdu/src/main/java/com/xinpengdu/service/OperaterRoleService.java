package com.xinpengdu.service;

import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.entity.access.Role;
import com.xinpengdu.persistence.RoleMapper;
import com.xinpengdu.persistence.RolePermissionRecordMapper;
import com.xinpengdu.persistence.UserPermissionRecordMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户权限服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OperaterRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RolePermissionRecordMapper rolePermissionRecordMapper;

    @Autowired
    private UserPermissionRecordMapper userPermissionRecordMapper;

    /**
     * 初始化用户菜单权限操作界面
     *
     * @param postId
     * @param session
     */
    public void initializeMenuPermissions(String postId, HttpSession session) {
        long roleId = Long.parseLong(postId);
        List<Map<String, Object>> permissionList = rolePermissionRecordMapper.getPermissionListByRoleId(roleId);
        if (permissionList != null && permissionList.size() > 0) {
            for (Map<String, Object> permissionInfo : permissionList) {
                String menuCode = permissionInfo.get("menuCode").toString();
                String permissionCode = permissionInfo.get("permissionCode").toString();
                session.setAttribute(ControllerTool.SESSION_PERMISSION_PREFIX + menuCode + "_" + permissionCode, true);
            }
        }
    }

    /**
     * 获取用户菜单
     *
     * @param postId
     */
    public List<Map<String, Object>> getPermissionListByRoleId(String postId) {
        long roleId = Long.parseLong(postId);
        List<Map<String, Object>> permissionList = rolePermissionRecordMapper.getDistinctPermissionListByRoleId(roleId);
        if (permissionList != null && permissionList.size() > 0) {
            return permissionList;
        }
        return null;
    }


    public List<Role> query(Object value) {
        return roleMapper.query(value);
    }

    public void save(Role role) {
        roleMapper.save(role);
    }

    public Role get(String id) {
        return roleMapper.get(id);
    }

    public Role getRoleEditInfo(Map<String, Object> params) {
        return roleMapper.getRoleEditInfo(params);
    }

    public void update(Role role) {
        roleMapper.update(role);
    }

    public void deleteById(String id) {
        roleMapper.deleteById(id);
    }


    /**
     * 获取用户菜单
     *
     * @param user_id
     */
    public List<Map<String, Object>> getMenuListByUserId(String user_id) {
        long userId = Long.parseLong(user_id);
        List<Map<String, Object>> permissionList = userPermissionRecordMapper.getDistinctPermissionListByUserId(userId);
        if (permissionList != null && permissionList.size() > 0) {
            return permissionList;
        }
        return null;
    }

    /**
     * 获取用户菜单
     *
     * @param user_id
     */
    public List<Map<String, Object>> getPermissionListByUserId(String user_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", user_id);
        List<Map<String, Object>> permissionList = userPermissionRecordMapper.getPermissionListByUserId(params);
        if (permissionList != null && permissionList.size() > 0) {
            return permissionList;
        }
        return null;
    }


    /**
     * 初始化用户菜单权限操作界面
     *
     * @param user_id
     * @param session
     */
    public void initializeMenuPermissionsByUser(String user_id, HttpSession session) {
        long userId = Long.parseLong(user_id);
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("permissionCode",null);

        List<Map<String, Object>> permissionList = userPermissionRecordMapper.getPermissionListByUserId(params);
        Map<String, Boolean> writePermission=new HashMap<String,Boolean>();
        Map<String, Boolean> readPermission=new HashMap<String,Boolean>();
        if (permissionList != null && permissionList.size() > 0) {
            for (Map<String, Object> permissionInfo : permissionList) {
                String menuCode = permissionInfo.get("menuCode").toString();
                String permissionCode = permissionInfo.get("permissionCode").toString();
                session.setAttribute(ControllerTool.SESSION_PERMISSION_PREFIX + menuCode + "_" + permissionCode, true);
                if("WRITE".equals(permissionCode)){
                    writePermission.put(menuCode,true);
                }
                if("READ".equals(permissionCode)){
                    readPermission.put(menuCode,true);
                }
            }
        }
        JSONObject obj = new JSONObject();
        JSONObject writeJson=obj.fromObject(writePermission);
        session.setAttribute("writePermission",writeJson.toString());
        JSONObject readJson=obj.fromObject(readPermission);
        session.setAttribute("readPermission",readJson.toString());
    }
}
