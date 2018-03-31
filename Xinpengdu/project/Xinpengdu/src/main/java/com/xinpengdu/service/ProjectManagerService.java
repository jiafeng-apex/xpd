package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.ProjectInfo;
import com.xinpengdu.entity.project.ProjectManager;
import com.xinpengdu.persistence.ProjectManagerMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


/**
 * 项目经理信息服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ProjectManagerService {

    @Autowired
    private ProjectManagerMapper projectManagerMapper;

    @Autowired
    private ProjectInfoService projectInfoService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = projectManagerMapper.count(params);
        List<Map<String, Object>> list = projectManagerMapper.queryList(params);
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

    public List<ProjectManager> query(Object value) {
        return projectManagerMapper.query(value);
    }

    public void save(ProjectManager projectManager) {
        if (null == projectManager.getPmId() || projectManager.getPmId() == "" || projectManager.getPmId().equals("")) {
            projectManager.setPmId(UUID.randomUUID().toString());
        }
        String createDate = DateUtil.dateTime2String(new Date());
        projectManager.setCreateDate(createDate);
        projectManager.setLastUpdateDate(createDate);
        projectManagerMapper.save(projectManager);
    }

    public ProjectManager get(String id) {
        return projectManagerMapper.get(id);
    }

    public ProjectManager getProjectManagerEditInfo(Map<String, Object> params) {
        return projectManagerMapper.getProjectManagerEditInfo(params);
    }

    public void update(ProjectManager projectManager) {
        projectManager.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        projectManagerMapper.update(projectManager);
    }

    public String deleteById(String id) {
        // 判断该项目经理是否关联有项目工程，如果有则不能删除
        Map<String, Object> params = new HashMap<>();
        params.put("pmId", id);
        List<ProjectInfo> projectInfoList = projectInfoService.getList(params);
        if (projectInfoList != null && projectInfoList.size() > 0) {
            JSONObject result = Tool.getFailureReturnJSONObject();
            result.put("msg", "projectManagerNotLost");
            return result.toString();
        }
        projectManagerMapper.deleteById(id);
        return Tool.getSuccessReturnJSONObject().toString();
    }

}
