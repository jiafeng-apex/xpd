package com.xinpengdu.common.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.util.Assert;

import java.util.List;
import java.util.Map;

/**
 * Created by jiafeng on 17/7/26.
 */
public abstract class MybatisRepositorySupport<PK, T> extends SqlSessionDaoSupport {
    public MybatisRepositorySupport() {
    }

    public T get(PK id) {
        Assert.notNull(id, "id must not be null!");
        return this.getSqlSession().selectOne(this.getNamespace() + ".get", id);
    }

    public void save(T entity) {
        Assert.notNull(entity, "entity must not be null!");
        this.getSqlSession().insert(this.getNamespace() + ".save", entity);
    }

    public void update(T entity) {
        Assert.notNull(entity, "entity must not be null!");
        this.getSqlSession().update(this.getNamespace() + ".update", entity);
    }

    public void delete(T entity) {
        Assert.notNull(entity, "entity must not be null!");
        this.getSqlSession().delete(this.getNamespace() + ".delete", entity);
    }

    public void deleteById(PK id) {
        Assert.notNull(id, "id must not be null!");
        this.getSqlSession().delete(this.getNamespace() + ".deleteById", id);
    }

    public List<T> query(Object value) {
        return this.getSqlSession().selectList(this.getNamespace() + ".query", value);
    }

    public int count(Map<String, Object> params) {
        return getSqlSession().selectOne(this.getNamespace().concat(".count"), params);
    }

    public List<Map<String, Object>> queryList(Map<String, Object> params) {
        Assert.notNull(params, "params must not be null!");
        List<Map<String, Object>> result = this.getSqlSession().selectList(this.getNamespace() + ".queryList", params);
        return result;
    }

    protected abstract String getNamespace();
}
