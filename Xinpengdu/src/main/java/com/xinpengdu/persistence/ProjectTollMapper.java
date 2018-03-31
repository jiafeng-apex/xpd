package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.ProjectToll;

import java.util.List;
import java.util.Map;

/**
 * 工程收费信息持久化服务类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:42:49
 */
public interface ProjectTollMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<ProjectToll> query(Object value);

    List<ProjectToll> getProjectTollList(Map<String, Object> params);

    String getImportAmountTotal(String projectId);

    void save(ProjectToll projectToll);

    ProjectToll get(String id);

    ProjectToll getByExternalGeldId(String externalGeldId);

    ProjectToll getProjectTollEditInfo(Map<String, Object> params);

    ProjectToll getLocalDeposit(String projectId);

    void update(ProjectToll projectToll);

    void deleteById(String id);

    void deleteByProjectId(String projectId);

    List<String> getLatelySummary();

    void deleteByExternalGeldId(String id);

    ProjectToll getProjectTollByTime(Map<String, Object> params);

    void updateTollBalance(Map<String, Object> params);

}
