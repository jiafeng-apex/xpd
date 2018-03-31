package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.ProjectManager;

import java.util.List;
import java.util.Map;

/**
 * 项目经理信息持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface ProjectManagerMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<ProjectManager> query(Object value);

    void save(ProjectManager projectManager);

    ProjectManager get(String id);

    ProjectManager getProjectManagerEditInfo(Map<String, Object> params);

    void update(ProjectManager projectManager);

    void deleteById(String id);

}
