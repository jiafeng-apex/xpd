package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.ProjectInfo;
import com.xinpengdu.persistence.ProjectInfoMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * 项目信息持久化服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:31
 */
@Repository
public class ProjectInfoMapperImpl extends MybatisRepositorySupport<String, ProjectInfo> implements ProjectInfoMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.ProjectInfoMapper";
    }

    @Override
    public ProjectInfo getProjectInfoEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

    @Override
    public Map<String,Object> getProjectInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getProjectInfo"), params);
    }

    @Override
    public List<ProjectInfo> getList(Map<String, Object> params) {
        return getSqlSession().selectList(getNamespace().concat(".getList"), params);
    }

    @Override
    public String getLatestProjectId() {
        return getSqlSession().selectOne(getNamespace().concat(".getLatestProjectId"));
    }

    @Override
    public int getProjectCountByPmId(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getProjectCountByPmId"), params);
    }

    @Override
    public List<ProjectInfo> getListByInvoiceSyncDate(Map<String, Object> params){
        return getSqlSession().selectList(getNamespace().concat(".getListByInvoiceSyncDate"), params);
    }
}
