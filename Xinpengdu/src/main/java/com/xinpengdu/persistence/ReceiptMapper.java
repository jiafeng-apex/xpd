package com.xinpengdu.persistence;

import com.xinpengdu.entity.project.Receipt;

import java.util.List;
import java.util.Map;

/**
 * 收据信息持久化服务类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:42:49
 */
public interface ReceiptMapper {

    int count(Map<String, Object> params);

    List<Map<String, Object>> queryList(Map<String, Object> params);

    List<Receipt> query(Object value);

    void save(Receipt receipt);

    Receipt get(String id);

    Receipt getReceiptEditInfo(Map<String, Object> params);

    void update(Receipt receipt);

    void deleteById(String id);

}
