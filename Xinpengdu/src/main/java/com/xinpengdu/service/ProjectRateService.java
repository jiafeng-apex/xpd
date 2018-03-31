package com.xinpengdu.service;


import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.ProjectRate;
import com.xinpengdu.persistence.ProjectRateMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 工程费率信息服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation= Propagation.REQUIRED)
public class ProjectRateService {

    @Autowired
    private ProjectRateMapper projectRateMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = projectRateMapper.count(params);
        List<Map<String, Object>> list = projectRateMapper.queryList(params);
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

    public List<ProjectRate> query(Object value) {
        return projectRateMapper.query(value);
    }

    public void save(ProjectRate projectRate) {
        projectRate.setProjectRateId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        projectRate.setCreateDate(createDate);
        projectRate.setLastUpdateDate(createDate);
        projectRateMapper.save(projectRate);
    }

    public ProjectRate get(String id) {
        return projectRateMapper.get(id);
    }

    public ProjectRate getProjectRateEditInfo(Map<String, Object> params) {
        return projectRateMapper.getProjectRateEditInfo(params);
    }

    public void update(ProjectRate projectRate) {
        projectRate.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        projectRateMapper.update(projectRate);
    }

    public void deleteById(String id) {
        projectRateMapper.deleteById(id);
    }

}
