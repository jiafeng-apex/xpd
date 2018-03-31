package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.ProjectRate;

import java.util.List;
import java.util.Map;

/**
 * 工程费率信息持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface ProjectRateMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<ProjectRate> query(Object value);

    void save(ProjectRate projectRate);

    ProjectRate get(String id);

    ProjectRate getProjectRateEditInfo(Map<String, Object> params);

    void update(ProjectRate projectRate);

    void deleteById(String id);

}
