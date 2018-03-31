package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.MD5Util;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.access.UserPermissionRecord;
import com.xinpengdu.entity.project.Operater;
import com.xinpengdu.persistence.OperaterMapper;
import com.xinpengdu.persistence.UserPermissionRecordMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 操作用户业务服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2015-12-30 下午9:06:34
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OperaterService {

    @Autowired
    private OperaterMapper operaterMapper;

    @Autowired
    private UserPermissionRecordMapper userPermissionRecordMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = operaterMapper.count(params);
        List<Map<String, Object>> list = operaterMapper.queryList(params);
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

    public void save(Operater operater) {
        String createDate = DateUtil.dateTime2String(new Date());
        operater.setCreateDate(createDate);
        operater.setLastUpdateDate(createDate);
        operaterMapper.save(operater);
    }

    public Operater get(String id) {
        return operaterMapper.get(id);
    }

    public Operater getOperaterEditInfo(Map<String, Object> params) {
        return operaterMapper.getOperaterEditInfo(params);
    }

    public Operater checkOperater(String loginName, String operaterPwd) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("loginName", loginName);
        params.put("operaterPwd", operaterPwd);
        return operaterMapper.checkOperater(params);
    }


    public void update(Operater operater) {
        operater.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        operaterMapper.update(operater);
    }

    public void deleteById(String id) {
        operaterMapper.deleteById(id);
    }

    public String resetPwdById(String id) {
        Operater operater = operaterMapper.get(id);
        if (operater == null) {
            return Tool.getJsonMsgReturn(false, "operaterNotExist");
        }
        operater.setOperaterPwd(MD5Util.getMD5("123456"));
        return Tool.getSuccessReturnJSONObject().toString();
    }

    public void changePwd(String operaterId, String operaterNewPwd) {
        Operater operater = new Operater();
        operater.setOperaterId(operaterId);
        operater.setOperaterPwd(operaterNewPwd);
        operaterMapper.update(operater);
    }

    /**
     * 个人修改密码，uuid由Session获取
     *
     * @param accessInfo
     * @param oldPassword
     * @param newPassword
     * @return
     */
    public String personalModifyPassword(AccessInfo accessInfo, String oldPassword, String newPassword) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("loginName", accessInfo.getLoginName());
        params.put("operaterPwd", MD5Util.getMD5(oldPassword));
        Operater operater = operaterMapper.checkOperater(params);
        if (operater == null) {
            return Tool.getJsonMsgReturn(false, "oldPasswordError");
        }
        operater.setOperaterPwd(MD5Util.getMD5(newPassword));
        operater.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        operaterMapper.update(operater);
        return Tool.getJsonMsgReturn(true, "");
    }


    public Operater getOperaterByLoginName(String loginName) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("loginName", loginName);
        return operaterMapper.getOperaterByLoginName(params);
    }

    public void doGrant(Long userId,String chkValues) {
        //删除 原有权限记录 在保存新勾选的
        userPermissionRecordMapper.deleteByUserId(userId);
        String[] chk_values=chkValues.split(";");
        for (int i = 0; i <chk_values.length ; i++) {
            String[] chk_val=chk_values[i].split("_");
            UserPermissionRecord userPermissionRecord=new UserPermissionRecord();
            userPermissionRecord.setUserId(userId);
            userPermissionRecord.setMenuId(Long.parseLong(chk_val[0]));
            userPermissionRecord.setPermissionCode(chk_val[1]);
            userPermissionRecordMapper.save(userPermissionRecord);
        }
    }
}
