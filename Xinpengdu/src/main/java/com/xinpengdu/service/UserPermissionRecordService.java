package com.xinpengdu.service;

import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.UserPermissionRecord;
import com.xinpengdu.persistence.UserPermissionRecordMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 用户权限服务实现类
 *
 * @author xlguo
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class UserPermissionRecordService {

    @Autowired
    private UserPermissionRecordMapper userPermissionRecordMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = userPermissionRecordMapper.count(params);
        List<Map<String, Object>> list = userPermissionRecordMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        return jsonObject.toString();
    }

    public List<UserPermissionRecord> query(Object value) {
        return userPermissionRecordMapper.query(value);
    }

    public void save(UserPermissionRecord userPermissionRecord) {
        userPermissionRecordMapper.save(userPermissionRecord);
    }

    public UserPermissionRecord get(String id) {
        return userPermissionRecordMapper.get(id);
    }

    /**
     * 初始化 普通管理员 默认权限
     * @param userId
     */
    public void initNormalUserPermission(Long userId){
        UserPermissionRecord userPermissionRecord=new UserPermissionRecord();
        userPermissionRecord.setUserId(userId);
        userPermissionRecord.setMenuId(1L);//工程核算
        userPermissionRecord.setPermissionCode("READ");//读
        userPermissionRecordMapper.save(userPermissionRecord);
        for (long i =6; i <= 18; i++) {//工程核算下面子模块功能 读权限
            UserPermissionRecord userPermissionRecord2=new UserPermissionRecord();
            userPermissionRecord2.setUserId(userId);
            userPermissionRecord2.setMenuId(i);
            userPermissionRecord2.setPermissionCode("READ");//读
            userPermissionRecordMapper.save(userPermissionRecord2);
        }
    }

    /**
     * 初始化 超级管理员 默认权限
     * @param userId
     */
    public void initSystemUserPermission(Long userId){
        for (long i =1; i <= 18; i++) {//18个菜单 模块 全部都有权限
            UserPermissionRecord userPermissionRecord=new UserPermissionRecord();
            userPermissionRecord.setUserId(userId);
            userPermissionRecord.setMenuId(i);
            userPermissionRecord.setPermissionCode("READ");//读
            userPermissionRecordMapper.save(userPermissionRecord);
            UserPermissionRecord userPermissionRecord2=new UserPermissionRecord();
            userPermissionRecord.setUserId(userId);
            userPermissionRecord.setMenuId(i);
            userPermissionRecord.setPermissionCode("WRITE");//读
            userPermissionRecordMapper.save(userPermissionRecord2);
        }
    }

}
