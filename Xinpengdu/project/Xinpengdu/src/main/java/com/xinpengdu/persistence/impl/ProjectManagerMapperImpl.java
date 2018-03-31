package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.ProjectManager;
import com.xinpengdu.persistence.ProjectManagerMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 项目经理信息持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午9:57:08
 */
@Repository
public class ProjectManagerMapperImpl extends MybatisRepositorySupport<String, ProjectManager> implements
        ProjectManagerMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.ProjectManagerMapper";
    }

    @Override
    public ProjectManager getProjectManagerEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
