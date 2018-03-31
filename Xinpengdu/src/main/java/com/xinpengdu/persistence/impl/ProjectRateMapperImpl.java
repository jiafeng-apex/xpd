package com.xinpengdu.persistence.impl;

import com.xinpengdu.common.mybatis.MybatisRepositorySupport;
import com.xinpengdu.entity.project.ProjectRate;
import com.xinpengdu.persistence.ProjectRateMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 工程费率信息持久化服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午9:57:08
 */
@Repository
public class ProjectRateMapperImpl extends MybatisRepositorySupport<String, ProjectRate> implements ProjectRateMapper {

    @Override
    protected String getNamespace() {
        return "com.xinpengdu.persistence.ProjectRateMapper";
    }

    @Override
    public ProjectRate getProjectRateEditInfo(Map<String, Object> params) {
        return getSqlSession().selectOne(getNamespace().concat(".getEditInfo"), params);
    }

}
