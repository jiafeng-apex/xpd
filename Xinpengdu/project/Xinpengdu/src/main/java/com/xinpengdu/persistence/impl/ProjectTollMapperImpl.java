package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.persistence.ProjectTollMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 工程收费信息持久化服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午9:57:08
 */
@Repository
public class ProjectTollMapperImpl extends MybatisRepositorySupport<String, ProjectToll> implements ProjectTollMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.ProjectTollMapper";
    }

    @Override
    public ProjectToll getProjectTollEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public List<String> getLatelySummary() {
        return getSqlSession().selectList(getNamespace().concat(".getLatelySummary"));
    }

    @Override
    public List<ProjectToll> getProjectTollList(Map<String, Object> params) {
        return getSqlSession().selectList(getNamespace().concat(".getProjectTollList"), params);
    }

    @Override
    public String getImportAmountTotal(String projectId) {
        return getSqlSession().selectOne(getNamespace().concat(".getImportAmountTotal"));
    }

    @Override
    public ProjectToll getByExternalGeldId(String externalGeldId) {
        return this.getSqlSession().selectOne(this.getNamespace() + ".getByExternalGeldId", externalGeldId);
    }

    @Override
    public ProjectToll getLocalDeposit(String projectId) {
        return getSqlSession().selectOne(getNamespace().concat(".getLocalDeposit"), projectId);
    }

    @Override
    public void deleteByProjectId(String projectId) {
        getSqlSession().delete(getNamespace().concat(".deleteByProjectId"), projectId);
    }

    @Override
    public void deleteByExternalGeldId(String id) {
        this.getSqlSession().delete(this.getNamespace() + ".deleteByExternalGeldId", id);
    }

    @Override
    public ProjectToll getProjectTollByTime(Map<String, Object> params) {
        return this.getSqlSession().selectOne(this.getNamespace() + ".getProjectTollByTime", params);
    }

    @Override
    public void updateTollBalance(Map<String, Object> params) {
        this.getSqlSession().update(this.getNamespace() + ".updateTollBalance", params);
    }
}
