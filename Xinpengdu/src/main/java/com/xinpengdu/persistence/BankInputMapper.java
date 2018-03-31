package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.BankInput;

import java.util.List;
import java.util.Map;

/**
 * 银行录入持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface BankInputMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<BankInput> query(Object value);

    void save(BankInput bankInput);

    BankInput get(String id);

    BankInput getBankInputEditInfo(Map<String, Object> params);

    void update(BankInput bankInput);

    void deleteById(String id);

}
