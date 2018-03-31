package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.LabourServiceFee;
import com.xinpengdu.persistence.LabourServiceFeeMapper;
import com.xinpengdu.persistence.LabourServiceGeldMapper;
import com.xinpengdu.persistence.LabourServiceInvoiceMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 劳务费服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class LabourServiceFeeService {

    @Autowired
    private LabourServiceFeeMapper labourServiceFeeMapper;

    @Autowired
    private LabourServiceGeldMapper labourServiceGeldMapper;

    @Autowired
    private LabourServiceInvoiceMapper labourServiceInvoiceMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = labourServiceFeeMapper.count(params);
        List<Map<String, Object>> list = labourServiceFeeMapper.queryList(params);
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

    public List<LabourServiceFee> query(Object value) {
        return labourServiceFeeMapper.query(value);
    }

    public void save(LabourServiceFee labourServiceFee) {
        labourServiceFee.setLabourServiceFeeId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        labourServiceFee.setCreateDate(createDate);
        labourServiceFee.setLastUpdateDate(createDate);
        labourServiceFeeMapper.save(labourServiceFee);
    }

    public LabourServiceFee get(String id) {
        return labourServiceFeeMapper.get(id);
    }

    public LabourServiceFee getLabourServiceFeeEditInfo(Map<String, Object> params) {
        return labourServiceFeeMapper.getLabourServiceFeeEditInfo(params);
    }

    public void update(LabourServiceFee labourServiceFee) {
        labourServiceFee.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        labourServiceFeeMapper.update(labourServiceFee);
    }

    public String deleteById(String id) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("labourServiceFeeId", id);
        long geldCount = labourServiceGeldMapper.count(params);
        if (geldCount > 0) {
            return Tool.getJsonMsgReturn(false, "labourServiceGeldError");
        }
        long invoiceCount = labourServiceInvoiceMapper.count(params);
        if (invoiceCount > 0) {
            return Tool.getJsonMsgReturn(false, "labourServiceInvoiceError");
        }
        labourServiceFeeMapper.deleteById(id);
        return Tool.getAppSuccessReturnJSONObject().toString();
    }

}
