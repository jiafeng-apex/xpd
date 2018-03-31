package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.ProjectInfo;

import java.util.List;
import java.util.Map;


/**
 * 项目信息持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface ProjectInfoMapper {

    int count(Map<String, Object> params);

    List<Map<String,Object>> queryList(Map<String, Object> params);

    List<ProjectInfo> getList(Map<String, Object> params);

    void save(ProjectInfo projectInfo);

    ProjectInfo get(String id);

    ProjectInfo getProjectInfoEditInfo(Map<String, Object> params);

    Map<String,Object> getProjectInfo(Map<String, Object> params);

    String getLatestProjectId();

    void update(ProjectInfo projectInfo);

    void deleteById(String id);

    int getProjectCountByPmId(Map<String, Object> params);

    List<ProjectInfo> getListByInvoiceSyncDate(Map<String, Object> params);
}
