package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.Receipt;
import com.xinpengdu.persistence.ReceiptMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;


/**
 * 收据信息服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation= Propagation.REQUIRED)
public class ReceiptService {

    @Autowired
    private ReceiptMapper receiptMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = receiptMapper.count(params);
        List<Map<String, Object>> list = receiptMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        return jsonObject.toString();
    }

    public List<Receipt> query(Object value) {
        return receiptMapper.query(value);
    }

    public void save(Receipt receipt) {
        receipt.setReceiptId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        receipt.setCreateDate(createDate);
        receipt.setLastUpdateDate(createDate);
        receiptMapper.save(receipt);
    }

    public Receipt get(String id) {
        return receiptMapper.get(id);
    }

    public Receipt getReceiptEditInfo(Map<String, Object> params) {
        return receiptMapper.getReceiptEditInfo(params);
    }

    public void update(Receipt receipt) {
        receipt.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        receiptMapper.update(receipt);
    }

    public void deleteById(String id) {
        receiptMapper.deleteById(id);
    }

}
