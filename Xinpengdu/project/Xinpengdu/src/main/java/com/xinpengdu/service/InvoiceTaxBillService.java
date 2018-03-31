package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.InvoiceTaxBill;
import com.xinpengdu.persistence.InvoiceTaxBillMapper;
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
 * 发票税单信息服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation= Propagation.REQUIRED)
public class InvoiceTaxBillService {

    @Autowired
    private InvoiceTaxBillMapper invoiceTaxBillMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = invoiceTaxBillMapper.count(params);
        List<Map<String, Object>> list = invoiceTaxBillMapper.queryList(params);
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

    public List<Map<String, Object>> query(Object value) {
        return invoiceTaxBillMapper.query(value);
    }

    public InvoiceTaxBill save(InvoiceTaxBill invoiceTaxBill) {
        invoiceTaxBill.setInvoiceTaxBillId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        invoiceTaxBill.setCreateDate(createDate);
        invoiceTaxBill.setLastUpdateDate(createDate);
        invoiceTaxBillMapper.save(invoiceTaxBill);
        return invoiceTaxBill;
    }

    public InvoiceTaxBill get(String id) {
        InvoiceTaxBill invoiceTaxBill = invoiceTaxBillMapper.get(id);
        return invoiceTaxBill;
    }

    public InvoiceTaxBill getInvoiceTaxBillEditInfo(Map<String, Object> params) {
        return invoiceTaxBillMapper.getInvoiceTaxBillEditInfo(params);
    }

    public void update(InvoiceTaxBill invoiceTaxBill) {
        invoiceTaxBill.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        invoiceTaxBillMapper.update(invoiceTaxBill);
    }

    public void deleteById(String id) {
        invoiceTaxBillMapper.deleteById(id);
    }

}
