package com.xinpengdu.service;

import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.persistence.MenuMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 操作菜单业务服务实现类
 *
 * @author xlguo
 *         <p/>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private OperaterRoleService operaterRoleService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = menuMapper.count(params);
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> list = menuMapper.queryList(params);
        //userid 拥有的权限
        List<Map<String, Object>> permissionRecordList = operaterRoleService.getPermissionListByUserId(params.get("userId").toString());
        for (Map<String, Object> map : list) {
            if(permissionRecordList!=null) {
                for (Map<String, Object> permiss : permissionRecordList) {
                    if (map.get("menuId").toString().equals(permiss.get("menuId").toString())) {
                        if (permiss.get("permissionCode").toString().equals("READ")) {
                            map.put("READ", "Y");
                        }
                        if (permiss.get("permissionCode").toString().equals("WRITE")) {
                            map.put("READ", "Y");
                            map.put("WRITE", "Y");
                        }
                    }
                }
            }
            resultList.add(map);
        }
        JSONObject resultObj = Tool.getJsonDataReturn(total, resultList);
        return resultObj.toString();
    }

}
